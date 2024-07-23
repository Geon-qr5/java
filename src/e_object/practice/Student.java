package e_object.practice;

public class Student {

    private int number;
    private String name;
    private int age;

    public Student(){
        
    }
    public Student(int number, String name, int age){
        this.number = number;
        this.name = name;
        this.age = age;
    }

    public String info(){
        return "학번 : " + number + "\n이름 : " + name + "\n나이 : " + age;
    }
    
    public void setNumber(int number){
        this.number = number;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setAge(int age){
        this.age = age;
    }

}
