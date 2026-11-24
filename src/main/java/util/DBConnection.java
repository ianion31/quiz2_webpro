package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://1e44-s.h.filess.io:3307/db_pendaftaran_jsp_pastlength?useSSL=false&allowPublicKeyRetrieval=true",
            "db_pendaftaran_jsp_pastlength",
            "c1a6c63a584fd59e22da4bfaf63d1894aa0c46ee"
        );
    }
}