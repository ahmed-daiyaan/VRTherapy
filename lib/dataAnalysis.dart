import 'dart:math' as math;
import 'dart:core';

import 'package:flutter/widgets.dart';

//DATA SETS
// Each value is the reading per 0.865seconds
// Obtained from a clinical heartbeat Sensor
var heartBeatRate = [
  60,
  62,
  66,
  65,
  63,
  66,
  69,
  82,
  84,
  82,
  85,
  84,
  85,
  90,
  99,
  111,
  105,
  105,
  100,
  89,
  72,
  64,
  65,
  66
];
// Obtained from the VR headset / or alternatively from unity logged values
var headMovementTracker = [
  [234, 679, 145],
  [234, 371, 991],
  [123, 567, 346],
  [165, 364, 972],
  [261, 632],
  [246, 247, 890],
  [261, 354, 895],
  [421, 268, 112],
  [613, 107, 530],
  [574, 210, 264],
  [588, 479, 120],
  [578, 479, 229],
  [643, 335, 791],
  [272, 330, 576],
  [778, 235, 981],
  [455, 782, 128],
  [872, 910, 453],
  [347, 786, 112],
  [711, 817, 190],
  [258, 174, 918],
  [855, 132, 656],
  [257, 367, 367],
  [389, 387, 148],
  [911, 860, 810]
];
// Obtained from the trackpad used by the patient while experiencing the VR
var fingerMovementTracker = [
  [0, 0],
  [0, 0],
  [0, 1],
  [0, 0],
  [0, 1],
  [0, 2],
  [0, 2],
  [3, 5],
  [4, 5],
  [6, 6],
  [7, 7],
  [7, 8],
  [8, 8],
  [9, 10],
  [11, 15],
  [12, 9],
  [9, 10],
  [8, 6],
  [10, 8],
  [10, 10],
  [10, 11],
  [10, 11],
  [10, 11],
  [10, 10]
];

//lists for analysis
var relativeFingerMovementTrackdedList = [];
var relativeHeadMovementTrackdedList = [];
//percentage lists
var relativeHeartBeatPercentageList = [];
var relativeFingerMovementTrackdedPercentageList = []; //finger tracking
var relativeHeadMovementTrackdedPercentageList = [];
// The boolean value lists representing spike in fear
var heartRateThreshold = [];
var headMovementThreshold = [];
var fingerMovementThreshold = [];
//the combined analysis including all three measurements
var finalanalysis = [];

//---------------------------- HeartBeat Rate Calculation and Analysis ---------------------------------------

//The average of the first five values to obtain a normal base reference from which the other values can be calculated relatively
//For example when a person takes a (lie detector test) polygraph test, the subject is asked a few questions that are true to obtain the normal value and
// obtain the base and rest of the values are relatively analysed
int initialAverageValue(var anyList) {
  int sum = 0;
  for (int i = 0; i < anyList.length; i++) {
    sum = sum + anyList[i];
  }
  return (sum ~/ anyList.length).toInt();
}

// This creates a sublist of the first 5 values observes to obtain the normal heart rate of the patient
int calculateNormalHeartRate(var heartBeatRate) {
  int i, referenceHeartRateValue;
  for (i = 0; i < 5; i++) {
    referenceHeartRateValue = initialAverageValue(heartBeatRate.sublist(0, 5));
    // InitialAverageValue function returns the averge of the input list
  }
  return referenceHeartRateValue;
}

// Values make more sense when compared and analysed with a base value.
// Function calculates the percentage of the heartbeat values wrt the normal heartbeat rate
List<dynamic> relativeHeartBeatPercentage() {
  int referenceHeartRateValue = calculateNormalHeartRate(heartBeatRate);
  double v;
  for (int i = 0; i < headMovementTracker.length; i++) {
    v = (heartBeatRate[i] - referenceHeartRateValue) / 100;
    relativeHeartBeatPercentageList.insert(i, v);

    // generates a boolean value True when the patient's fear spikes, else false

  }
  return relativeHeartBeatPercentageList;
}

//---------------------------- Head Movement Tracked values Calculation and Analysis ---------------------------------------

// Calculates the Movement of the head with respective to time frame
// Movement is tracked in terms of coordinates (x,y,z), distance is calculated using distance formula
List<dynamic> relativeHeadMovementTracked() {
  relativeHeadMovementTrackdedList.insert(0, 0);
  int distance;
  for (int i = 1; i < headMovementTracker.length - 1; i++) {
    distance = (math.sqrt(math.pow(
                headMovementTracker[i - 1][0] - headMovementTracker[i][0], 2) +
            math.pow(
                headMovementTracker[i - 1][1] - headMovementTracker[i][1], 2) +
            math.pow(
                headMovementTracker[i - 1][2] - headMovementTracker[i][2], 2)))
        .toInt();
    relativeHeadMovementTrackdedList.insert(i, distance);
  }
// Distance is calculated for each head movement respectively and fed into realativeHeadMovementTrackedList

// The reference value is taken as 5 units and anything below this point (small jerks are not necessarily jump scares, could be considered as a casual movement)
// is considered negligible and can be ignored.
// Values make more sense when compared and analysed with a base value.
// Function calculates the percentage of the head movement distance values wrt the normal (considered negligible) head movement distance
  int referenceDistance = 5;
  double a;
  for (int i = 0; i < relativeHeadMovementTrackdedList.length; i++) {
    a = (relativeHeadMovementTrackdedList[i] - referenceDistance) / 100;
    relativeHeadMovementTrackdedPercentageList.insert(i, a);

    // generates a boolean value True when the patient's fear spikes, else false

  }
  return relativeHeadMovementTrackdedPercentageList;
}

//---------------------------- Finger Movement Tracked values Calculation and Analysis ---------------------------------------

// Calculates the Movement of our finger on the touchpad with respective to time frame
// Movement is tracked in terms of coordinates(x,y), distance is calculated using distance formula
List<dynamic> relativeFingerMovementTracked() {
  relativeFingerMovementTrackdedList.insert(0, 0);
  int distance;
  for (int i = 1; i < fingerMovementTracker.length; i++) {
    distance = (math.sqrt(math.pow(
                fingerMovementTracker[i - 1][0] - fingerMovementTracker[i][0],
                2) +
            math.pow(
                fingerMovementTracker[i - 1][1] - fingerMovementTracker[i][1],
                2)))
        .toInt();
    relativeFingerMovementTrackdedList.insert(i, distance);
  }

// Distance is calculated for each head movement respectively and fed into realativeFingerMovementTrackedList

// The reference value is taken as 1 unit and anything below this point (small jerks are not necessarily jump scares, could be considered as a casual movement)
// is considered negligible and can be ignored.
// Values make more sense when compared and analysed with a base value.
// Function calculates the percentage of the head movement distance values wrt the normal (considered negligible) head movement distance
  double referenceDistance = 1;
  double a;
  for (int i = 0; i < relativeFingerMovementTrackdedList.length; i++) {
    a = (relativeFingerMovementTrackdedList[i] - referenceDistance) / 100;
    relativeFingerMovementTrackdedPercentageList.insert(i, a);

    // generates a boolean value True when the patient's fear spikes, else false

  }
  return relativeFingerMovementTrackdedPercentageList;
}

//---------------------------- Combination Algorithm ---------------------------------------

// Over the time frame, up until now we analysed one particular scale with respect to time frame across various session.
// Combined algorithm has the potential of all the three graphs combined in an much more efficient and appropriate percentanges.
// The prevalence of the percentages is backed up by extensive research and is cited as follows

//Heatbeat Rate - 62 %

//research to back the data up ... (add)

//Head Movement Distance - 20 %

//Finger Movement Distance - 18 %

List<dynamic> dataAnalysis() {
  var v;
  for (int i = 0; i < heartBeatRate.length; i++) {
    v = (0.62 * relativeHeartBeatPercentageList[i] +
            0.20 * relativeHeadMovementTrackdedPercentageList[i]) +
        0.18 * relativeFingerMovementTrackdedPercentageList[i];
    finalanalysis.insert(i, visibleForTesting);
  }
  return finalanalysis;
}
