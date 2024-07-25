package f_Extends.airplane;

// extends 부모클래스명
// 자식클래스에서 부모를 지정
public class SupersonicAirplane extends Airplane {
    // 상수 = 변경할 수 없음
    // 상수는 이름을 모두 대문자로 작성
    public static final int NORMAL = 1; // 일반비행
    public static final int SUPERSONIC = 2; // 초음속비행

    public int flyMode = NORMAL;
    
    @Override
    public void fly() {
        // 상수는 final로 정의하며 불변
        // SUPERSONIC = 0; <- 오류
        if (flyMode == SUPERSONIC) {
            System.out.println("초음속비행중입니다.");
        } else {
            // 부모가 가지고 있는 메서드를 호출
            super.fly();
        }
    }
}
