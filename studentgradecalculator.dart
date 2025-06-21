import 'dart:io';

// Class to represent a student and their scores
class Student {
  String name;
  double continuousAssessmentScore;
  double examScore;
  double projectScore;
  double totalScore;
  String letterGrade;

  // Constructor for the Student class
  Student({
    required this.name,
    required this.continuousAssessmentScore,
    required this.examScore,
    required this.projectScore,
    this.totalScore = 0.0, // Default value, will be calculated
    this.letterGrade = 'N/A', // Default value, will be assigned
  });

  // Method to print student details
  void displayStudentDetails() {
    print('------------------------------------');
    print('Student Name: $name');
    print('Continuous Assessment: ${continuousAssessmentScore.toStringAsFixed(2)}');
    print('Exam Score: ${examScore.toStringAsFixed(2)}');
    print('Project Score: ${projectScore.toStringAsFixed(2)}');
    print('Total Score: ${totalScore.toStringAsFixed(2)}');
    print('Letter Grade: $letterGrade');
    print('------------------------------------');
  }
}

// Class to handle grade calculation logic
class GradeCalculator {
  // Method to compute the total score for a student
  double calculateTotalScore(
      double continuousAssessment, double examScore, double projectScore) {
    return continuousAssessment + examScore + projectScore;
  }

  // Method to assign a letter grade based on the total score
  String assignLetterGrade(double totalScore) {
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
    } else if (totalScore < 45 && totalScore >= 0) { // Ensure score is not negative
      return 'F';
    } else {
      return 'Invalid Score'; // Handle scores outside 0-100 range
    }
  }
}

void main() {
  print('Welcome to the Student Grade Calculator!');
  print('This program will help you calculate final grades for students.');

  // Initialize a GradeCalculator instance
  GradeCalculator calculator = GradeCalculator();
  List<Student> students = []; // List to store student records

  int numberOfStudents = 0;
  // Loop to get valid number of students input
  while (true) {
    stdout.write('Enter the number of students: ');
    String? input = stdin.readLineSync();
    try {
      numberOfStudents = int.parse(input!);
      if (numberOfStudents > 0) {
        break; // Exit loop if valid positive number
      } else {
        print('Please enter a positive number for students.');
      }
    } catch (e) {
      print('Invalid input. Please enter a whole number.');
    }
  }

  // Loop to collect data for each student
  for (int i = 0; i < numberOfStudents; i++) {
    print('\n--- Entering details for Student ${i + 1} ---');

    stdout.write('Enter student name: ');
    String? name = stdin.readLineSync();
    if (name == null || name.isEmpty) {
      name = 'Student ${i + 1}'; // Assign a default name if empty
      print('Name cannot be empty. Assigning default: $name');
    }

    double continuousAssessment = 0.0;
    while (true) {
      stdout.write('Enter continuous assessment score (0-100): ');
      String? input = stdin.readLineSync();
      try {
        continuousAssessment = double.parse(input!);
        if (continuousAssessment >= 0 && continuousAssessment <= 100) {
          break;
        } else {
          print('Score must be between 0 and 100.');
        }
      } catch (e) {
        print('Invalid input. Please enter a number.');
      }
    }

    double examScore = 0.0;
    while (true) {
      stdout.write('Enter exam score (0-100): ');
      String? input = stdin.readLineSync();
      try {
        examScore = double.parse(input!);
        if (examScore >= 0 && examScore <= 100) {
          break;
        } else {
          print('Score must be between 0 and 100.');
        }
      } catch (e) {
        print('Invalid input. Please enter a number.');
      }
    }

    double projectScore = 0.0;
    while (true) {
      stdout.write('Enter project score (0-100): ');
      String? input = stdin.readLineSync();
      try {
        projectScore = double.parse(input!);
        if (projectScore >= 0 && projectScore <= 100) {
          break;
        } else {
          print('Score must be between 0 and 100.');
        }
      } catch (e) {
        print('Invalid input. Please enter a number.');
      }
    }

    // Create a new Student object
    Student student = Student(
      name: name!,
      continuousAssessmentScore: continuousAssessment,
      examScore: examScore,
      projectScore: projectScore,
    );

    // Calculate total score and assign letter grade using the calculator
    student.totalScore = calculator.calculateTotalScore(
        student.continuousAssessmentScore,
        student.examScore,
        student.projectScore);
    student.letterGrade = calculator.assignLetterGrade(student.totalScore);

    // Add the student to the list
    students.add(student);
  }

  print('\n--- Grade Calculation Results ---');
  if (students.isEmpty) {
    print('No student data was entered.');
  } else {
    for (var student in students) {
      student.displayStudentDetails();
    }
  }

  print('\nGrade calculation complete. Thank you!');
}
