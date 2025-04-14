package com.avion.services;

import com.avion.entities.Reservation;
import com.avion.entities.TypeSiege;
import com.avion.entities.Vol;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.ByteArrayOutputStream;

@Service
public class PdfService {

    @Autowired
    private VolService volService; // Service pour accéder aux informations du vol
    @Autowired
    private ReservationService reservationService; // Service pour accéder aux informations de la réservation
    @Autowired
    private ConfigurationService configurationService; // Si tu en as besoin pour les configurations

    public byte[] generateReservationPdf(Reservation reservation) throws DocumentException {
        Document document = new Document(PageSize.A4);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);

        document.open();

        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Paragraph title = new Paragraph("Détails de la réservation", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20);
        document.add(title);

        Font regularFont = FontFactory.getFont(FontFactory.HELVETICA, 12);
        Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);

        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);

        // ID de la réservation
        table.addCell(new PdfPCell(new Phrase("ID de réservation:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getIdReservation(), regularFont)));

        // Date de la réservation
        table.addCell(new PdfPCell(new Phrase("Date de réservation:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getDateReservation().toString(), regularFont)));

        // Prix
        table.addCell(new PdfPCell(new Phrase("Prix:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(reservation.getPrix().toString(), regularFont)));

        // Type de siège - en utilisant le service TypeSiege pour récupérer le libellé
        TypeSiege typeSiege = reservationService.getTypeSiege(reservation.getIdTypeSiege());
        table.addCell(new PdfPCell(new Phrase("Type de siège:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(typeSiege.getLibelle(), regularFont)));

        // Nombre de places
        table.addCell(new PdfPCell(new Phrase("Nombre de place:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(String.valueOf(reservation.getNbre_place()), regularFont)));

        table.addCell(new PdfPCell(new Phrase("Nombre d'enfant:", boldFont)));
        table.addCell(new PdfPCell(new Phrase("Enfants", regularFont)));

        table.addCell(new PdfPCell(new Phrase("Nombre d'adulte:", boldFont)));
        table.addCell(new PdfPCell(new Phrase("Adultes", regularFont)));

        // Date du vol - en utilisant le service Vol pour récupérer la date du vol
        Vol vol = volService.getVolById(reservation.getIdVol());
        table.addCell(new PdfPCell(new Phrase("Date du vol:", boldFont)));
        table.addCell(new PdfPCell(new Phrase(vol.getDateVol().toString(), regularFont)));

        document.add(table);

        // Footer
        Font footerFont = FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 10);
        Paragraph footer = new Paragraph("Merci d'avoir réservé avec nous!", footerFont);
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setSpacingBefore(20);
        document.add(footer);

        document.close();
        return baos.toByteArray();
    }
}
