package ex10;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static void main(String[] args) {
        try {
            // 라이브러리가 정상적으로 추가 되었는지 확인
            Class.forName("oracle.jdbc.driver.OracleDriver");


            // url, id, pw
            Connection con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:orcl","user01","1234");

                System.out.println(con);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }        
    }
}
