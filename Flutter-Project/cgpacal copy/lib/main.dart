import 'package:flutter/material.dart';


void main() {
  runApp(CGPACalculatorApp());
}

class CGPACalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CGPA Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CGPACalculatorScreen(),
    );
  }
}

class CGPACalculatorScreen extends StatefulWidget {
  @override
  _CGPACalculatorScreenState createState() => _CGPACalculatorScreenState();
}

class _CGPACalculatorScreenState extends State<CGPACalculatorScreen> {
  final TextEditingController completedCreditsController = TextEditingController();
  final TextEditingController currentCGPAController = TextEditingController();
  final List<Map<String, dynamic>> courses = [];
  final List<Map<String, dynamic>> retakes = [];

  final Map<String, double> gradePoints = {
    'A': 4.00,
    'A-': 3.67,
    'B+': 3.33,
    'B': 3.00,
    'B-': 2.67,
    'C+': 2.33,
    'C': 2.00,
    'C-': 1.67,
    'D+': 1.33,
    'D': 1.00,
    'F': 0.00,
  };

  void addCourse() {
    setState(() {
      courses.add({'credits': 3, 'grade': 'A'});
    });
  }

  void addRetake() {
    setState(() {
      retakes.add({'credits': 3, 'oldGrade': 'F', 'newGrade': 'A'});
    });
  }

  void calculateCGPA() {
    double oldCredits = double.tryParse(completedCreditsController.text) ?? 0;
    double oldCGPA = double.tryParse(currentCGPAController.text) ?? 0;
    double newCredits = 0, totalPoints = 0;

    // Regular Courses
    for (var course in courses) {
      int credit = course['credits'];
      String grade = course['grade'];
      newCredits += credit;
      totalPoints += credit * gradePoints[grade]!;
    }

    // Retakes: Remove old grade and add new grade
    for (var retake in retakes) {
      int credit = retake['credits'];
      String oldGrade = retake['oldGrade'];
      String newGrade = retake['newGrade'];

      // Remove old grade points contribution
      oldCredits -= credit;
      totalPoints -= credit * gradePoints[oldGrade]!;

      // Add new grade points
      newCredits += credit;
      totalPoints += credit * gradePoints[newGrade]!;
    }

    // Calculate new GPA (Only new courses & retakes)
    double newGPA = (newCredits > 0) ? (totalPoints / newCredits) : 0;
    newGPA = newGPA > 4.00 ? 4.00 : newGPA;  // Cap GPA at 4.00

    // Calculate total CGPA
    double totalCredits = oldCredits + newCredits;
    double overallCGPA = (totalCredits > 0) ? ((oldCredits * oldCGPA) + (newCredits * newGPA)) / totalCredits : 0;
    overallCGPA = overallCGPA > 4.00 ? 4.00 : overallCGPA;  // Cap CGPA at 4.00

    // Show Results
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Results'),
        content: Text(
          "New GPA: ${newGPA.toStringAsFixed(2)}\n"
              "Updated CGPA: ${overallCGPA.toStringAsFixed(2)}",
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }

  void resetFields() {
    setState(() {
      completedCreditsController.clear();
      currentCGPAController.clear();
      courses.clear();
      retakes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CGPA Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: completedCreditsController, decoration: InputDecoration(labelText: 'Completed Credits')),
            TextField(controller: currentCGPAController, decoration: InputDecoration(labelText: 'Current CGPA')),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ...courses.asMap().entries.map((entry) {
                    int index = entry.key;
                    return ListTile(
                      title: Text('Course ${index + 1}'),
                      subtitle: Row(
                        children: [
                          DropdownButton<int>(
                            value: courses[index]['credits'],
                            items: [1, 2, 3, 4].map((int value) {
                              return DropdownMenuItem<int>(value: value, child: Text('$value credits'));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                courses[index]['credits'] = value!;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          DropdownButton<String>(
                            value: courses[index]['grade'],
                            items: gradePoints.keys.map((String grade) {
                              return DropdownMenuItem<String>(value: grade, child: Text(grade));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                courses[index]['grade'] = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  ElevatedButton(onPressed: addCourse, child: Text('Add Course')),
                  ...retakes.asMap().entries.map((entry) {
                    int index = entry.key;
                    return ListTile(
                      title: Text('Retake ${index + 1}'),
                      subtitle: Row(
                        children: [
                          DropdownButton<int>(
                            value: retakes[index]['credits'],
                            items: [1, 2, 3, 4].map((int value) {
                              return DropdownMenuItem<int>(value: value, child: Text('$value credits'));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                retakes[index]['credits'] = value!;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          DropdownButton<String>(
                            value: retakes[index]['oldGrade'],
                            items: gradePoints.keys.map((String grade) {
                              return DropdownMenuItem<String>(value: grade, child: Text(grade));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                retakes[index]['oldGrade'] = value!;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          DropdownButton<String>(
                            value: retakes[index]['newGrade'],
                            items: gradePoints.keys.map((String grade) {
                              return DropdownMenuItem<String>(value: grade, child: Text(grade));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                retakes[index]['newGrade'] = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  ElevatedButton(onPressed: addRetake, child: Text('Add Retake')),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: resetFields,
                    child: Text('Reset'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: calculateCGPA,
                    child: Text('Calculate'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
