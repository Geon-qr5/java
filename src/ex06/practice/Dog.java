package ex06.practice;

public class Dog extends Animal {
    public static final String PLACE = "애견카페";
    private int weight;

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getWeight() {
        return weight;
    }

    public Dog() {
        super(); // 생성자호출 생략가능 : 컴파일러가 자동으로 생성함
    }

    public Dog(String name, String kind, int weight) {
        super(name, kind);
        this.weight = weight;
    }

    @Override
    public void speak() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'speak'");
    }

}
