package d_array.practice;

public class ArrayEx {

    public void lotto4() {
        int[] lotto = new int[6];

        // 0 ~ 5
        for (int i = 0; i < lotto.length; i++) {
            // 1 ~ 47 까지의 수 중 무작위 수를 추출
            int num = (int) (Math.random() * 47) + 1;
            // 중복체크
            // i의 값만큼 반복
            lotto[i] = num;
            for (int j = 0; j < i; j++) {
                if (lotto[j] == num){
                    System.out.println("lotto[j] : " + lotto[j]);
                    System.out.println("num : " + num);
                    // 중복발생
                    i--;
                    System.out.println("중복발생=============");
                    break;
                }
            }
            System.out.println("i : " + i);
            System.out.println("lotto : ");
            for(int n : lotto){
                System.out.print(n + " ");
            }
            System.out.println();
        }
    }

    public void lotto3() {
        // 정수 20개를 저장 할 수 있는 배열을 생성
        int[] lotto = new int[20];
        // 배열에 (1~100)무작위 수를 대입
        for (int i = 0; i < lotto.length; i++) {
            lotto[i] = (int) (Math.random() * 100) + 1;
        }
        // 배열에 값을 출력
        for (int i : lotto) {
            System.out.print(i + " ");
        }
        // 배열의 값의 합을 출력
        int sum = 0;
        for (int num : lotto) {
            sum += num;
        }
        System.out.println("\n합계 : " + sum);

        sum(lotto);
    }

    public void lotto2() {
        // 배열의 합계를 구해줘
        sum(new int[] { 1, 2, 3, 4, 5 });

        // 정수 20개를 저장 할 수 있는 배열을 생성
        int[] lotto = new int[20];
        // 배열에 (1~100)무작위 수를 대입
        for (int i = 0; i < lotto.length; i++) {
            lotto[i] = (int) (Math.random() * 100) + 1;
            for (int j = 0; j < i; j++) {
                while (true) {
                    if (lotto[j] == lotto[i]) {
                        lotto[i] = (int) (Math.random() * 100) + 1;
                    } else {
                        break;
                    }
                }
            }
        }
        // 배열에 값을 출력
        for (int i : lotto) {
            System.out.print(i + " ");
        }
        // 배열의 값의 합을 출력
        int sum = 0;
        for (int num : lotto) {
            sum += num;
        }
        System.out.println("\n합계는 : " + sum);

        sum(lotto);

    }

    public void sum(int[] array) {
        System.out.println("배열의 총 합계를 구합니다.");
        // 반복문을 이용해서 배열을 돌면서 값을 가지고 와서
        int sum = 0;
        for (int num : array) {
            sum += num;
        }
        // 배열에 들어있는 숫자들의 합을 출력
        System.out.println("\n합계는 : " + sum);
    }

    public void lotto1() {
        // 정수 6개를 저장 할 수 있는 공간
        int[] lotto = new int[6];

        // 배열의 값을 지정
        // lotto[0]~lotto[5]
        for (int i = 0; i < lotto.length; i++) {
            // 1 ~ 47중 무작위수를 추출하고 배열에 담아줍니다.
            lotto[i] = (int) (Math.random() * 47 + 1);
        }

        // 배열의 값을 출력
        System.out.println("로또 자동 생성기");
        for (int i : lotto) {
            System.out.print(i + " ");
        }
    }

    public void array_error() {
        // 자동으로 방을 초기화
        // 정수 0, 실수 0.0, boolean false, 나머지 객체 null
        int[] lotto = new int[6];
        // 향상된 for문
        // 배열의 시작부터 끝까지 하나씩 꺼내서 변수에 담고 코드블럭을 실행
        // for(타입 변수명 : 배열변수명)
        for (int i : lotto) {
            System.out.println("i = " + i);
        }

        for (int i = 0; i < lotto.length; i++) {
            // lotto[6];
            // .ArrayIndexOutOfBoundsException
            // lotto.length는 방의 갯수와 동일
            // index는 0부터 시작하므로 오류가 발생 lotto[lotto.length]
            System.out.println(lotto[i]);
        }
    }

    public void lotto() {
        // 무작위 수를 추출하여 배열에 담아보자!
        // 정수 6개가 저장될 공간을 만드시오 변수명은 lotto로 한다!
        // 각 방에는 랜덤함수를 이용해서 1~47까지의 수를 추출하여 수를 저장한다.
        int[] lotto = new int[6];
        for (int i = 0; i < lotto.length; i++) {
            lotto[i] = (int) (Math.random() * 47 + 1);
        }
        // 배열이름.length : 배열의 길이를 반환 = 방의 갯수
        System.out.println("lotto.length : " + lotto.length);
        System.out.println("로또번호를 생성합니다.");
        for (int i = 0; i < lotto.length; i++) {
            System.out.print(lotto[i]);
            if (i != lotto.length - 1) {
                System.out.print(", ");
            }
        }
        System.out.println();

    }

    /**
     * Array (배열)
     * - 길이가 정해져 있다.
     * - 같은 타입만 저장 가능.
     */
    public void array1() {
        // 변수 선언 : 자료형 변수명;
        // 자료형 배열명[];
        /*
         * 배열 선언 : 자료형[] 배열명;
         * 자료형 배열명[];
         */
        int[] lotto;
        // int lotto1[];
        /*
         * 배열 생성 : new 자료형[배열의 크기];
         */
        lotto = new int[6];
        // 인덱스를 이용한 초기화 방법
        lotto[0] = 10;
        lotto[1] = 20;

        // 배열의 선언과 생성을 동시에!
        int[] lotto1 = new int[6]; // 배열의 길이만 결정
        int[] lotto2 = new int[] { 1, 2, 3, 4, 5 }; // 값도 지정
        int[] lotto3 = { 1, 2, 3, 4, 5 }; // 값도 지정
        int lotto4[] = { 1, 2, 3, 4, 5 }; // 값도 지정
        System.out.println(lotto1);
        System.out.println(lotto2);
        System.out.println(lotto3);
        System.out.println(lotto4);

    }

    /**
     * 오버로딩
     * 매서드의 이름이 같아도 매개변수 타입과 매개변수개수가 다르면 여러개를 만들 수 있다.
     * 
     * 오버라이딩
     * 부모가 가진 매서드를 자식이 재정의
     */

    /**
     * 오버로딩
     */
    // public String toString(int i, int j, int k) {
    public String toString(int[] arr) {
        return super.toString();
    }

    public String toString(int a, int b) {
        return super.toString();
    }

    /**
     * 오버라이딩
     * 
     * 부모의 매서드를 재정의
     * = 부모매서드의 선언부와 자식매서드의 선언부가 동일
     * @ : 어노테이션
     */
    @Override
    public String toString() {
        // super : 부모
        return "배열연습";
    }
}
