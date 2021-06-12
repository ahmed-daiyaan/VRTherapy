import 'package:flutter/material.dart';

class Patient {
  Patient(
      {this.title = '',
      this.imagePath = '',
      this.exerciseCount = 0,
      this.disorder = '',
      this.rating = 0.0,
      this.sessionData1,
      this.sessionData2,
      this.sessionData3});

  String title;
  int exerciseCount;
  String disorder;
  double rating;
  String imagePath;
  List<Map<double, double>> sessionData1;
  List<Map<double, double>> sessionData2;
  List<Map<double, double>> sessionData3;

  static List<Patient> categoryList = <Patient>[
    Patient(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Ms. Vaishnavi Subbudu',
      exerciseCount: 2,
      disorder: "Arachnophobia",
      rating: 4.3,
      sessionData1: [
        {0.0: 0.0, 1.1: 1.1},
        {5.5: 2.2, 1.1: 2.3}
      ],
      sessionData2: [
        {5.5: 2.2, 1.1: 2.3},
        {5.5: 2.2, 1.1: 2.3}
      ],
      sessionData3: [
        {5.5: 2.2, 1.1: 2.3},
        {5.5: 2.2, 1.1: 2.3}
      ],
    ),
    Patient(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Ms. Harshitha Devineni',
      exerciseCount: 4,
      disorder: 'PTSD',
      rating: 4.6,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Mr. Daiyaan Ahmed',
      exerciseCount: 11,
      disorder: 'Depression',
      rating: 4.3,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Mr. Rahul',
      exerciseCount: 13,
      disorder: "Arcophobia",
      rating: 4.6,
    ),
  ];

  static List<Patient> popularCourseList = <Patient>[
    Patient(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Ms. Vaishnavi Subbudu',
      exerciseCount: 2,
      disorder: "Arachnophobia",
      rating: 4.3,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Ms. Harshitha Devineni',
      exerciseCount: 4,
      disorder: 'PTSD',
      rating: 4.6,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Mr. Daiyaan Ahmed',
      exerciseCount: 11,
      disorder: 'Depression',
      rating: 4.3,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Mr. Rahul Deshanand',
      exerciseCount: 13,
      disorder: "Arcophobia",
      rating: 4.6,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Ms. Harshitha Devineni',
      exerciseCount: 4,
      disorder: 'PTSD',
      rating: 4.6,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Mr. Daiyaan Ahmed',
      exerciseCount: 11,
      disorder: 'Depression',
      rating: 4.3,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Ms. Vaishnavi Subbudu',
      exerciseCount: 2,
      disorder: "Arachnophobia",
      rating: 4.3,
    ),
    Patient(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Mr. Rahul Deshanand',
      exerciseCount: 13,
      disorder: "Arcophobia",
      rating: 4.6,
    ),
  ];
}

class HeartData extends ChangeNotifier {
  List<double> r = [
    76.0,
    76.0,
    78.0,
    80.0,
    73.0,
    80.0,
    77.0,
    77.0,
    77.0,
    68.0,
    69.0,
    68.0,
    76.0,
    68.0,
    75.0,
    69.0,
    76.0,
    72.0,
    78.0,
    73.0,
    71.0,
    81.0,
    69.0,
    70.0,
    68.0,
    82.0,
    74.0,
    75.0,
    81.0,
    80.0,
    70.0,
    77.0,
    72.0,
    70.0,
    76.0,
    70.0,
    73.0,
    68.0,
    73.0,
    74.0,
    69.0,
    72.0,
    75.0,
    81.0,
    77.0,
    71.0
  ];
}
