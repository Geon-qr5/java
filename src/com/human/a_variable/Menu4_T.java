package com.human.a_variable;

import java.util.Scanner;

public class Menu4_T {
    public static void main(String[] args) {
        Menu4_T m = new Menu4_T();
        m.library();

    }

    Scanner s = new Scanner(System.in);

    public void library() {
        while (true) {
            // 메뉴출력
            printMenu();
            int menu = getInt();
            if ( menu == 1 ) {
                System.out.println("사용자메뉴");
            } else if (menu == 2) {
                System.out.println("관리자메뉴");
            } else if (menu == 3) {
                System.out.println("종료");
                System.exit(-1);
            } else {
                System.out.println("메뉴를 확인 후 다시 입력 해주세요.");
            }
            
        }
        
    }

    private void printMenu() {
        System.out.println("1. 사용자");
        System.out.println("2. 관리자");
        System.out.println("3. 종료");
        System.out.print("메뉴를 선택 해주세요 : ");
    }

    public int getInt(){
        int num = s.nextInt();
        s.nextLine();
        return num;
    }

}
