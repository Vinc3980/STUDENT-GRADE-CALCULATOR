import 'dart:io';

String assignGrade(double totalScore) {
  if (totalScore >= 80 && totalScore <= 100) {
    return 'A';
  } else if (totalScore >= 75 && totalScore <= 79) {
    return 'B+';
  } else if (totalScore >= 70 && totalScore <= 74) {
    return 'B';
  } else if (totalScore >= 65 && totalScore <= 69) {
    return 'C+';
  } else if (totalScore >= 60 && totalScore <= 64) {
    return 'C';
  } else if (totalScore >= 55 && totalScore <= 59) {
    return 'D+';
  } else if (totalScore >= 50 && totalScore <= 54) {
    return 'D';
  } else if (totalScore >= 45 && totalScore <= 49) {
    return 'E';
  } else {
    return 'F';
  }
}

void main() {
  print("Welcome to the Student Grade Calculator");

  stdout.write("Enter number of students: ");
  int studentCount = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= studentCount; i++) {
    print("\nEnter details for Student $i:");

    stdout.write("Enter student name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter Continuous Assessment score (0–30): ");
    double ca = double.parse(stdin.readLineSync()!);

    stdout.write("Enter Exam score (0–50): ");
    double exam = double.parse(stdin.readLineSync()!);

    stdout.write("Enter Project score (0–20): ");
    double project = double.parse(stdin.readLineSync()!);

    double total = ca + exam + project;
    String grade = assignGrade(total);

    print("\nResult for $name:");
    print("Total Score: $total");
    print("Grade: $grade");
  }

  print("\nAll grades calculated successfully.");
}
