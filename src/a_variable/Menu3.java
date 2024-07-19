package a_variable;

import java.util.Scanner;

public class Menu3 {
    Scanner scan = new Scanner(System.in);
    
    public static void main(String[] args) {
        Menu3 m = new Menu3();

        m.menu();
        }
    
    public void menu(){
        while (true) {
            hellow();
            int num = scan.nextInt();
    
            if (num == 1) {
                rentBook();
            } else if (num == 2) {
                returnBook();
            } else if (num == 3) {
                exitBook();
            } else {
                errorBook();
            }            
        }

    }
    
    public void hellow(){
        System.out.println("==XX도서관입니다.==");
        System.out.println("1. 도서대여");
        System.out.println("2. 도서반납");
        System.out.println("3. 종료");
        System.out.print("메뉴를 선택하세요. : ");
        
    }
    

    private void rentBook() {
        System.out.println("기능구현중");
    }

    private void returnBook() {
        System.out.println("기능구현중");
    }

    private void exitBook() {
        System.out.print("정말 종료하시겠습니까? (Y/N) : ");
        // String exitBook = scan.nextLine();
    }

    private void errorBook() {
        System.out.println("기능구현중");
    }
}
