package a_variable;

public class CastingExample1 {
    public static void main(String[] args) {
        int x = 5;
        int y = 2;
        // 정수타입의 연산은 정수타입을 반환
        // 실수타입으로 계산하기 위해서
        // 두 값중 하나라도 실수타입이어야 함!
        double res = (double) x / y;

        System.out.println(res);

        long var1 = 2l;
        float var2 = 1.8f;
        double var3 = 2.5;
        String var4 = "3.9";
        // 문자열 -> 실수타입으로 형변환 -> 정수타입으로 형변환
        int result = (int) (var1 + var2 + var3 + (int) Double.parseDouble(var4));
        System.out.println(result);

        byte value1 = Byte.parseByte("10");
        System.out.println(value1);
        int value2 = Integer.parseInt("1000");
        System.out.println(value2);
        float value3 = Float.parseFloat("20.5");
        System.out.println(value3);
        double value4 = Double.parseDouble("3.14159");
        System.out.println(value4);
    }

}
