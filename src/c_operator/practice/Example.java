package c_operator.practice;

import java.util.Scanner;

public class Example {

    public void method() {
        // 증감연산자 : 피연산자의 값을 1증가시키거나 1감소 시킬때 사용
        int x = 1;
        int y = 1;

        int res1 = ++x + 10;
        int res2 = y++ + 10;
        System.out.println("res1 : " + res1);
        System.out.println("x : " + x);
        System.out.println("res2 : " + res2);
        System.out.println("y : " + y);
    }

    // 삼항연산자
    // (조건식) ? 참일때 반환할 값 : 거짓일때 반환할 값
    public void method2() {
        int score = 70;
        // score값이 90보다 크거나 같으면 A를 반환 아니면 B를 반환
        String res = (score >= 90) ? "A" : ((score >= 80) ? "B" : "C");
        System.out.println(res);
    }

    // 만약 id = java, pw = 12345 이면 로그인 성공을 출력
    // 아니면 로그인 실패를 출력
    Scanner scan = new Scanner(System.in);

    public void login() {
        String id, password;

        while (true) {
            System.out.print("아이디 : ");
            id = scan.nextLine();
            if (id.equals("java")) {
                while (true) {
                    System.out.print("비밀번호 : ");
                    password = scan.nextLine();
                    if (password.equals("12345")) {
                        System.out.printf("반갑습니다. %s\n", id);
                        break;
                    } else {
                        System.out.println("비밀번호를 잘못 입력하셨습니다.");
                    }
                }
                break;
            } else {
                System.out.println("아이디를 잘못 입력하셨습니다.");
            }
        }
    }

    public void login2() {
        String id, password;
        while (true) {
            System.out.print("아이디 : ");
            id = scan.nextLine();
            System.out.print("비밀번호 : ");
            password = scan.nextLine();
            id = id.trim(); // 공백제거
            password = password.trim(); // 공백제거

            if (id.equals("java") && password.equals("12345")) {
                System.out.println("로그인 성공");
                break;
            } else {
                System.out.println("로그인 실패");
            }
        }
    }

    public void method3() {
        // for : 반복문
        // for (초기식; 조건식; 증감식;){}
        // i는 10보다 작을때까지
        // 코드블럭이 끝날때마다 i의 값을 1씩 증가시킨다.
        for (int j = 2; j < 10; j++) {
            System.out.printf("%d단\n", j);
            for (int i = 1; i < 10; i++) {
                System.out.printf("%d * %d = %d\n", j, i, (j * i));
            }
        }

        // 1~9까지 반복실행
        // System.out.println("2단");
        // System.out.println("2*1=2");
    }
}
