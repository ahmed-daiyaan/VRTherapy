import 'package:best_flutter_ui_templates/chart.dart';
//import 'package:best_flutter_ui_templates/design_course/models/category.dart';
import 'package:best_flutter_ui_templates/vrtherapy/models/patient.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import '../dataAnalysis.dart';
import 'category_list_view.dart';
import 'vr_therapy_app_theme.dart';

class PatientInfoScreen extends StatefulWidget {
  final Patient category;

  const PatientInfoScreen({Key key, this.category}) : super(key: key);
  @override
  _PatientInfoScreenState createState() => _PatientInfoScreenState();
}

class _PatientInfoScreenState extends State<PatientInfoScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Container(
      color: VRTherapyAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset('assets/design_course/webInterFace.png'),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: VRTherapyAppTheme.nearlyWhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: VRTherapyAppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight: tempHeight > infoHeight
                              ? tempHeight
                              : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 18, right: 16),
                            child: Text(
                              '${widget.category.title}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: VRTherapyAppTheme.darkerText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${widget.category.disorder}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 22,
                                    letterSpacing: 0.27,
                                    color: VRTherapyAppTheme.nearlyBlue,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '${widget.category.rating}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 22,
                                          letterSpacing: 0.27,
                                          color: VRTherapyAppTheme.grey,
                                        ),
                                      ),
                                      Icon(
                                        Icons.thermostat_outlined,
                                        color: VRTherapyAppTheme.nearlyBlue,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity1,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  getTimeBoxUI(
                                      '${widget.category.exerciseCount}',
                                      'Exercises'),
                                  getTimeBoxUI('2hours', 'Time'),
                                  getTimeBoxUI('24', 'Score'),
                                ],
                              ),
                            ),
                          ),
                          Text("Previous Results"),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 100,
                                  width: 70,
                                  child: SimpleLineChart.withRandomData()),
                              Container(
                                  height: 100,
                                  width: 70,
                                  child: SimpleLineChart.withRandomData()),
                              Container(
                                  height: 100,
                                  width: 70,
                                  child: SimpleLineChart.withRandomData()),
                              Container(
                                  height: 100,
                                  width: 70,
                                  child: SimpleLineChart.withRandomData()),
                            ],
                          ),
                          SizedBox(height: 20),
                          // Expanded(
                          //   child: AnimatedOpacity(
                          //     duration: const Duration(milliseconds: 500),
                          //     opacity: opacity2,
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(
                          //           left: 16, right: 16, top: 8, bottom: 8),
                          //       child: Text(
                          //         'Lorem ipsum is simply dummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.',
                          //         textAlign: TextAlign.justify,
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.w200,
                          //           fontSize: 14,
                          //           letterSpacing: 0.27,
                          //           color: DesignCourseAppTheme.grey,
                          //         ),
                          //         maxLines: 3,
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: VRTherapyAppTheme.nearlyWhite,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        border: Border.all(
                                            color: VRTherapyAppTheme.grey
                                                .withOpacity(0.2)),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: VRTherapyAppTheme.nearlyBlue,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: VRTherapyAppTheme.nearlyBlue,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: VRTherapyAppTheme
                                                  .nearlyBlue
                                                  .withOpacity(0.5),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 10.0),
                                        ],
                                      ),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push<dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) {
                                                  return TestingScreen();
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Start VR Exercise',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                              color:
                                                  VRTherapyAppTheme.nearlyWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.bottom,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
            //   right: 35,
            //   child: ScaleTransition(
            //     alignment: Alignment.center,
            //     scale: CurvedAnimation(
            //         parent: animationController, curve: Curves.fastOutSlowIn),
            //     child: Card(
            //       color: DesignCourseAppTheme.nearlyBlue,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(50.0)),
            //       elevation: 10.0,
            //       child: Container(
            //         width: 60,
            //         height: 60,
            //         child: Center(
            //           child: Icon(
            //             Icons.favorite,
            //             color: DesignCourseAppTheme.nearlyWhite,
            //             size: 30,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: VRTherapyAppTheme.nearlyBlack,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: VRTherapyAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: VRTherapyAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: VRTherapyAppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: VRTherapyAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Starting VR Exercise, Please get the patient ready with the initial protocols",
              textAlign: TextAlign.center,
            ),
            Container(height: 300, child: HeartGraph()),
            TextButton(
              child: Text("Press here to Continue"),
              onPressed: () {
                print("hi");
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) {
                      return FingerTrackingScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

class FingerTrackingScreen extends StatelessWidget {
  final heart = relativeHeartBeatPercentage();
  final finger = relativeFingerMovementTracked();
  final heartD = HeartData();
  //final head = relativeHeadMovementTracked();
  //final analysis = dataAnalysis();
  @override
  Widget build(BuildContext context) {
    //print(analysis.length);
    List<DataPoint<double>> m = List<DataPoint<double>>.generate(
        46,
        (index) =>
            DataPoint(xAxis: index.toDouble(), value: heartD.r[index].abs()));
    List<DataPoint<double>> n = List<DataPoint<double>>.generate(
        11,
        (index) =>
            DataPoint(xAxis: index.toDouble(), value: finger[index].abs()));
    // relativeHeadMovementTracked();

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(45)),
            Text("Heart Beat Rate Tracker", style: TextStyle(fontSize: 20)),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                xAxisCustomValues:
                    List<double>.generate(46, (index) => index.toDouble()),
                //[0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50],
                series: [
                  BezierLine(
                    data: m,
                  ),
                ],
                config: BezierChartConfig(
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.black26,
                  showVerticalIndicator: true,
                  backgroundColor: Colors.red,
                  snap: false,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(45)),            Text("Finger Tracker", style: TextStyle(fontSize: 20)),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: BezierChart(
                bezierChartScale: BezierChartScale.CUSTOM,
                xAxisCustomValues: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50],
                series: [
                  BezierLine(
                    data: n,
                  ),
                ],
                config: BezierChartConfig(
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.black26,
                  showVerticalIndicator: true,
                  backgroundColor: Colors.red,
                  snap: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
