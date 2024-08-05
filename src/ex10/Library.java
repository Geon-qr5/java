package ex10;

import java.util.List;

import ex07.common.ScannerUtil;

public class Library {
    List<Book> list;
    // BookDao dao = new BookDao();

    BookService service = new BookService();

    public Library(){
        // 데이터 베이스에 접근해서 도서 목록을 조회
        list = service.getBookList();

        for (Book book : list) {
            System.out.println(book);
        }
    }

    void menu() {
        System.out.println("1. 도서 입력");
        System.out.println("2. 도서 삭제");
        System.out.println("0. 종료");

        int menu = ScannerUtil.getInt("메뉴를 입력해주세요.");
        if (menu == 1) {
            System.out.println("도서등록===================");
            String title = ScannerUtil.getString("도서명");
            String author = ScannerUtil.getString("작가");

            Book book = new Book("", title, author, "");
            int res = service.insertBook(book);
            if (res > 0) {
                System.out.println("입력완료");
            } else {
                System.out.println("입력실패!");
            }
        } else if (menu == 2) {
            System.out.println("도서삭제===================");
            printBookList();
            ScannerUtil.getString("삭제할 도서번호");

        } else if (menu == 0) {
            System.out.println("프로그램을 종료합니다.");
            System.exit(-1);
        } else {
            System.out.println("잘못입력하셨습니다.");
        }
    }

    public void printBookList() {
        List<Book> list = service.getBookList();
        for(Book book : list){
            System.out.println(book);
        }
    }
}
