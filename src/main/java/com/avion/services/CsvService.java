package com.avion.services;

import com.avion.entities.User;
import com.avion.services.UserService;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Service
public class CsvService {

    @Autowired
    private UserService userService;

    public List<User> parseCsvFile(MultipartFile file) {
        List<User> users = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8));
             CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withFirstRecordAsHeader())) {

            for (CSVRecord record : csvParser) {
                User user = new User(
                        record.get("Name"),
                        record.get("Email"),
                        Integer.parseInt(record.get("Age"))
                );
                users.add(user);
                userService.saveUser(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }


}
