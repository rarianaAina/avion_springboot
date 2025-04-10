package com.avion.controllers;

import com.avion.services.ConfigurationService;
import com.avion.services.VolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.avion.entities.Configuration;
import com.avion.entities.Vol;

import java.util.List;


@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private VolService volService;

    @Autowired
    private ConfigurationService configurationService;

    @GetMapping("/nouvelle")
    public String nouvelleConfiguration(Model model) {
        List<Vol> volList = volService.getAllVols();
        System.out.println(volList.size());
        for(int i=0; i<volList.size(); i++) {
            System.out.println(volList.get(i));
        }
        model.addAttribute("vols", volList);
        model.addAttribute("configurations", new Configuration());
        return "configuration/form";
    }

/*    @PostMapping("/sauvegarder")
    public ResponseEntity<Configuration> sauvegarderConfiguration(@RequestBody Configuration configuration) {
        try {
            Configuration savedConfiguration = configurationService.saveConfiguration(configuration);
            return ResponseEntity.ok(savedConfiguration);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }*/

    @PostMapping("/sauvegarder")
    public String sauvegarderConfiguration(@ModelAttribute Configuration configuration) {
        configurationService.saveConfiguration(configuration);
        return "redirect:/reservations/volList";
    }

    @GetMapping("/volList")
    public String listeProduits(Model model) {
        System.out.println("Tonga eto");
        List<Vol> volList = volService.getAllVols();
        System.out.println(volList.size());
        for(int i=0; i<volList.size(); i++) {
            System.out.println(volList.get(i));
        }
        model.addAttribute("vols", volList);
        return "configuration/volList";
    }


}
