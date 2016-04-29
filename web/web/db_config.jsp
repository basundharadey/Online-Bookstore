<%@page import="java.util.*,java.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleDriver" %>

<%
    /*To set the database connections*/
    DriverManager.registerDriver(new OracleDriver());  //important for first time
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bookshop","badsa");
%>