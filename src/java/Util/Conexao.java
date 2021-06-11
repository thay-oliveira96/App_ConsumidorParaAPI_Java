/*
Nome:Thaynan Rodrigues de Oliveira      RGM: 11191102746
Nome: Vinicius Gonzales Egidio          RGM: 11191101856
Materia: Sistema da Informação          Turma: 5SIB
Materia: Sistemas Distribuidos e Padrões de Projetos Orientado a Objeto
 */
package Util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 * @author Thaynan
 */
public class Conexao {
    
    public static String sendGet(String url, String method) throws Exception {
        URL objurl = new URL(url);
        HttpURLConnection con = (HttpURLConnection) objurl.openConnection();

        con.setRequestMethod(method);
       
        int responseCode = con.getResponseCode();

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer result = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            result.append(inputLine);
        }
        return result.toString();
    }
    public static void sendPost(String url, String urlParams, String method) throws Exception {
        URL objurl = new URL(url);
        HttpURLConnection con = (HttpURLConnection) objurl.openConnection();

        con.setRequestMethod(method);
        con.setRequestProperty("Content-Type", "application/json");

        con.setDoOutput(true);
        DataOutputStream dout = new DataOutputStream(con.getOutputStream());
        dout.writeBytes(urlParams);
        dout.flush();
        dout.close();

        int responseCode = con.getResponseCode();
        System.out.println("Resposta..: " + responseCode);

    }
}


