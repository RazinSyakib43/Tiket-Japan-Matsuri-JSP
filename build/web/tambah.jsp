<%-- 
    Document   : tambah
    Created on : Jul 10, 2022, 1:02:58 PM
    Author     : Razin Syakib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tambah Data Peserta</title>
    </head>
    <body>
        <h1>Tambah Data Peserta</h1>
        <form action="" method="POST">
            <label>No Pendaftaran</label> <input type="text" name="nomorpendaftaran"/> <br/>
            <label>Nama Peserta</label> <input type="text" name="namapeserta"/> <br/>
            <label>No Telp Peserta</label> <input type="text" name="notelppeserta"/> <br/>
            <label>Jenis Kelamin</label>
                <select id="kdkelamin" name="kdkelamin">
                    <option value="1">Laki-laki</option>
                    <option value="2">Perempuan</option>
                </select><br/>
            <label>Tiket</label>
                <select id="kdtiket" name="kdtiket">
                    <option value="1">Hari Pertama - 35K</option>
                    <option value="2">Hari Kedua - 35K</option>
                    <option value="3">Paket Bundling Full 2 hari - 60K</option>
                </select><br/>    
            <label>Metode Pembayaran</label>
                <select id="kdmetode" name="kdmetode">
                    <option value="1">Cash</option>
                    <option value="2">DANA</option>
                    <option value="3">ShopeePay</option>
                    <option value="4">Bank BNI (Transfer)</option>
                    <option value="5">Bank Mandiri (Transfer)</option>
            </select><br/>  
            <label>Admin</label>
                <select id="kdadmin" name="kdadmin">
                    <option value="1">Admin Mochi</option>
                    <option value="2">Admin Daem</option>
                    <option value="3">Admin Zhongli</option>
            </select><br/>  
            <input type="submit" name="submit" value="Simpan"/><br/>
            <a href="index.jsp">Kembali</a>
        </form>
    </body>
</html>

<%@page import ="java.sql.*"%>
<%@page import ="javax.swing.*"%>
<%
    //Panggil hasil inputan di form
    String nomorpendaftaran=request.getParameter("nomorpendaftaran");
    String namapeserta=request.getParameter("namapeserta");
    String notelppeserta=request.getParameter("notelppeserta");
    String kdkelamin=request.getParameter("kdkelamin");
    String kdtiket=request.getParameter("kdtiket");
    String kdmetode=request.getParameter("kdmetode");
    String kdadmin=request.getParameter("kdadmin");
    String URL = "jdbc:mysql://localhost/tiket_japan_matsuri";
    //Koneksi database
    Connection conn = null;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    int updateQuery=0;
    //Notifikasi bahwa seluruh form tidak boleh kosong
    if (nomorpendaftaran!=null && namapeserta!=null && notelppeserta!=null && kdkelamin!=null && kdtiket!=null && kdmetode!=null && kdadmin!=null) {
        try {
            conn=DriverManager.getConnection(URL,"root","");
            String query = "INSERT INTO pendaftaran (nomor_pendaftaran, nama_peserta, no_telp_peserta, `kd_kelamin`,`kd_tiket`, `kd_metode`, `kd_admin`) VALUES (?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, nomorpendaftaran);
            ps.setString(2, namapeserta);
            ps.setString(3, notelppeserta);
            ps.setString(4, kdkelamin);
            ps.setString(5, kdtiket);
            ps.setString(6, kdmetode);
            ps.setString(7, kdadmin);
            updateQuery=ps.executeUpdate();
            if(updateQuery!=0) {
                JOptionPane.showMessageDialog(null,"Berhasil Tambah Data Mahasiswa");
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        } finally {
            ps.close();
            conn.close();
        }
    }
%>