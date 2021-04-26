class Course {
    string name;
    string department;
}

class Student {
    string name;
    int id;
    string class_of;
    class Course[] courses_taken;
}

void printCourses(class Student s, int len) {
    class Course[] courses = s.courses_taken;
    for (int i = 0; i < len; i = i + 1) {
        class Course curr_course = courses[i];
        string fullname = concat(curr_course.department, curr_course.name);
        print(fullname);
    }
}

void updateDepartment(class Student s, int len) {
    class Course[] courses = s.courses_taken;
    for (int i = 0; i < len; i = i + 1) {
        class Course curr_course = courses[i];
        if (curr_course.department != "COMS") {
            curr_course.department = "NOTCS! --- ";
        }
    }
}

void prettyPrint(class Student s) {
    string j = upper(s.name);
    print(j);
    print(s.id);
    string c = concat("Class Of: ", s.class_of);
    print(c);
    print("----------");
    printCourses(s, 3);

    print("----------");
    updateDepartment(s, 3);
    printCourses(s, 3);
}

class Course coms4115 = Course("PLT", "COMS");
class Course math4042 = Course("Algebra", "MATH");
class Course coms6111 = Course("Database", "COMS");

class Student jess = Student("Jesse Blah", 5555, "Spring 2022", [coms4115, math4042, coms6111]);

prettyPrint(jess);