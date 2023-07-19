package com.school.database_proj;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Database {
    String url = "jbdc:postgresql://localhost:5432/springboot";
    String username = "postgres";
    String password = "3010";
    Connection con;

    Database()  {
        try {
            this.con = DriverManager.getConnection(url, username, password);
            System.out.println("Database connected successfully");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
