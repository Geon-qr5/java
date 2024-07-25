package e_object;

import e_object.practice.Student;

/**
 * 1. 필드 - 인스턴스 변수, 멤버변수, 필드, 전역변수
 * 멤버변수 - 클레스영역 어디서든 사용 할 수 있다.
 * <-> 지역변수 - 코드블럭을 벗어나면 없어진다.
 * 필드의 생성과 소멸
 * 생성 : new 연산자를 통해 객체 생성시 메모리에 할당
 * 소멸 : 객체가 소멸하는 시점에서 같이 제거
 * 
 * 2. 접근 제한자
 * public - 모든 패키지에서 사용 가능
 * protected - 같은 패키지 또는 상속관계
 * default - 같은 패키지에 있는 경우
 * private - 해당 클래스 내부에서만 사용이 가능
 * 
 * 접근제한자는 외부에서 접근 할 수 있는 범위를 제한하는 역할을 한다
 * public(+) > protected(#) > default(~) > private(-)으로 갈수록 접근 제한이 강화된다.
 * 
 */
public class App {
    public static void main(String[] args) {

        String str = "123456-1234567";
        // 인덱스부터 끝까지 출력
        System.out.println(str.substring(7));
        // beginIndex 포함, endIndex 포함하지 않음
        System.out.println(str.substring(7,8));

        // 학생 객체를 만들어 봅시다.
        // 클래스명 : Student
        // 학번, 이름, 나이 - private
        // 2개의 생성자
        // info() 매서드
        // getter, setter를 가지고 있어요

        Student s1 = new Student(1, "김윤상", 20);
        Student s2 = new Student(2, "백지연", 21);
        Student s3 = new Student(3, "박근민", 20);

        // s1.setNumber(2);
        // s1.setName("백지연");
        // s1.setAge(22);

        System.out.println(s1.info());
        System.out.println(s2.info());
        System.out.println(s3.info());

        // ClassMate를 생성하고
        // 학생을 추가해봅시다.

        // 등록된 학생을 출력해봅시다.

    }
}
