package f_Extends.practice;

public class Car {

    // 자동차의 부품으로 타이어객체를 사용 하고 있다.
    Tire frontLeftTire = new Tire("앞 왼쪽", 5);
    Tire backLeftTire = new Tire("뒤 왼쪽", 2);
    Tire frontRightTire = new Tire("앞 오른쪽", 3);
    Tire backRightTire = new Tire("뒤 오른쪽", 4);

    // 생성자를 통한 필드 초기화
    public Car() {
        frontLeftTire = new Tire("앞 왼쪽", 5);
        backLeftTire = new Tire("뒤 왼쪽", 2);
        frontRightTire = new Tire("앞 오른쪽", 3);
        backRightTire = new Tire("뒤 오른쪽", 4);

    }

    int run() {
        // 타이어를 1회전 시키고 바퀴가 터지면 멈춥니다.
        if (!frontLeftTire.roll()){stop(); return 1;}
        if (!backLeftTire.roll()){stop(); return 1;}
        if (!frontRightTire.roll()){stop(); return 1;}
        if (!backRightTire.roll()){stop(); return 1;}
        return 0;
    }

    void stop() {
        System.out.println("[정지]");
    }
}
