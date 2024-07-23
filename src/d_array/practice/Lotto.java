package d_array.practice;

import java.util.Arrays;
import java.util.Scanner;

public class Lotto {

    Scanner scan = new Scanner(System.in);

    public void lotto() {
        System.out.println("로또번호 생성기 ===========");
        System.out.println("몇개를 만들까요?");
        int cnt = scan.nextInt();
        scan.nextLine(); // 숫자만 받아오기 때문에 뒤에 엔터를 빼줘야 다음 문자 입력을 받을 수 있어요
        for (int i = 0; i < cnt; i++) {
            System.out.println(Arrays.toString(getLottoNumber()));
        }
        System.out.println("필요한 금액은" + (cnt * 1000) + "원 입니다.");
    }

    // 로또생성기
    // 몇장 구입하시겠어요?
    public void lottoCreator() {
        int count = 0;
        System.out.print("로또를 몇장 구입하시겠습니까? : ");
        count = scan.nextInt();
        scan.nextLine();

        System.out.printf("%d장 구입합니다.\n", count);
        for (int a = 1; a <= count; a++) {
            int[] num = new int[6];
            for (int b = 0; b < num.length; b++) {
                num[b] = (int) (Math.random() * 47) + 1;
                for (int c = 0; c < b; c++) {
                    if (num[b] == num[c]) {
                        System.out.printf("%d는 중복된 번호입니다. 다시 추출합니다.\n", num[b]);
                        b--;
                    }
                }
            }
            System.out.printf("%d번째 당신의 로또 번호는 ", a);
            System.out.print(Arrays.toString(num));
            System.out.println("입니다.");
        }
        System.out.printf("이용금액은 %d원 입니다.\n", count * 1000);
        System.out.println("이용해주셔서 갑사합니다.");
    }

    public int[] getLottoNumber() {
        int[] arr = new int[6];
        // 배열에 값을 저장
        // 배열이름[방번호=index] = 값(배열의 타입과 일치하는)

        for (int i = 0; i < arr.length; i++) {
            arr[i] = (int) (Math.random() * 47) + 1;
            // 중복을 제거
            for (int j = 0; j < i; j++) {
                // 중복이 발생 했다면 i값을 1감소시켜서
                // 해당 인덱스에 값을 다시한번 입력하도록 한다
                if (arr[i] == arr[j]) {
                    // System.out.println("중복발생 ===========");
                    // System.out.println("arr[i] : " + arr[i]);
                    // System.out.println("arr[j] : " + arr[j]);
                    i--;
                }
            }
        }
        // Arrays객체를 이용하여 출력해봅시다! [배열요소가 가진 값, 값, 값, ... ]
        System.out.println(Arrays.toString(arr));
        return arr;
        // for (int num : arr) {
        // System.out.print(num + " ");
        // }
    }

    public void makeLotto() {
        // null : 참조타입변수는 객체를 참조 - 메모리주소값을 가지고 있다.
        // 참조하는 주소가 없다.
        int[] arr = null;
        int[] lott = new int[6];
        System.out.println(arr);
        System.out.println(lott);

        // if를 사용하여 null인경우 실행하지 않는 구문을 추가한다.
        // if (arr != null) {
        // // NullPointerException 에러
        // for(int i = 0 ; i<arr.length ; i++){
        // System.out.println(arr[i]);
        // }
        // }

    }
}
