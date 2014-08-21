package clases;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Reportes {

    public static void reporteFacturas(ResultSet rs) {
        Document documento = new Document();
        try {
            String archivo = "C:\\Users\\JUAN CARLOS\\Documents\\NetBeansProjects\\JavaWEB\\build\\web\\images\\Reporte.pdf";
            PdfWriter.getInstance(documento, new FileOutputStream(archivo));
            documento.open();

            // Colocamos titulo al reporte
            String texto = "REPORTE FACTURAS";
            Paragraph parrafo = new Paragraph(texto);
            documento.add(parrafo);
            texto = " ";
            parrafo = new Paragraph(texto);
            documento.add(parrafo);

            // Variables de totales
            int totGenCan = 0;
            int totGenVal = 0;
            int totFacCan = 0;
            int totFacVal = 0;


            // Leemos registro del ResultSet
            boolean hayRegistros = rs.next();
            PdfPTable tabla;

            // Ciclo que recorre el Result Set
            while (hayRegistros) {
                // Colocamos encabezado de factura
                tabla = new PdfPTable(2);
                tabla.addCell("ID Factura:");
                tabla.addCell(rs.getString("idFactura"));
                tabla.addCell("ID Cliente:");
                tabla.addCell(rs.getString("idCliente"));
                tabla.addCell("Nombre:");
                tabla.addCell(rs.getString("nombreCompleto"));
                tabla.addCell("Fecha:");
                tabla.addCell(rs.getString("fecha"));
                parrafo = new Paragraph();
                parrafo.add(tabla);
                documento.add(parrafo);

                tabla = new PdfPTable(6);
                tabla.addCell("ID Línea");
                tabla.addCell("ID Producto");
                tabla.addCell("Descripción");
                tabla.addCell("Precio");
                tabla.addCell("Cantidad");
                tabla.addCell("Valor");

                // Inicializamos totales de factura
                totFacCan = 0;
                totFacVal = 0;

                int facturaActual = rs.getInt("idFactura");

                // Adcionamos el detalle de la factura
                while (hayRegistros && facturaActual == rs.getInt("idFactura")) {
                    tabla.addCell(rs.getString("idLinea"));
                    tabla.addCell(rs.getString("idProducto"));
                    tabla.addCell(rs.getString("descripcion"));
                    tabla.addCell(rs.getString("precio"));
                    tabla.addCell(rs.getString("cantidad"));
                    tabla.addCell(rs.getString("valor"));

                    totFacCan += rs.getInt("cantidad");
                    totFacVal += rs.getInt("valor");

                    hayRegistros = rs.next();
                }

                tabla.addCell(" ");
                tabla.addCell(" ");
                tabla.addCell(" ");
                tabla.addCell("TOTAL:");
                tabla.addCell("" + totFacCan);
                tabla.addCell("" + totFacVal);

                totGenCan += totFacCan;
                totGenVal += totFacVal;

                parrafo = new Paragraph();
                parrafo.add(tabla);
                documento.add(parrafo);
                texto = " ";
                parrafo = new Paragraph(texto);
                documento.add(parrafo);
            }

            tabla = new PdfPTable(6);
            tabla.addCell(" ");
            tabla.addCell(" ");
            tabla.addCell(" ");
            tabla.addCell("TOTAL GENERAL:");
            tabla.addCell("" + totGenCan);
            tabla.addCell("" + totGenVal);
            parrafo = new Paragraph();
            parrafo.add(tabla);
            documento.add(parrafo);
        } catch (Exception ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            documento.close();
        }
    }
}
