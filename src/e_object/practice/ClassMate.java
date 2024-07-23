package e_object.practice;

public class ClassMate {
    Student[] student = new Student[10];
    Teacher t;

    public void setStudent(Student s) {
        for (int i = 0; i < student.length; i++) {
            if (student[i] == null) {
                student[i] = s;
            }
        }
    }
}
