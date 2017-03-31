package com.qubiezhen.common;


import java.sql.*;

/**
 * Created by yangj on 2016/12/5.
 */
public class DBUnit {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/qubiezhen?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "bishe";
    private static final String PASSWORD = "bishe";
    private static Connection conn = null;

    public static Connection getConnetction() {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return conn;
        }
    }

    public static void close(Connection conn, PreparedStatement pstm, ResultSet rs) {
        try {
            if (conn != null) {
                conn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection conn, Statement stm, ResultSet rs) {
        try {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
