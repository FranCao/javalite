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
    class Course[] courses;
    class Course curr_course;
    int i;
    string fullname;
    courses = p.take_courses;
    for (i = 0; i < len; i = i + 1) {
        curr_course = courses[i];
        fullname = concat(curr_course.department, curr_course.name);
        print(fullname);
    }
}

void updateDepartment(class Person p, int len) {
    class Course[] courses;
    class Course curr_course;
    int i;
    courses = p.take_courses;
    for (i = 0; i < len; i = i + 1) {
        curr_course = courses[i];
        if (curr_course.department != "COMS") {
            curr_course.department = "NO";
        }
    }
}


int main() {
    class Person jess;
    class Course cs4115;
    class Course m4042;
    class Course cs6111;
    class Course[] jessCourses;
    class Course oneCourse;
    cs4115 = Course("PLT", "COMS");
    m4042 = Course("Algebra", "MATH");
    cs6111 = Course("Database", "COMS");
    jess = Person("Jesse", 3222, [cs4115, m4042, cs6111]);
    print(jess.id);
    printCourses(jess, 3);
    updateDepartment(jess, 3);
    printCourses(jess, 3);
    /*string s1;
    string s2;
    string[] arr;
    s1 = "hey";
    s2 = "hello";
    arr = [s1, s2];
    if (s1 == s2) print(s2);
    else print(s1);*/
}