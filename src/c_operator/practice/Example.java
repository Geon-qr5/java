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

    public void ex01() {
        int sum = 0;

        for (int i = 1; i <= 100; i++) {
            if (i % 3 == 0) {
                sum += i;
            }
        }
        System.out.println(sum);
    }

    public void ex02() {
        int i, j;
        // Math.random()은 0.00000000....1 ~ 0.9999999...을 추출 한다 -> 0과1사이의수
        // 1~6까지의 정수를 뽑고싶다면 Math.random() * 6 -> 6보다 작은 어떤수 추출
        // 위 식에서 0~5까지의 수가 나왔으니 +1을 하면 1~6까지의 수가 나온다.

        while (true) {
            i = (int) (Math.random() * 6 + 1);
            j = (int) (Math.random() * 6 + 1);
            if (5 != (i + j)) {
                System.out.printf("(%d,%d)\n", i, j);
            } else {
                System.out.printf("(%d,%d) ", i, j);
                System.out.println("합이 5가 되었습니다.");
                break;
            }

        }
    }

    public void ex03() {
        for (int i = 1; i < 5; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
        for (int a = 1; a < 5; a++) {
            for (int b = 3; b >= a; b--) {
                System.out.print(" ");
            }
            for (int c = 1; c <= a; c++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}
