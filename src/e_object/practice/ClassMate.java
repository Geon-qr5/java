package e_object.practice;

public class ClassMate {
    Student[] student = new Student[10];
    Teacher t;

    /**
     * Student를 매개변수로 받아서 배열에 세팅
     * @param s
     */
    public void setStudent(Student s) {
        for (int i = 0; i < student.length; i++) {
            // 배열에 방이 비어 있으면
            if (student[i] == null) {
                student[i] = s;
            }
        }
    }
}
