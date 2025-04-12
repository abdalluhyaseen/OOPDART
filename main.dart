void main() {
  Student student1 = Student("Abdalluh", 27, "Laravel");

  student1.printDetails();
  print("Student age: ${student1.age}");
  print(".........................................");

  student1.age = -5;
  print("Age remains: ${student1.age}");
  print(".........................................");

  student1.age = 30;
  print("Updated age: ${student1.age}");
  print(".........................................");

  StudentManager studentManager = StudentManager();

  studentManager.addStudent(Student("Amro", 28, "ReactJS"));
  studentManager.addStudent(Student("Leen", 27, "PHP"));

  studentManager.addStudent(Student.guest());

  studentManager.printAllStudents();
}

class Student {
  String name;
  String _favoriteLanguage;
  int _age;

  Student(this.name, int age, this._favoriteLanguage) : _age = age;

  Student.guest() : name = "Guest", _favoriteLanguage = "Unknown", _age = 0;

  int get age => _age;

  set age(int newAge) {
    if (newAge > 0) {
      _age = newAge;
    } else {
      print("Error: Age must be positive.");
    }
  }

  String get favoriteLanguage => _favoriteLanguage;

  set favoriteLanguage(String newLanguage) {
    if (newLanguage.isNotEmpty) {
      _favoriteLanguage = newLanguage;
    } else {
      print("Error: Favorite language cannot be empty.");
    }
  }

  void printDetails() {
    print("Student: $name, Age: $_age, Favorite Language: $_favoriteLanguage");
  }

  int calculateYearOfBirth() {
    int currentYear = DateTime.now().year;
    return currentYear - _age;
  }
}

class StudentManager {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void printAllStudents() {
    for (var student in students) {
      student.printDetails();
    }
  }
}
