package ex10;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 데이터베이스 커넥션을 생성하고 반환한다.
 */
public class ConnectionUtil {
    public static Connection getConnection() {
        Connection con = null;
        try {
            // 오라클 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            // 데이터베이스 연결 생성
            con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:orcl", "user01", "1234");

        } catch (ClassNotFoundException e) {
            System.out.println("라이브러리가 추가 되었는지 확인해보세요!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB접속 정보를 확인해 주세요!");
            e.printStackTrace();
        }
        return con;
    }

    public static void closeConnection(ResultSet rs, PreparedStatement pstmt, Connection con) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.out.println("closeConnection 처리 중 예외 발생");
            e.printStackTrace();
        }
    }
}