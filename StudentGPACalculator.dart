import 'dart:io';

void main() {
  // Get student's name
  stdout.write('Enter student\'s name: ');
  String? studentName = stdin.readLineSync();

  // Handle case where student name is not entered
  if (studentName == null || studentName.isEmpty) {
    print('Student name cannot be empty. Please restart the program.');
    return; // Exit the program if no name is provided
  }

  // --- Get marks and credit hours for each subject from user input ---
  print('\n--- Enter Subject Details ---');

  // English
  double englishMarks = getValidMarks('English');
  int englishCreditHours = getValidCreditHours('English');

  // Maths
  double mathsMarks = getValidMarks('Maths');
  int mathsCreditHours = getValidCreditHours('Maths');

  // Science
  double scienceMarks = getValidMarks('Science');
  int scienceCreditHours = getValidCreditHours('Science');

  // Calculate total credit hours
  int totalCreditHours = englishCreditHours + mathsCreditHours + scienceCreditHours;

  // Check if totalCreditHours is 0 to avoid division by zero
  if (totalCreditHours == 0) {
    print('\nError: Total credit hours cannot be zero. Cannot calculate GPA.');
    return;
  }

  // Calculate GPA
  double gpa = ((englishMarks * englishCreditHours) +
      (mathsMarks * mathsCreditHours) +
      (scienceMarks * scienceCreditHours)) / totalCreditHours;

  // --- Display results ---
  print('\n--- Student GPA Report ---');
  print('Student Name: $studentName');
  print('--------------------------');
  print('English: Marks = $englishMarks, Credit Hours = $englishCreditHours');
  print('Maths:   Marks = $mathsMarks, Credit Hours = $mathsCreditHours');
  print('Science: Marks = $scienceMarks, Credit Hours = $scienceCreditHours');
  print('--------------------------');
  print('Overall GPA: ${gpa.toStringAsFixed(2)}'); // Formatted to 2 decimal places
}

// --- Helper function to get and validate marks ---
double getValidMarks(String subjectName) {
  double? marks;
  while (marks == null) {
    stdout.write('Enter $subjectName marks (0-100): ');
    String? input = stdin.readLineSync();

    try {
      marks = double.parse(input!);
      if (marks < 0 || marks > 100) {
        print('Marks must be between 0 and 100.');
        marks = null; // Reset marks to null to continue the loop
      }
    } catch (e) {
      print('Invalid input. Please enter a numerical value.');
      // If parsing fails, marks remains null, and the loop continues
    }
  }
  return marks;
}

// --- Helper function to get and validate credit hours ---
int getValidCreditHours(String subjectName) {
  int? creditHours;
  while (creditHours == null) {
    stdout.write('Enter $subjectName credit hours (e.g., 1, 2, 3): ');
    String? input = stdin.readLineSync();

    try {
      creditHours = int.parse(input!);
      if (creditHours <= 0) { // Credit hours should be positive
        print('Credit hours must be a positive integer.');
        creditHours = null;
      }
    } catch (e) {
      print('Invalid input. Please enter an integer for credit hours.');
    }
  }
  return creditHours;
}
