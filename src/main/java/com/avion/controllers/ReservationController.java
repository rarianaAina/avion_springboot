package com.avion.controllers;

import com.avion.services.ConfigurationService;
import com.avion.services.ReservationService;
import com.avion.services.VolService;
import com.avion.entities.Reservation;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.draw.LineSeparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.avion.entities.Configuration;
import com.avion.entities.Vol;
import com.itextpdf.text.*;
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

/*    @GetMapping("/api/{id}/pdf")
    public ResponseEntity<byte[]> getReservationPdf(@PathVariable String id) throws DocumentException, IOException {
        Reservation reservation = reservationService.getReservationById(id);
        System.out.println("Nantsoina");
        if (reservation == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        // Création du document PDF
        Document document = new Document(PageSize.A4);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);

        document.open();

        // Titre principal avec style
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Paragraph title = new Paragraph("Détails de la réservation", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20);
        document.add(title);

        // Informations de la réservation avec des styles différents
        Font regularFont = FontFactory.getFont(FontFactory.HELVETICA, 12);
        Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);

        // Créer une section de texte stylisée pour la réservation
        PdfPTable table = new PdfPTable(2); // Table à 2 colonnes
        table.setWidthPercentage(100); // Table prenant toute la largeur du document

        // Première ligne : ID de réservation
        table.addCell(new PdfPCell(new Phrase("ID de réservation:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getIdReservation(), regularFont)));

        // Deuxième ligne : Date de réservation
        table.addCell(new PdfPCell(new Phrase("Date de réservation:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getDateReservation().toString(), regularFont)));

        // Troisième ligne : Prix
        table.addCell(new PdfPCell(new Phrase("Prix:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getPrix().toString(), regularFont)));

        // Quatrième ligne : Type de siège
        table.addCell(new PdfPCell(new Phrase("Type de siège:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getIdTypeSiege(), regularFont)));

        // Ajouter la table au document
        document.add(table);

        // Ligne de séparation
        document.add(new Chunk("\n"));
        document.add(new LineSeparator());

        // Footer avec texte centré
        Font footerFont = FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 10);
        Paragraph footer = new Paragraph("Merci d'avoir réservé avec nous!", footerFont);
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setSpacingBefore(20);
        document.add(footer);

        // Fermer le document
        document.close();

        byte[] pdfContent = baos.toByteArray();

        // Définir les headers pour le téléchargement du fichier PDF
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=reservation_" + reservation.getIdReservation() + ".pdf");

        return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
    }*/

    @GetMapping("/api/{id}/pdf")
    public ResponseEntity<byte[]> getReservationPdf(@PathVariable String id) throws DocumentException, IOException {
        Reservation reservation = reservationService.getReservationById(id);
        if (reservation == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        // Création du document PDF
        Document document = new Document(PageSize.A4);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);

        document.open();

        // Ajouter du contenu au PDF
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Paragraph title = new Paragraph("Détails de la réservation", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20);
        document.add(title);

        // Informations de réservation (exemple)
        Font regularFont = FontFactory.getFont(FontFactory.HELVETICA, 12);
        Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);

        PdfPTable table = new PdfPTable(2); // Table à 2 colonnes
        table.setWidthPercentage(100); // Table prenant toute la largeur du document

        table.addCell(new PdfPCell(new Phrase("ID de réservation:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getIdReservation(), regularFont)));

        // Deuxième ligne : Date de réservation
        table.addCell(new PdfPCell(new Phrase("Date de réservation:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getDateReservation().toString(), regularFont)));

        // Troisième ligne : Prix
        table.addCell(new PdfPCell(new Phrase("Prix:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getPrix().toString(), regularFont)));

        // Quatrième ligne : Type de siège
        table.addCell(new PdfPCell(new Phrase("Type de siège:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getIdTypeSiege(), regularFont)));

        // Ajouter d'autres informations de la réservation à la table

        document.add(table);

        // Footer avec texte centré
        Font footerFont = FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 10);
        Paragraph footer = new Paragraph("Merci d'avoir réservé avec nous!", footerFont);
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setSpacingBefore(20);
        document.add(footer);

        // Fermer le document PDF
        document.close();

        byte[] pdfContent = baos.toByteArray();

        // Définir les en-têtes pour forcer le téléchargement du fichier PDF
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=reservation_" + reservation.getIdReservation() + ".pdf");
        headers.add("Content-Type", "application/pdf");

        // Retourner la réponse avec le contenu du PDF et les en-têtes pour forcer le téléchargement
        return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
    }

}
