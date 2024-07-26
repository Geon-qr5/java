package ex06.practice;

public class Cat extends Animal {
    private String location;
    private String color;

    public Cat() {

    }

    public Cat(String name, String kinds, String location, String color) {
        super(name, kinds);
        this.location = location;
        this.color = color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getColor() {
        return color;
    }

    public String getLocation() {
        return location;
    }

    @Override
    public void speak() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'speak'");
    }

}
