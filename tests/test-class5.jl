class Course {
    string name;
    string department;
}

class Person {
    string name;
    int id;
    class Course[] take_courses;
}

void printCourses(class Person p, int len) {
    class Course[] courses = p.take_courses;
    for (int i = 0; i < len; i = i + 1) {
        class Course curr_course = courses[i];
        string fullname = concat(curr_course.department, curr_course.name);
        print(fullname);
    }
}

void updateDepartment(class Person p, int len) {
    class Course[] courses = p.take_courses;
    for (int i = 0; i < len; i = i + 1) {
        class Course curr_course = courses[i];
        if (curr_course.department != "COMS") {
            curr_course.department = "NO";
        }
    }
}


int main() {
    class Course cs4115 = Course("PLT", "COMS");
    class Course m4042 = Course("Algebra", "MATH");
    class Course cs6111 = Course("Database", "COMS");
    class Person jess = Person("Jesse", 3222, [cs4115, m4042, cs6111]);
    print(jess.id);
    printCourses(jess, 3);
    updateDepartment(jess, 3);
    printCourses(jess, 3);
}