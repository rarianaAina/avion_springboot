package com.avion.controllers;

import com.avion.services.ConfigurationService;
import com.avion.services.ReservationService;
import com.avion.services.VolService;
import com.avion.entities.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.avion.entities.Configuration;
import com.avion.entities.Vol;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import java.util.List;


@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private VolService volService;

    @Autowired
    private ReservationService reservationService;

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

    @GetMapping
    public String listeReservations(Model model) {
        System.out.println("Tonga eto");
        List<Reservation> reservationList = reservationService.getAllReservation();
        System.out.println(reservationList.size());
        for(int i=0; i<reservationList.size(); i++) {
            System.out.println(reservationList.get(i));
        }
        model.addAttribute("reservations", reservationList);
        return "reservations/reservationList";
    }

    @GetMapping("/reservation/{id}/pdf")
    public ResponseEntity<byte[]> getReservationPdf(@PathVariable String id) throws DocumentException, IOException {
        Reservation reservation = reservationService.getReservationById(id);

        if (reservation == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        // Création du document PDF
        Document document = new Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);

        document.open();
        document.add(new Paragraph("Reservation Details"));
        document.add(new Paragraph("ID: " + reservation.getIdReservation()));
        document.add(new Paragraph("Date: " + reservation.getDateReservation()));
        document.add(new Paragraph("Price: " + reservation.getPrix()));
        document.add(new Paragraph("Seat Type: " + reservation.getIdTypeSiege()));
        document.close();

        byte[] pdfContent = baos.toByteArray();

        // Définir les headers pour le téléchargement du fichier PDF
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=reservation_" + reservation.getIdReservation() + ".pdf");

        return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
    }

}
