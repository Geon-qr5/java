package ex10;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBConnection {

    public static void main(String[] args) {
        try {
            // 라이브러리가 정상적으로 추가 되었는지 확인
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터 베이스 연결 객체
            // url, id, pw
            Connection con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:orcl", "user01", "1234");

            // String sql = "select sysdate from dual";
            // 쿼리작성시 ;입력하면 오류가 발생 할 수 있음!
            String sql = "select * from tb_book";


            // 쿼리를 질의 할 수 있는 객체
            // 쿼리 세팅
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                // System.out.println("DB 현재시간 : " + rs.getString(1));
                // System.out.println("DB 현재시간 : " + rs.getString(2));
                // System.out.println("DB 현재시간 : " + rs.getString(3));
                // System.out.println("DB 현재시간 : " + rs.getString(4));
                // System.out.println("DB 현재시간 : " + rs.getString(5));
                // System.out.println("DB 현재시간 : " + rs.getString(6));
                // System.out.println("DB 현재시간 : " + rs.getString(7));
                // System.out.println("DB 현재시간 : " + rs.getString(8));
                // System.out.println("DB 현재시간 : " + rs.getString(9));
                // System.out.println(rs.getString("b_no"));
                // System.out.println(rs.getString("title"));
                // System.out.println(rs.getString("author"));
                // System.out.println(rs.getString("p_no"));
                String b_no = rs.getString("b_no");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String rentyn = rs.getString("rentyn");
                // System.out.println(b_no);
                // System.out.println(title);
                // System.out.println(author);

                Book book = new Book(b_no,title,author,rentyn);
                list.add(book);
            }

            for (Book book : list){
                System.out.println(book);
            }

            // 자원해제
            rs.close();
            pstmt.close();
            con.close();

        } catch (ClassNotFoundException e) {
            System.out.println("라이브러리가 추가 되었는지 확인해보세요!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB접속 정보를 확인해 주세요!");
            e.printStackTrace();
        }
    }
}
