/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.*;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {"/authenticator"})
public class authenticator extends HttpServlet {

   public String authenticate(String email, String password) throws SQLException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
            
               
                encryption enc = new encryption(); 
                String encryptedPass = enc.encrypting(password);
                
                dbConnect conn = new dbConnect();
                //checking for the salt for the user//
                PreparedStatement statementSelectingSaltUser = conn.prepareStatement("SELECT salt FROM users WHERE email = ? ");
                statementSelectingSaltUser.setString(1,email);
                ResultSet resultSalt = statementSelectingSaltUser.executeQuery();
                //if else to put the salt value to the string//
                if (resultSalt.next()){
                  String userSalt = resultSalt.getString("salt"); 
                  String fullPass = encryptedPass+userSalt;
                  //checking if the hash plus salt from databas//
                  PreparedStatement statementCheckingUser = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND hashAndSalt = ?");
                  statementCheckingUser.setString(1,email);
                  statementCheckingUser.setString(2,fullPass);
                  ResultSet resultUser = statementCheckingUser.executeQuery();
                  if (resultUser.next()){
                  return "success";
                  }
                  else{
                  return "faliure";
                  }
                }
            
                else {
                   return "faliure";
                }
                
            
             

            
	}
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet authenticator</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet authenticator at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
