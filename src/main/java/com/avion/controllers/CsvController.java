package com.avion.controllers;

import com.avion.entities.User;
import com.avion.services.CsvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/csv")
public class CsvController {

    @Autowired
    private CsvService csvService;

    @GetMapping("/upload")
    public String showUploadPage() {
        return "csv/import";
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, Model model) {
        if (file.isEmpty()) {
            model.addAttribute("message", "Veuillez sélectionner un fichier CSV.");
            return "csv/import";
        }

        List<User> users = csvService.parseCsvFile(file);
        model.addAttribute("users", users);
        return "users/userList";
    }
}
