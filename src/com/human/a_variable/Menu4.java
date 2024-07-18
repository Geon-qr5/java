package com.human.a_variable;

/**
 * 1. 사용자
 *      1. 도서대여 - 도서대여 출력
 *      2. 도서반납 - 도서반납 출력
 *      0. 이전메뉴 - 반복문 탈출
 * 
 * 2. 관리자
 *      1. 도서등록 - 도서등록 출력
 *      2. 도서삭제 - 도서삭제 출력
 *      3. 사용자등록 - 사용자등록 출력
 *      0. 이전메뉴 - 반복문 탈출
 * 
 * 3. 종료
 *      정말 종료하시겠습니까?(Y/N)
 *      Y를 입력 하면 시스템 종료
 */

import java.util.Scanner;

public class Menu4 {
    Scanner scan = new Scanner(System.in);
    static Menu4 menu = new Menu4();

    public static void main(String[] args) {
        menu.mainMenu();

    }

    public void mainMenu() {
        while (true) {
            System.out.println("==========로그인메뉴===========");
            System.out.println("XX도서관에 오신것을 환영합니다.");
            System.out.println("1. 사용자");
            System.out.println("2. 관리자");
            System.out.println("0. 종료");
            System.out.print("번호를 입력해 주세요. : ");
            int logNum = scan.nextInt();
            scan.nextLine();

            switch (logNum) {
                case 1:
                    user();
                    break;
                case 2:
                    manager();
                    break;
                case 0:
                    exit();
                    break;
                default:
                    errorNum();
                    break;
            }
        }
    }

    private void user() {
        System.out.println("==========사용자메뉴==========");
            System.out.println("1. 도서대여");
            System.out.println("2. 도서반납");
            System.out.println("0. 이전메뉴");
            System.out.print("번호를 입력해 주세요. : ");
            int userNum = scan.nextInt();
            scan.nextLine();
        switch (userNum) {
            case 1:
                rentUser();
                user();
            case 2:
                returnUser();
                user();
            case 0:
                break;
            default:
                errorNum();
                user();

        }
    }

    private void manager() {
        System.out.println("==========관리자메뉴==========");
            System.out.println("1. 도서등록");
            System.out.println("2. 도서삭제");
            System.out.println("3. 사용자등록");
            System.out.println("0. 이전메뉴");
            System.out.print("번호를 입력해 주세요. : ");
            int managerNum = scan.nextInt();
            scan.nextLine();
        switch (managerNum) {
            case 1:
                addManager();
                manager();
            case 2:
                delManager();
                manager();
            case 3:
                userManager();
                manager();
            case 0:
                break;
            default:
                errorNum();
                manager();
        }

    }
    
    private void addManager() {
        System.out.println("도서등록");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-");
    }

    private void delManager() {
        System.out.println("도서삭제");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-");
    }

    private void userManager() {
        System.out.println("사용자등록");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-");
    }

    private void rentUser() {
        System.out.println("도서대여");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-");
    }

    private void returnUser() {
        System.out.println("도서반납");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-");
    }

    private void exit() {
        System.out.print("정말 종료하시겠습니까?(Y/N) : ");
        String exitStr = scan.nextLine();
        if (exitStr.equalsIgnoreCase("Y")) {
            System.out.println("프로그램을 종료합니다. 감사합니다.");
            System.exit(-1);
        } else {
            System.out.println("처음으로 돌아갑니다.");
            System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-");
        }
    }

    private void errorNum() {
        System.out.println("없는 번호입니다. 다시입력해주세요.");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-");
    }

}
