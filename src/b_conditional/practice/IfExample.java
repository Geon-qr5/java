package b_conditional.practice;

import java.util.Scanner;

/*
 * if 문
 * 만약 ()안의 문장이 true(참) 라면 코드블럭을 실행해줘
 * 
 * boolean : 참(true)과 거짓(false)을 표현하는 타입 
 * [표현법]
 *   if(조건식) {
 *     .. 실행할 코드 ..;
 *   }
 * 
 * - 보통 조건식(()안의 문장)에는 비교 연산자(>, <, >=, <=)
 * 		, 논리 연산자(&& == AND, || == OR)를 사용한다.
 * - 조건식의 결과가 참(true)이면 중괄호 안의 코드를 실행한다.
 * - 조건식의 결과가 거짓(false)이면 중괄호 안의 코드를 무시하고 넘어간다.
 */

public class IfExample {

    Scanner scan = new Scanner(System.in);

    /**
     * 두 수를 입력 받아서 두수의 합을 반환합니다.
     * 
     * @return num1 + num2
     */
    public int add(int num1, int num2) {

        return 0;

    }

    // 주민등록번호를 입력 받아서 남자인지 여자인지 출력하는 메서드를 만드시오.
    public void printGender() {
        System.out.print("주민등록번호를 입력 해주세요. : ");
        String ssn = scan.nextLine();
        System.out.println("주민번호 : " + ssn);

        // "-"를 없애는 작업
        // replace : 치환
        ssn = ssn.replace("-", "");

        // length : 길이 반환
        // == 같은지 확인
        // != 같지 않은지 확인
        // ! 부정연산자
        if (ssn.length() != 13) {
            System.out.println(ssn.length() + "자리는 잘못된 주민등록 번호 입니다.");
            return;
        }
        // 뒤에서 첫번째 자리에 해당하는 문자를 추출
        // charAt :
        char c = ssn.charAt(6);
        if (c == '1' || c == '3') {
            // 값이 1,3이면 남자를 출력
            System.out.println("남자!");
        } else if (c == '2' || c == '4') {
            // 값이 2,4이면 여자를 출력
            System.out.println("여자!");
        } else {
            System.out.println(ssn + "는 주민등록번호가 아닙니다.");
        }

    }

    // 숫자를 입력 받으세요
    // 100보다 작은 수이면
    // 홀수인지 짝수인지 출력
    // 100보다 크면 100보다 작은수를 입력하라고 출력

    public void num() {
        while (true) {
            System.out.print("수를 입력하세요 : ");
            int i = scan.nextInt();
            scan.nextLine();

            if (i <= 100) {
                int j = i % 2;
                if (j == 0) {
                    System.out.printf("%.0f는 짝수입니다\n.", (double) i);
                    break;
                } else {
                    System.out.printf("%.0f는 홀수입니다.\n", (double) i);
                    break;
                }
            } else {
                System.out.printf("%.0f는 100보다 큰 수입니다.\n", (double) i);
                System.out.println("100보다 작은 수를 입력하세요.");
            }
        }

    }

    public void method(){
        int num = scan.nextInt();
        System.out.println("num : " + num);

        if (num > 100) {
            System.out.println("100보다 작은 수를 입력해주세요.");
        } else {
            if(num%2==0){
                System.out.println("짝수");
            } else {
                System.out.println("홀수");
            }
        }
    }

}
