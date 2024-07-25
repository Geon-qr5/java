package e_object.practice;

import lombok.Data;

@Data

public class Student {

    private int number;
    private String name;
    private int age;

    // 생성자의 오버로딩
    // 매개변수의 타입과 갯수가 다르다면 같은 이름으로 여러개를 생성할 수 있다.
    // 생성자 : 반환타입이 없다.
    // 클래스명과 동일한 이름
    // 기본생성자
    public Student() {

    }

    // 매개변수가 있는 생성자
    // 필드를 초기화
    public Student(int number, String name, int age) {
        // 필드명과 매개변수명이 같은 경우, 매개변수가 우선되므로
        // 필드에 접근 하기 위해 this키워드를 사용한다.
        this.number = number;
        this.name = name;
        this.age = age;
    }

    public String info() {
        return "학번 : " + number + "\n이름 : " + name + "\n나이 : " + age;
    }

    @Override
    public String toString() {
        return "학번 : " + number + "\n이름 : " + name + "\n나이 : " + age;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

}
