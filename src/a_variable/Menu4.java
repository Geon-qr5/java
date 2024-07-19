package a_variable;

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
            int logNum;
            
            System.out.println("<< XX도서관에 오신것을 환영합니다. >>");
            System.out.println("┌───────로그인메뉴───────┐");
            System.out.println("│ 1. 사용자              │");
            System.out.println("│ 2. 관리자              │");
            System.out.println("│ 0. 종료                │");
            System.out.println("└────────────────────────┘");
            System.out.print("※ 번호를 입력해 주세요. : ");
            logNum = scan.nextInt();
            scan.nextLine();
            System.out.println();

            switch (logNum) {
                case 1:
                    user();
                case 2:
                    manager();
                case 0:
                    exit();
                default:
                    errorNum();
                    break;
            }
        }
    }

    private void user() {
        int userNum;

        System.out.println("┌───────사용자메뉴───────┐");
        System.out.println("│ 1. 도서대여            │");
        System.out.println("│ 2. 도서반납            │");
        System.out.println("│ 0. 이전메뉴            │");
        System.out.println("└────────────────────────┘");
        System.out.print("※ 번호를 입력해 주세요. : ");
        userNum = scan.nextInt();
        scan.nextLine();
        System.out.println();
        
        switch (userNum) {
            case 1:
                rentUser();
                user();
            case 2:
                returnUser();
                user();
            case 0:
                backMenu();
                mainMenu();
            default:
                errorNum();
                user();

        }
    }

    private void manager() {
        int managerNum;

        System.out.println("┌───────관리자메뉴───────┐");
        System.out.println("│ 1. 도서등록            │");
        System.out.println("│ 2. 도서삭제            │");
        System.out.println("│ 3. 사용자등록          │");
        System.out.println("│ 0. 이전메뉴            │");
        System.out.println("└────────────────────────┘");
        System.out.print("※ 번호를 입력해 주세요. : ");
        managerNum = scan.nextInt();
        scan.nextLine();
        System.out.println();

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
                backMenu();
                mainMenu();
            default:
                errorNum();
                manager();
        }

    }

    private void backMenu() {
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~");
        System.out.println("이전메뉴로 돌아갑니다.");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n");
    }

    private void addManager() {
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~");
        System.out.println("도서등록");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n");
    }

    private void delManager() {
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~");
        System.out.println("도서삭제");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n");
    }

    private void userManager() {
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~");
        System.out.println("사용자등록");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n");
    }

    private void rentUser() {
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~");
        System.out.println("도서대여");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n");
    }

    private void returnUser() {
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~");
        System.out.println("도서반납");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n");
    }

    private void exit() {
        System.out.print("정말 종료하시겠습니까?(Y/N) : ");
        String exitStr = scan.nextLine();
        if (exitStr.equalsIgnoreCase("Y")) {
            System.out.println("프로그램을 종료합니다.");
            System.out.println("이용해주셔서 감사합니다.");
            System.exit(-1);
        } else {
            System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~");
            System.out.println("로그인메뉴로 돌아갑니다.");
            System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n");
        }
    }

    private void errorNum() {
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~");
        System.out.println("없는 번호입니다. 다시입력해주세요.");
        System.out.println("~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n");
    }

}
