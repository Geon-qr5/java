package a_variable;

import java.util.Scanner;

public class Menu3_Ex {
    Scanner scan = new Scanner(System.in);

    public static void main(String[] args) {
        Menu3_Ex menu3 = new Menu3_Ex();
        menu3.library();
    }

    private void library() {

        while (true) {            
            System.out.println("메뉴를 입력해주세요!!");
            int menu = scan.nextInt();
    
            if(menu == 1){
                a();
            } else if(menu == 2) {
                b();
            } else if(menu == 3) {
                c();
            } else {
                System.out.println("메뉴를 잘못입력했습니다!!");
            }
        }

    }

    // 접근제한자를 쓰지 않은 경우, 나와 같은 패키지에서만 사용가능함
    void a(){System.out.println("a메서드");}
    void b(){System.out.println("b메서드");}
    void c(){System.out.println("c메서드");}
}
