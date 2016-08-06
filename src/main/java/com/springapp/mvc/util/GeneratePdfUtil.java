package com.springapp.mvc.util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.springapp.mvc.domain.hmc.Hmc;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GeneratePdfUtil {

    private static PdfPTable getHeaderTable(String path) throws DocumentException, IOException {
        PdfPTable headerTable = new PdfPTable(3);
        headerTable.setWidthPercentage(100);
        headerTable.setWidths(new float[]{1.5f,0.5f,2f});

        Image imgLogo = Image.getInstance(path + "/images/logotype.png");
        PdfPCell cell1 = new PdfPCell(imgLogo,true);
        cell1.setBorder(Rectangle.NO_BORDER);

        PdfPCell cell2 = new PdfPCell();
        cell2.setBorder(Rectangle.NO_BORDER);

        Font font = new Font(Font.FontFamily.TIMES_ROMAN, 14);
        Font greenFont = new Font(Font.FontFamily.TIMES_ROMAN, 14);
        greenFont.setColor(new BaseColor(89, 178, 16));

        PdfPCell cell3 = new PdfPCell();
        Paragraph paragraph = new Paragraph();
        Chunk chunk = new Chunk("Vertical and horizontal machine centers\nUSA: ",font);
        paragraph.add(chunk);
        chunk = new Chunk("+1 203 556-50-69",greenFont);
        paragraph.add(chunk);
        chunk = new Chunk("\ncontact@",font);
        paragraph.add(chunk);
        chunk = new Chunk("vmccnc.com",greenFont);
        paragraph.add(chunk);
        paragraph.setAlignment(Element.ALIGN_RIGHT);
        cell3.addElement(paragraph);
        cell3.setBorder(Rectangle.NO_BORDER);

        headerTable.addCell(cell1);
        headerTable.addCell(cell2);
        headerTable.addCell(cell3);

        return headerTable;
    }

    private static void setForWhoData(Document document, String company, String director) throws DocumentException {
        Font fontBoldBig = new Font(Font.FontFamily.TIMES_ROMAN,22,Font.BOLD);
        Font fontNormal = new Font(Font.FontFamily.TIMES_ROMAN,13);

        Paragraph paragraph = new Paragraph("\nCommercial proposal",fontBoldBig);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        document.add(paragraph);

        paragraph = new Paragraph();
        Chunk chunk;
        if(!company.equals("")) {
            chunk = new Chunk("\nto the director of " + company, fontNormal);
            paragraph.add(chunk);
            if(!director.equals("")) {
                chunk = new Chunk(", " + director, fontNormal);
                paragraph.add(chunk);
            }
        } else if(!director.equals("")) {
            chunk = new Chunk("for " + director, fontNormal);
            paragraph.add(chunk);
        }
        DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
        Date date = new Date();
        chunk = new Chunk("\nfrom " + dateFormat.format(date), fontNormal);
        paragraph.add(chunk);

        document.add(paragraph);
    }

    private static PdfPTable getOrderTable(String products, Hmc[] machines) throws DocumentException {
        PdfPTable orderTable = new PdfPTable(6);
        orderTable.setWidthPercentage(100);
        orderTable.setSpacingBefore(20f);
        orderTable.setSpacingAfter(10f);
        orderTable.setWidths(new float[]{0.8f, 5f, 5f, 3f, 2.5f, 3f});

        Font fontForHead = new Font(Font.FontFamily.TIMES_ROMAN,13,Font.BOLD);
        Font fontForBody = new Font(Font.FontFamily.TIMES_ROMAN,12);

        PdfPCell[] orderCells = new PdfPCell[6];
        orderCells[0] = new PdfPCell(new Paragraph());
        orderCells[1] = new PdfPCell(new Paragraph("Machine",fontForHead));
        orderCells[2] = new PdfPCell(new Paragraph("Model",fontForHead));
        orderCells[3] = new PdfPCell(new Paragraph("Price",fontForHead));
        orderCells[4] = new PdfPCell(new Paragraph("Quantity",fontForHead));
        orderCells[5] = new PdfPCell(new Paragraph("Total",fontForHead));
        for(PdfPCell cell : orderCells) {
            cell.setBackgroundColor(new BaseColor(238,238,238));
            cell.setBorderColor(new BaseColor(22, 22, 22));
            cell.setBorderWidth(1);
            orderTable.addCell(cell);
        }

        String[] productsArr = products.split(";");
        int orderTotal = 0;
        for (int i = 0; i < machines.length; i++) {
            orderCells[0] = new PdfPCell(new Paragraph(String.valueOf(i + 1),fontForBody));
            orderCells[0].setHorizontalAlignment(Element.ALIGN_CENTER);
            orderCells[1] = new PdfPCell(new Paragraph(machines[i].getMachineTypeEn(),fontForBody));
            orderCells[2] = new PdfPCell(new Paragraph(machines[i].getModel(),fontForBody));
            int price = machines[i].getPrice();
            orderCells[3] = new PdfPCell(new Paragraph("$" + price + ".00",fontForBody));
            String num = productsArr[i].split(",")[1];
            orderCells[4] = new PdfPCell(new Paragraph(num,fontForBody));
            orderCells[4].setHorizontalAlignment(Element.ALIGN_CENTER);
            int total = price * Integer.parseInt(num);
            orderTotal += total;
            orderCells[5] = new PdfPCell(new Paragraph("$" + String.valueOf(total) + ".00",fontForBody));
            for(PdfPCell cell : orderCells) {
                cell.setBackgroundColor(new BaseColor(238,238,238));
                cell.setBorderColor(new BaseColor(22,22,22));
                cell.setBorderWidth(1);
                orderTable.addCell(cell);
            }
        }

        orderCells[0] = new PdfPCell(new Paragraph("Order total",fontForBody));
        orderCells[0].setColspan(5);
        orderCells[0].setHorizontalAlignment(Element.ALIGN_RIGHT);
        orderCells[1] = new PdfPCell(new Paragraph("$" + String.valueOf(orderTotal) + ".00",fontForBody));
        for (int i = 0; i < 2; i++) {
            orderCells[i].setBackgroundColor(new BaseColor(238,238,238));
            orderCells[i].setBorderColor(new BaseColor(22, 22, 22));
            orderCells[i].setBorderWidth(1);
            orderTable.addCell(orderCells[i]);
        }

        return orderTable;
    }

    private static PdfPTable getOrderTableWithoutPrices(String products, Hmc[] machines) throws DocumentException {
        PdfPTable orderTable = new PdfPTable(4);
        orderTable.setWidthPercentage(100);
        orderTable.setSpacingBefore(20f);
        orderTable.setSpacingAfter(10f);
        orderTable.setWidths(new float[]{0.8f, 8f, 8f, 2.5f});

        Font fontForHead = new Font(Font.FontFamily.TIMES_ROMAN,13,Font.BOLD);
        Font fontForBody = new Font(Font.FontFamily.TIMES_ROMAN,12);

        PdfPCell[] orderCells = new PdfPCell[4];
        orderCells[0] = new PdfPCell(new Paragraph());
        orderCells[1] = new PdfPCell(new Paragraph("Machine",fontForHead));
        orderCells[2] = new PdfPCell(new Paragraph("Model",fontForHead));
        orderCells[3] = new PdfPCell(new Paragraph("Quantity",fontForHead));
        for(PdfPCell cell : orderCells) {
            cell.setBackgroundColor(new BaseColor(238,238,238));
            cell.setBorderColor(new BaseColor(22, 22, 22));
            cell.setBorderWidth(1);
            orderTable.addCell(cell);
        }

        String[] productsArr = products.split(";");
        for (int i = 0; i < machines.length; i++) {
            orderCells[0] = new PdfPCell(new Paragraph(String.valueOf(i + 1),fontForBody));
            orderCells[0].setHorizontalAlignment(Element.ALIGN_CENTER);
            orderCells[1] = new PdfPCell(new Paragraph(machines[i].getMachineTypeEn(),fontForBody));
            orderCells[2] = new PdfPCell(new Paragraph(machines[i].getModel(),fontForBody));
            String num = productsArr[i].split(",")[1];
            orderCells[3] = new PdfPCell(new Paragraph(num,fontForBody));
            orderCells[3].setHorizontalAlignment(Element.ALIGN_CENTER);
            for(PdfPCell cell : orderCells) {
                cell.setBackgroundColor(new BaseColor(238,238,238));
                cell.setBorderColor(new BaseColor(22,22,22));
                cell.setBorderWidth(1);
                orderTable.addCell(cell);
            }
        }

        return orderTable;
    }


    private static PdfPTable getItemTable(String path, Hmc machine, boolean showPrice) throws DocumentException, IOException {
        PdfPTable itemTable = new PdfPTable(4);
        itemTable.setWidthPercentage(100);
        itemTable.setSpacingBefore(20f);
        itemTable.setSpacingAfter(10f);
        itemTable.setWidths(new float[]{1f, 1f, 1f, 1f});

        Font fontBold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD);
        Font font = new Font(Font.FontFamily.TIMES_ROMAN,12);

        PdfPCell[] itemCells = new PdfPCell[4];

        Image img;
        try {
            img = Image.getInstance(path + "/images/products/" + machine.getPhoto1());
            img.setScaleToFitHeight(false);
            itemCells[0] = new PdfPCell(img, true);
        } catch (Exception e) {
            itemCells[0] = new PdfPCell(new Paragraph(""));
        }
        itemCells[0].setColspan(2);
        itemCells[0].setPadding(1);
        itemCells[1] = new PdfPCell();
        itemCells[1].addElement(new Paragraph(machine.getModel(), fontBold));
        itemCells[1].addElement(new Paragraph(machine.getMachineTypeEn() + "\n" + machine.getBrand() + ", "
                + machine.getProducingCountryEn() + ", " + machine.getProductionYear() + "\nCurrent location: "
                + machine.getMachineLocationEn() + "\nCondition: " + machine.getMachineConditionEn()
                + "\nDescription:\n" + machine.getDescriptionEn().replace("<br>",""), font));
        itemCells[1].setColspan(2);
        itemCells[1].setRowspan(2);
        itemCells[1].setPadding(5);
        for (int i = 0; i < 2; i++) {
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        try {
            img = Image.getInstance(path + "/images/products/" + machine.getPhoto2());
            img.setScaleToFitHeight(false);
            itemCells[0] = new PdfPCell(img, true);
        } catch (Exception e) {
            itemCells[0] = new PdfPCell(new Paragraph(""));
        }
        try {
            img = Image.getInstance(path + "/images/products/" + machine.getPhoto3());
            img.setScaleToFitHeight(false);
            itemCells[1] = new PdfPCell(img, true);
        } catch (Exception e) {
            itemCells[1] = new PdfPCell(new Paragraph(""));
        }
        for (int i = 0; i < 2; i++) {
            itemCells[i].setPadding(1);
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        itemCells[0] = new PdfPCell(new Paragraph("System CNC", font));
        itemCells[1] = new PdfPCell(new Paragraph(machine.getFullSystemCNC(), font));
        itemCells[2] = new PdfPCell(new Paragraph("X×Y×Z-motion, mm", font));
        itemCells[3] = new PdfPCell(new Paragraph(machine.getxMotion() + "×" + machine.getyMotion()
                + "×" + machine.getzMotion(), font));
        for (int i = 0; i < 4; i++) {
            itemCells[i].setBackgroundColor(new BaseColor(238, 238, 238));
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        itemCells[0] = new PdfPCell(new Paragraph("Spindle taper", font));
        itemCells[1] = new PdfPCell(new Paragraph(machine.getSpindleTaper(), font));
        itemCells[2] = new PdfPCell(new Paragraph("X×Y table sizes, mm", font));
        itemCells[3] = new PdfPCell(new Paragraph(machine.getxTableSize() + "×" + machine.getyTableSize(), font));
        for (int i = 0; i < 4; i++) {
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        itemCells[0] = new PdfPCell(new Paragraph("Spindle rotation frequency, rev/min", font));
        itemCells[1] = new PdfPCell(new Paragraph(String.valueOf(machine.getSpindleRotationFreq()), font));
        itemCells[2] = new PdfPCell(new Paragraph("Table load, kg", font));
        itemCells[3] = new PdfPCell(new Paragraph(String.valueOf(machine.getTableLoad()), font));
        for (int i = 0; i < 4; i++) {
            itemCells[i].setBackgroundColor(new BaseColor(238, 238, 238));
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        itemCells[0] = new PdfPCell(new Paragraph("Spindle power, kw", font));
        itemCells[1] = new PdfPCell(new Paragraph(machine.getSpindlePower(), font));
        itemCells[2] = new PdfPCell(new Paragraph("Tool count, pcs.", font));
        itemCells[3] = new PdfPCell(new Paragraph(String.valueOf(machine.getToolCount()), font));
        for (int i = 0; i < 4; i++) {
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        itemCells[0] = new PdfPCell(new Paragraph("Tool replacement time, sec", font));
        itemCells[1] = new PdfPCell(new Paragraph(machine.getToolReplacementTime(), font));
        itemCells[2] = new PdfPCell(new Paragraph("Max tool diameter, mm", font));
        itemCells[3] = new PdfPCell(new Paragraph(String.valueOf(machine.getMaxToolDiameter()), font));
        for (int i = 0; i < 4; i++) {
            itemCells[i].setBackgroundColor(new BaseColor(238, 238, 238));
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        itemCells[0] = new PdfPCell(new Paragraph("Chip replacement time, sec", font));
        itemCells[1] = new PdfPCell(new Paragraph(machine.getChipReplacementTime(), font));
        itemCells[2] = new PdfPCell(new Paragraph("Max tool weight, kg", font));
        itemCells[3] = new PdfPCell(new Paragraph(String.valueOf(machine.getMaxToolWeight()), font));
        for (int i = 0; i < 4; i++) {
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        itemCells[0] = new PdfPCell(new Paragraph("Spindle runtime, h", font));
        itemCells[1] = new PdfPCell(new Paragraph(String.valueOf(machine.getSpindleRuntime()), font));
        itemCells[2] = new PdfPCell(new Paragraph("Machine launching, h", font));
        itemCells[3] = new PdfPCell(new Paragraph(String.valueOf(machine.getMachineLaunching()), font));
        for (int i = 0; i < 4; i++) {
            itemCells[i].setBackgroundColor(new BaseColor(238, 238, 238));
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        itemCells[0] = new PdfPCell(new Paragraph("Position/reposition precision, mm", font));
        itemCells[1] = new PdfPCell(new Paragraph(machine.getPositionRepositionPrecision(), font));
        itemCells[2] = new PdfPCell(new Paragraph("Machine launching, h", font));
        itemCells[3] = new PdfPCell(new Paragraph(String.valueOf(machine.getMachineLaunching()), font));
        for (int i = 0; i < 4; i++) {
            itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
            itemTable.addCell(itemCells[i]);
        }

        if(showPrice) {
            itemCells[1] = new PdfPCell(new Paragraph(""));
            itemCells[1].setColspan(2);
            itemCells[2] = new PdfPCell(new Paragraph("Price", font));
            itemCells[3] = new PdfPCell(new Paragraph("$" + machine.getPrice() + ".00", font));
            for (int i = 1; i < 4; i++) {
                itemCells[i].setBackgroundColor(new BaseColor(238, 238, 238));
                itemCells[i].setBorderColor(new BaseColor(22, 22, 22));
                itemTable.addCell(itemCells[i]);
            }
        }

        return itemTable;
    }

    private static Paragraph getFooterParagraph() {
        Font font = new Font(Font.FontFamily.TIMES_ROMAN, 14);
        Font fontSmall = new Font(Font.FontFamily.TIMES_ROMAN, 12);
        Font fontSmallGreen = new Font(Font.FontFamily.TIMES_ROMAN, 12);
        fontSmallGreen.setColor(new BaseColor(89, 178, 16));

        Paragraph paragraph = new Paragraph();
        Chunk chunk = new Chunk("VMC & HMC",font);
        paragraph.add(chunk);
        chunk = new Chunk("\nvertical and horizontal machine centers\nUSA: ",fontSmall);
        paragraph.add(chunk);
        chunk = new Chunk("+1 203 556-50-69",fontSmallGreen);
        paragraph.add(chunk);
        chunk = new Chunk("\ncontact@",fontSmall);
        paragraph.add(chunk);
        chunk = new Chunk("vmccnc.com",fontSmallGreen);
        paragraph.add(chunk);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        return paragraph;
    }

    public static String createPDF(String path, String products, Hmc[] machines, String company, String director, boolean showPrice) throws Exception {
        Document document = new Document(PageSize.A4,50,50,50,50);
        String pathPdf = path + "/offer.pdf";
        PdfWriter.getInstance(document, new FileOutputStream(pathPdf));
        document.open();

        document.add(getHeaderTable(path));
        setForWhoData(document,company,director);
        if(!showPrice){
            document.add(getOrderTableWithoutPrices(products, machines));
        } else {
            document.add(getOrderTable(products, machines));
        }
        for(Hmc machine : machines) {
            document.add(getItemTable(path, machine, showPrice));
        }
        document.add(getFooterParagraph());

        document.close();
        return pathPdf;
    }

    public static String createPDFSingle(String path, Hmc machine, String company, String director, boolean showPrice) throws Exception {
        Document document = new Document(PageSize.A4,50,50,50,50);
        String pathPdf = path + "/offer-single.pdf";
        PdfWriter.getInstance(document, new FileOutputStream(pathPdf));
        document.open();

        document.add(getHeaderTable(path));
        setForWhoData(document,company,director);
        document.add(getItemTable(path, machine, showPrice));
        document.add(getFooterParagraph());

        document.close();
        return pathPdf;
    }

}
