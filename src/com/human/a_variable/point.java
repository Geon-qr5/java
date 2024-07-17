package com.human.a_variable;

import java.util.Scanner;

public class point {
    // 필드, 지역변수
    Scanner scan = new Scanner(System.in);

    public static void main(String[] args) {
        point g = new point();
        g.getPoint();
    }

    // 접근제한자를 주지 않은 경우
    // 같은 패키지 내부에서만 사용 할 수 있다.
    // private : 외부에서 접근 불가!
    private void getPoint(){
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
        if (average >= 90){
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
        System.out.printf("국어성적 : %.2f점\n",korean);
        System.out.printf("영어성적 : %.2f점\n",english);
        System.out.printf("수학성적 : %.2f점\n",math);
        System.out.printf("평균점수 : %.2f점\n",average);
        System.out.printf("당신의 등급은 %s입니다.\n",grade);
        System.out.println("=======================");
    }

}
