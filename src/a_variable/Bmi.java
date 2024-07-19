package a_variable;

import java.util.Scanner;

public class Bmi {
    Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        Bmi b = new Bmi();
        b.bmi();
    }
    
    public void bmi(){
        int i = 0;
        while (true) {
            if(i==3) break;
            i++;

            double height, weight, bmi;
            String bmiStr;

            System.out.println("BMI계산 프로그램입니다. 3회 실행 후 자동 종료됩니다.");
            System.out.printf("3회중 %.0f회 실행 중\n", (double) i);
    
            // 사용자로부터 키와 몸무게 입력 받아서 변수에 저장
            System.out.print("키(m) : ");
            height = s.nextDouble();
    
            if(height >= 100){
                // 단위변경
                height = height / 100;
            }
    
            System.out.print("몸무게(kg) : ");
            weight = s.nextDouble();
    
   
            // 사용자의 정보를 출력
            System.out.println("=======사용자정보=======");
            System.out.printf("키 : %.2fm\n", height);
            System.out.printf("몸무게 : %.2fkg\n", weight);
            System.out.println("========================");
    
            // 사용자의 입력 정보를 연산하여 bmi를 구합니다.
            bmi = weight / (height * height);
    
            if (bmi >= 25) {
                bmiStr = "비만";
            } else if (bmi >= 23) {
                bmiStr = "과체중";
            } else if (bmi >= 18.5) {
                bmiStr = "정상";
            } else {
                bmiStr = "저체중";
            }
    
            // 비만도출력
            System.out.printf("당신의 BMI는  %.2f이고 ,%s입니다.\n\n", bmi, bmiStr);
        
        }
        System.out.println("프로그램을 종료합니다. 감사합니다.");
    }

    public void ifTest(){
        // 조건문의 결과 참, 거짓에 의해 코드의 실행여부를 판단
        // 조건문이 참이면 코드를 실행
        // 참 = true , 거짓 = false
        // if(true){
        //     System.out.println("조건이 참입니다.");
        // } else{

        // }
        // if(false){
        //     System.out.println("조건이 거짓 입니다.");
        // }
    }
}
