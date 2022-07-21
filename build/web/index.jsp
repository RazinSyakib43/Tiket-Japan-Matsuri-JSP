<%-- 
    Document   : index
    Created on : Jul 10, 2022, 11:49:38 AM
    Author     : Razin Syakib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>

<% Connection connection=null;
    Statement statement=null;
    ResultSet rs=null;
    try {
        String connectionURL = "jdbc:mysql://localhost/tiket_japan_matsuri";
        String username="root";
        String password="";
        Class.forName("com.mysql.jdbc.Driver");
        connection=DriverManager.getConnection(connectionURL, username, password);
        
        statement=connection.createStatement();
        String query="SELECT * FROM `pendaftaran` JOIN kelamin_peserta ON pendaftaran.`kd_kelamin`=kelamin_peserta.`kd_kelamin`"
        + "JOIN tiket ON pendaftaran.`kd_tiket`=tiket.`kd_tiket`"
        + "JOIN metode_bayar ON pendaftaran.`kd_metode`=metode_bayar.`kd_metode`"
        + "JOIN admin ON pendaftaran.`kd_admin`=admin.`kd_admin`";
        rs=statement.executeQuery(query);
    %>
    <a href="tambah.jsp">Tambah Data Peserta</a><br/>
    <table border="1">
        <tr>
            <th>No Pendaftaran</th>
            <th>Nama Peserta</th>
            <th>No Telp Peserta</th>
            <th>Jenis Kelamin</th>
            <th>Nama Tiket</th>
            <th>Harga</th>
            <th>Metode Pembayaran</th>
            <th>Nama Admin</th>
        </tr>
        <% while (rs.next()){ %>
        <tr>
            <td> <%out.println(rs.getInt("nomor_pendaftaran"));%> </td>
            <td> <%out.println(rs.getString("nama_peserta"));%> </td>
            <td> <%out.println(rs.getString("no_telp_peserta"));%> </td>
            <td> <%out.println(rs.getString("jenis_kelamin"));%> </td>
            <td> <%out.println(rs.getString("nama_tiket"));%> </td>
            <td> <%out.println(rs.getString("harga_tiket"));%> </td>
            <td> <%out.println(rs.getString("nama_metode"));%> </td>
            <td> <%out.println(rs.getString("nama_admin"));%> </td>
        </tr>
        <% } %>
    </table>
    <%
        rs.close();
        statement.close();
        connection.close();
    
    } catch (Exception e) {
        System.err.println("GAGAL KONEKSI"+e.getMessage());
        out.println("GAGAL"+e.getMessage());
    }
    %>

