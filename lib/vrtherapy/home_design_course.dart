import 'package:best_flutter_ui_templates/main.dart';
import 'package:best_flutter_ui_templates/vr_therapy_patients/patient_info_screen.dart';

import 'package:best_flutter_ui_templates/vrtherapy/patients_list_view.dart';
import 'package:flutter/material.dart';
import 'vr_therapy_app_theme.dart';
import 'models/patient.dart';

class VRTherapyHomeScreen extends StatefulWidget {
  @override
  _VRTherapyHomeScreenState createState() => _VRTherapyHomeScreenState();
}

class _VRTherapyHomeScreenState extends State<VRTherapyHomeScreen> {
  CategoryType categoryType = CategoryType.ui;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: VRTherapyAppTheme.nearlyWhite,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Add New Patient",
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  TextEditingController name = TextEditingController();
                  TextEditingController phobia = TextEditingController();

                  return Column(
                    children: [
                      Text("Enter patient name"),
                      TextField(
                        controller: name,
                      ),
                      Text("Enter patient phobia"),
                      TextField(
                        controller: phobia,
                      ),
                      TextButton(
                        child: Text("Submit"),
                        onPressed: () {
                          Patient.popularCourseList.add(Patient(
                            title: name.value.text,
                            disorder: phobia.value.text,
                          ));
                          setState(() {});
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          },
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      //getSearchBarUI(),
                      //getCategoryUI(),
                      Flexible(
                        child: getPopularCourseUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget getCategoryUI() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
  //         child: Text(
  //           'Your Patients',
  //           textAlign: TextAlign.left,
  //           style: TextStyle(
  //             fontWeight: FontWeight.w600,
  //             fontSize: 22,
  //             letterSpacing: 0.27,
  //             color: DesignCourseAppTheme.darkerText,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 16,
  //       ),
  //       // Padding(
  //       //   padding: const EdgeInsets.only(left: 16, right: 16),
  //       //   child: Row(
  //       //     children: <Widget>[
  //       //       getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
  //       //       const SizedBox(
  //       //         width: 16,
  //       //       ),
  //       //       getButtonUI(
  //       //           CategoryType.coding, categoryType == CategoryType.coding),
  //       //       const SizedBox(
  //       //         width: 16,
  //       //       ),
  //       //       getButtonUI(
  //       //           CategoryType.basic, categoryType == CategoryType.basic),
  //       //     ],
  //       //   ),
  //       // ),
  //       // const SizedBox(
  //       //   height: 16,
  //       // ),
  //       CategoryListView(
  //         callBack: () {
  //           moveTo();
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Your Patients',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: VRTherapyAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: PatientsListView(
              callBack: (Patient category) {
                print(category.title);
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return PatientInfoScreen();
        },
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Ui/Ux';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Basic UI';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? VRTherapyAppTheme.nearlyBlue
                : VRTherapyAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: VRTherapyAppTheme.nearlyBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? VRTherapyAppTheme.nearlyWhite
                        : VRTherapyAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: VRTherapyAppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'VR Therapy',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: VRTherapyAppTheme.grey,
                  ),
                ),
                Text(
                  'Dr. Daiyaan',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: VRTherapyAppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/design_course/userImage.png'),
          )
        ],
      ),
    );
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}
