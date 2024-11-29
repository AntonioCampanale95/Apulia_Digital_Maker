package DbEsame;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class TestDAODbEsame {
    
    private static String driver = "org.postgresql.Driver";
    private static String url = "jdbc:postgresql://127.0.0.1:5432/dbesame";
    private static String user = "postgres";
    private static String password = "admin";
    
    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }
}