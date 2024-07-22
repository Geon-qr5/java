package c_operator.practice;

public class RandomExample {

    public static void main(String[] args) {
        // static : 정적매서드
        // 실행하지 않고 사용
        // 정적메서드에서는 정적필드와 정적메서드만 사용 할 수 있다
        // 일반메서드의 경우 생성 후 호출이 가능하다
        RandomExample re = new RandomExample();
        // for (int i = 0; i <= 100; i++) {
        // re.random1();
        // }
        // 초기값;조건식;증감식
        // for (int i = 0; i <= 100; i++) {
        // re.random2();
        // }
        re.random3();
    }

    public void random1() {
        // 무작위 수를 추출하는 방법
        // 0.0 ~ 1.0 사이의 수를 반환
        // 0.001 ~ 0.999 rendom 추출
        // 0.006 ~ 5.994 *6
        // 0 ~ 5 int형변환

        int num = (int) (Math.random() * 6) + 1;
        System.out.printf("랜덤수는 %d입니다.\n", num);
    }

    public void random2() {
        // 기능 : 0.0 ~ 1.0 사이의 수를 반환
        // 변수선언 : 변수타입 변수명
        // int i = 0;
        // 최솟값 0.00..1 최댓값 0.99..9
        // 0.001 ~ 0.999
        // 범위를 구하기 위해서 곱하기를 이용
        // 0 ~ 곱한수 - 1
        Double num = Math.random() * 6;
        System.out.println(num);

    }

    public void random3() {
        // 주사위 2개를 굴려서 나온 수를 출력 하세요. (num1, num2)
        int num1 = (int) (Math.random() * 6 + 1);
        int num2 = (int) (Math.random() * 6 + 1);
        System.out.printf("(%d, %d)", num1, num2);
    }
}
