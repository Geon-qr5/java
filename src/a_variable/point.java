package a_variable;

import java.util.Scanner;

public class point {
    // 필드, 지역변수
    Scanner scan = new Scanner(System.in, "MS949");

    public static void main(String[] args) {
        // 생성
        point g = new point();
        // 사용 - 변수 이름에 점을 찍으면 사용가능한 필드, 메서드 목록이 나옵니다.
        g.getPoint();
        g.getPoint2();
    }

    // 접근제한자를 주지 않은 경우
    // 같은 패키지 내부에서만 사용 할 수 있다.
    // private : 외부에서 접근 불가!
    private void getPoint() {
        // 사용자로 부터 성적을 입력 받는다
        double korean, english, math, average;
        String grade;
        // 국어성적, 영어성적, 수학성적
        System.out.print("국어성적을 입력하세요. : ");
        korean = scan.nextDouble();
        System.out.print("영어성적을 입력하세요. : ");
        english = scan.nextDouble();
        System.out.print("수학성적을 입력하세요. : ");
        math = scan.nextDouble();
        // 평균을 구한다.
        average = (korean + english + math) / 3;
        // 등급을 출력한다. (평균이 >=90 A, >=80 B, >=70 C, >=60 D, F)
        if (average >= 90) {
            grade = "A";
        } else if (average >= 80) {
            grade = "B";
        } else if (average >= 70) {
            grade = "C";
        } else if (average >= 60) {
            grade = "D";
        } else {
            grade = "F";
        }
        // 사용자정보출력
        System.out.println("===== 사용자 정보 =====");
        System.out.printf("국어성적 : %.2f점\n", korean);
        System.out.printf("영어성적 : %.2f점\n", english);
        System.out.printf("수학성적 : %.2f점\n", math);
        System.out.printf("평균점수 : %.2f점\n", average);
        System.out.printf("당신의 등급은 %s입니다.\n", grade);
        System.out.println("=======================");
    }

    private void getPoint2() {
        int i = 0;
        // 반복문
        while (true) {
            if(i==2){
                break;
            }
            // i = i + 1;
            // 증감연산자를 이용해서 i의 값을 증가 시킴
            // ++i 먼저 1증가 / i++ 나중에 1증가
            i++;

            System.out.printf("%.0f번째 입력\n", (double) i);
            System.out.println("성적 계산기");
            // 사용자로 부터 성적을 입력 받는다
            System.out.println("이름 : ");
            String name = scan.nextLine();

            int kor, eng, math;
            double avg;
            // 국어성적, 영어성적, 수학성적
            System.out.println("국어성적 : ");
            kor = scan.nextInt();
            System.out.println("영어성적 : ");
            eng = scan.nextInt();
            System.out.println("수학성적 : ");
            math = scan.nextInt();

            // 남겨진 엔터를제거
            scan.nextLine();

            // 평균을 구한다.
            // 정수의 연산 결과는 정수를 반환
            // int타입의 값을 double타입에 대입하면 자동형변환이 되어짐
            // 정수와 실수의 연산 -> 정수가 실수로 타입이 변환된 후 연산
            avg = (kor + eng + math) / 3.0;
            // 연산자의 우선순위가 동일하다면 왼쪽에서 부터 실행되어 진다!
            // 괄호로 묶거나 변수에 담아서 출력
            System.out.println("이름 : " + name);
            System.out.println("총계 : " + (kor + eng + math));
            System.out.printf("평균점수 : %.2f, 학점 : ", avg);
            // 등급을 출력한다. (평균이 >=90 A, >=80 B, >=70 C, >=60 D, F)
            if (avg >= 90) {
                System.out.println("A");
            } else if (avg >= 80) {
                System.out.println("B");
            } else if (avg >= 70) {
                System.out.println("C");
            } else if (avg >= 60) {
                System.out.println("D");
            } else {
                System.out.println("F");
            }

            // 사용자정보출력

        }

    }
}
