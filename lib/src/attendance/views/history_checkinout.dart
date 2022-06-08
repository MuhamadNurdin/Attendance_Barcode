import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/src/attendance/controllers/attendance_controller.dart';

class HistoryChekinout extends StatefulWidget {
  const HistoryChekinout({Key? key}) : super(key: key);

  @override
  State<HistoryChekinout> createState() => _HistoryChekinoutState();
}

class _HistoryChekinoutState extends State<HistoryChekinout> {
  final _attendanceController = Get.put(AttendanceController());

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  switchStepType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  @override
  void initState() {
    super.initState();
    _attendanceController.getHistoryAttendance();
  }

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    print(datetime.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('History Attendance'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              //physics: ClampingScrollPhysics(),
              steps: _stepper(),
              type: stepperType,
              currentStep: this._currentStep,
              onStepTapped: (step) {
                setState(() {
                  this._currentStep = step;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (this._currentStep < this._stepper().length - 1) {
                    this._currentStep = this._currentStep + 1;
                  } else {
                    //Logic
                    print('complete');
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (this._currentStep > 0) {
                    this._currentStep = this._currentStep - 1;
                  } else {
                    this._currentStep = 0;
                  }
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_horizontal_circle),
        onPressed: switchStepType,
      ),
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
          title: Text('Times'),
          content: Column(children: <Widget>[
            // ElevatedButton.icon(
            //   onPressed: () async {},
            //   icon: const Icon(Icons.qr_code), //icon data for elevated button
            //   label: const Text("Get Time Now"),
            // ),
            Text(DateFormat.yMMMMEEEEd().add_Hms().format(DateTime.now()),
                style: const TextStyle(fontSize: 18)),
          ]),
          isActive: _currentStep >= 0,
          state: StepState.complete),
      Step(
          title: Text('Times'),
          content: Column(children: <Widget>[
            // ElevatedButton.icon(
            //   onPressed: () async {},
            //   icon: const Icon(Icons.qr_code), //icon data for elevated button
            //   label: const Text("Get Time Now"),
            // ),
            Text(DateFormat.yMMMMEEEEd().add_Hms().format(DateTime.now()),
                style: const TextStyle(fontSize: 18)),
          ]),
          isActive: _currentStep >= 1,
          state: StepState.complete),
    ];
    return _steps;
  }
}
