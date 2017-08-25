<%-- 
    Document   : base
    Created on : 22/08/2017, 08:24:46 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.io.*"  %>
        <%
            String contra = request.getParameter("nombre");
            String nombre = request.getParameter("apellido_pat");
            String estado = request.getParameter("apellido_mat");
            String sexo = request.getParameter("escuela");
            
            Connection con = null;
            Statement sta = null;
            
            try
            {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost/formulario","root","n0m3l0");
            sta=con.createStatement();
            }
            catch (SQLException error)
            {
                out.println(error.toString());
            }
            
            try{
            
            sta.executeUpdate("insert into datos values('"+contra+"','"+nombre+"','"+estado+"','"+sexo+"');");
            out.println("<script>alert('Registro dado de alta  exitosamente.')</script>");
            con.close();
                
                
            }
            catch(SQLException error){
            out.println(error.toString());
            }
            con.close();
            %>
    </body>
</html>
  
