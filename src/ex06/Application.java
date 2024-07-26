package ex06;

import ex06.practice.Animal;
import ex06.practice.Cat;
import ex06.practice.Dog;

public class Application {
    public static void main(String[] args) {
        Animal[] animalArr = new Animal[5];
        // 랜덤값을 추출 후 짝수인지 홀수인지 판단해서
        animalArr[0] = new Cat("고양이", "Cat", "구로구", "얼룩");
        animalArr[1] = new Dog("강아지", "Dog", 20);
        animalArr[2] = new Dog(null, null, 0);
        animalArr[3] = new Cat(null, null, null, null);
        animalArr[4] = new Cat(null, null, null, null);
        /*
         * for (int i = 0; i < animalArr.length; i++) {
         * // 랜덤값을 추출 후 짝수인지 홀수인지 판단해서
         * // 1~10까지의 수 중 랜덤하게 추출
         * int num = (int) (Math.random() * 10) + 1;
         * if (num % 2 == 0) {
         * animalArr[i] = new Cat();
         * } else {
         * animalArr[i] = new Dog();
         * }
         * }
         */
        for (Animal a : animalArr) {
            a.speak();
        }
    }
}
