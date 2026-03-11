package com.hrms.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/hr_system";
    private static final String USER = "root";
    private static final String PASSWORD = "krish@1020";   

    private static Connection connection = null;

    public static Connection getConnection() {

        try {

            if (connection == null || connection.isClosed()) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                connection = DriverManager.getConnection(URL, USER, PASSWORD);

                System.out.println("Database connected successfully");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}