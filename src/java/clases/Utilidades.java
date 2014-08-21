package clases;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utilidades {

    public static String formatDate(Date fecha) {
        if (fecha == null) {
            fecha = new Date();
        }
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy/MM/dd");
        return formatoDelTexto.format(fecha);
    }

    public static Date stringToDate(String fecha) {
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy/MM/dd");
        Date aux = null;
        try {
            aux = formatoDelTexto.parse(fecha);
        } catch (Exception ex) {
        }
        return aux;
    }
    
    public static String tipo(int idTipo) {
        switch(idTipo) {
            case 1: return "Cédula de Ciudadanía";
            case 2: return "Tarjeta de Identidad";
            case 3: return "Registro Cívil";
            case 4: return "Cédula de Extranjería";
            case 5: return "Pasaporte";
            default: return "Sin definir";
        }
    }
    public static String idSemestre(int idSemestre){
        switch(idSemestre){
        case 1: return "1";
        case 2: return "2";
        case 3: return "3";
        case 4: return "4";
        case 5: return "5";
        case 6: return "6";
        case 7: return "7";
        case 8: return "8";
        case 9: return "9";
        case 10: return "10";
        case 11: return "11";
        default: return "no definido";
        }
        
    }
    
    public static String idPrograma(int idPrograma){
        switch(idPrograma){
            case 1: return "Teologia";
            case 2: return "Ingenieria en Sistemas";
            case 3: return "Contaduria Publica";
            case 4: return "Enfermeria";
            case 5: return "Tecnologia en APH";
            case 6: return "Tecnologia en Mercadeo";
            case 7: return "Tecnologia en gestion empresarial";
            case 8: return "Administracion de empresas";
            case 9: return "Licenciatura en preescolar";
            case 10: return "Licenciatura en musica";
            case 11: return "Licenciatura en educacion basica"; 
            default: return "sin definir";
        }
    }
public static String idnacionalidad(int idNacion){
    switch(idNacion){
        case 1:return "Colombia";
        case 2:return "Venezuela";
        case 3:return "Mexico";
        case 4:return "Panama";
        case 5: return "Brazil";
       default:return "sin definir";
    }       
}

public static String idFacultad(int idFacultad){
    switch(idFacultad){
        case 1: return "Facultad Teologia";
        case 2: return "Facultad Salud";
        case 3: return "Facultad Administración";
        case 4: return "Facultada Educacion";
        case 5: return "Facultad Ingenieria";
         default: return "sin definir";
    }
}
/*
public static String idPlan(int idPlan){
    switch(idPlan){
        case 1: return "A";
        case 2: return "B";
        case 3: return "B8";
        case 4: return "C";
            default: return "sin definir";
    }
}
**/
 
    public static String ciudad(int idCiudad) {
        switch(idCiudad) {
            case 1: return "Medellín";
            case 2: return "Bogotá";
            case 3: return "Calí";
            case 4: return "Barranquilla";
            case 5: return "Buscaramanga";
            case 6: return "Pasto";
            case 7: return "Cartagena";
            case 8: return "Santa Marta";
            default: return "Sin definir";
        }
    }
    

    public static boolean isNumeric(String cadena) {
        try {
            Integer.parseInt(cadena);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }

    public static int stringToInt(String cadena) {
        int aux = 0;
        try {
            aux = Integer.parseInt(cadena);
            return aux;
        } catch (NumberFormatException nfe) {
            return aux;
        }
    }
    
    
    
    public static double stringToDouble(String cadena) {
        double aux = 0;
        try {
            aux = Double.parseDouble(cadena);
            return aux;
        } catch (NumberFormatException nfe) {
            return aux;
        }
    }
    
    
    
    
        public static String iva(int idIva) {
        switch(idIva) {
            case 1: return "0%";
            case 2: return "10%";
            case 3: return "16%";
            default: return "Sin definir";
        }
    }
}
