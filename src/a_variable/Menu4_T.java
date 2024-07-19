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
            // 사용자 입력 수집
            int menu = getInt();
            if (menu == 1) {
                user(); // System.out.println("사용자메뉴");
            } else if (menu == 2) {
                // 메서드를 호출할때, 매개변수의 값만 넣는다.
                admin(); // System.out.println("관리자메뉴");
            } else if (menu == 3) {
                System.out.println("종료");
                System.exit(-1);
            } else {
                System.out.println("메뉴를 확인 후 다시 입력 해주세요.");
            }

        }

    }

    private void admin() {
        // switch문장에서 사용되는 break문장은 switch문을 끝내기 위해 사용되므로
        // 반복문을 빠져나가기 위해서 변수를 사용 할 수있다.
        boolean res = true;
        while (res) {
            System.out.println("1. 도서등록");
            System.out.println("2. 도서삭제");
            System.out.println("3. 사용자등록");
            System.out.println("0. 이전메뉴");
            System.out.print("메뉴를 선택 해주세요 : ");
            int menu = getInt();

            switch (menu) {
                case 1:
                    System.out.println("도서등록 선택");
                    break;
                case 2:
                    System.out.println("도서삭제 선택");
                    break;
                case 3:
                    System.out.println("사용자등록 선택");
                    break;
                case 0:
                    System.out.println("이전메뉴 선택");
                    // 변수의 값을 변경하여 반복문을 탈출
                    res = false;
                    // 메서드 종료
                    return;
                default:
                System.out.println("메뉴를 확인 후 다시 입력해주세요.");
                    break;
            }

        }
    }

    private void user() {
        while (true) {
            System.out.println("1. 도서대여");
            System.out.println("2. 도서반납");
            System.out.println("0. 이전메뉴");
            System.out.print("메뉴를 선택 해주세요 : ");
            int menu = getInt();

            if (menu == 1) {
                System.out.println("도서 대여 선택");
            } else if (menu == 2) {
                System.out.println("도서 반납 선택");
            } else if (menu == 0) {
                System.out.println("이전메뉴 선택");
                break;
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

    public int getInt() {
        int num = 0;
        while (true) {
            // 예외가 발생 할 소지가 있는 문장을 try구문의 코드블럭에 작성
            // 예외발생시 catch 블럭이 실행 되어짐
            try {
                num = s.nextInt();
                s.nextLine();
                return num;
            } catch (Exception e) {
                // 사용자가 문자를 입력한 경우 예외발생
                System.out.println("숫자만 입력 가능 합니다.");
                s.nextLine();

            }
        }
    }

}
