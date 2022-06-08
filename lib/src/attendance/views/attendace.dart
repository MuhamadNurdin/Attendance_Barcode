import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoder_flutter/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:meditation_app/src/attendance/controllers/attendance_controller.dart';
import 'package:meditation_app/src/home/views/home_screen.dart';

class Attendance extends StatefulWidget {
  final String code;
  Attendance(this.code);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  File? image;
  var imageBytes;
  var encodeImage;
  LocationData? _currentPosition;
  String? _address;
  String? _dateTime;
  late GoogleMapController mapController;
  late Marker marker;
  Location location = Location();

  late GoogleMapController _controller;
  LatLng _initialcameraposition =
      // LatLng(-6.557511178633301, 106.82851562753696); // rumah nurdin
      LatLng(-6.405151291135223, 106.8485633809208); //QONSTANTA / RYNEST
  // LatLng(  -6.28542159466803, 106.83575869811382); //GRM

  final _attendanceContr = Get.put(AttendanceController());

  @override
  void initState() {
    super.initState();
    getLoc();
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    // _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
                  fit: BoxFit.cover),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Container(
                color: Color.fromARGB(255, 252, 252, 252).withOpacity(.8),
                child: ListView(children: [
                  Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      child: GoogleMap(
                        // UDIN MAP VIEW
                        myLocationButtonEnabled: false,
                        initialCameraPosition: CameraPosition(
                            target: _initialcameraposition, zoom: 15),
                        mapType: MapType.normal,
                        onMapCreated: _onMapCreated,
                        myLocationEnabled: true,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    //UDIN QR RESULT
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        height: 60.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 245, 245, 245),
                              Color.fromARGB(255, 240, 242, 245)
                            ]),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20.0,
                                  offset: Offset(0.0, 4.0)),
                            ]),
                        child: Text(widget.code,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))),
                    // ignore: unnecessary_null_comparison
                    //UDIN COLUMN
                    if (_dateTime != null)
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 245, 245, 245),
                              Color.fromARGB(255, 240, 242, 245)
                            ]),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20.0,
                                  offset: Offset(0.0, 4.0)),
                            ]),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Date/Time: $_dateTime",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            // ignore: unnecessary_null_comparison
                            if (_currentPosition != null)
                              // UDIN LATITUDE LONGITUDE VIEW

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Latitude: ${_currentPosition?.latitude}, Longitude: ${_currentPosition!.longitude}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                            SizedBox(
                              height: 7,
                            ),
                            // ignore: unnecessary_null_comparison
                            if (_address != null)
                              Text(
                                "Address: $_address",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ),

                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      height: 320.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 245, 245, 245),
                            Color.fromARGB(255, 240, 242, 245)
                          ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 20.0,
                                offset: Offset(0.0, 4.0)),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          image != null
                              // ignore: sized_box_for_whitespace
                              ? Container(
                                  height: 220,
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  child: Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton.icon(
                            label: const Text('Open Camera',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () async {
                              await getImage();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.059,
                      margin: EdgeInsets.fromLTRB(10, 15, 10, 50),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 245, 245, 245),
                            Color.fromARGB(255, 240, 242, 245)
                          ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 20.0,
                                offset: Offset(0.0, 4.0)),
                          ]),
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.checklist_rtl_sharp,
                          size: 20.0,
                        ), //icon data for elevated button
                        label: const Text(
                          "Finish",
                        ),
                        onPressed: () {
                          (image == null)
                              ? Get.defaultDialog(title: "Please Take Picture")
                              : showAlertDialog(context);
                        },
                      ),
                    ),
                  ]),
                ]),
              ),
            )));
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    _initialcameraposition =
        LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition =
            LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);

        DateTime now = DateTime.now();
        _dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(now);
        _getAddress(_currentPosition!.latitude!, _currentPosition!.longitude!)
            .then((value) {
          setState(() {
            _address = "${value.first.addressLine}";
          });
        });
      });
    });
  }

  Future<List<Address>> _getAddress(double lat, double lang) async {
    final coordinates = new Coordinates(lat, lang);
    List<Address> add =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return add;
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 50);
    image = File(imagePicked!.path);
    setState(() {
      imageBytes = image!.readAsBytesSync();
      print(imageBytes);
      encodeImage = base64Encode(imageBytes);
      print(encodeImage);
    });
  }

  showAlertDialog(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      title: Text("Attendance Finished"),
      actions: [
        ElevatedButton(
            onPressed: () {
              // _attendanceContr.empData.value.attendanceState == "checked_in"
              //     ? _attendanceContr
              //         .putAbsentOut(_attendanceContr.empData.value.id)
              //     : _attendanceContr.putAbsentIn(
              //         _attendanceContr.empData.value.id,
              //         _address.toString(),
              //         widget.code,
              //         encodeImage);
              _attendanceContr.putAbsentIn(_attendanceContr.empData.value.id,
                  _address.toString(), widget.code, encodeImage);
              Get.offAll(HomeScreen(),
                  arguments: _attendanceContr.empData.value.attendanceState =
                      "checked_in");
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              // );
              // print(encodeImage);
            },
            child: Text('OK')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('NO')),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}

// class Attendance extends StatefulWidget {
//   @override
//   _AttendanceState createState() => _AttendanceState();
// }

// class _AttendanceState extends State<Attendance> {
//   File? image;
//   Position? _currentPosition;
//   String? _currentAddress;
//   bool isLoading = false;
//   late LocationPermission permission;
//   late String _scanBarcode = 'Unknown';
//   late File imageFile;

//   final _attendanceContr = Get.put(AttendanceController());

//   @override
//   void initState() {
//     super.initState();
//     // print(getEmployeeId());
//   }

//   Future<Position> _getPosition() async {
//     LocationPermission permission;

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       // ignore: unnecessary_statements
//       permission == await Geolocator.requestPermission();

//       if (permission == LocationPermission.deniedForever) {
//         await Geolocator.openAppSettings();
//         await Geolocator.openLocationSettings();
//         return Future.error('Location not Available');
//       }
//     } else {
//       print('Location not Available');
//     }

//     return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//   }

//   void _getAddress(latitude, longitude) async {
//     try {
//       List<Placemark> placmark = await GeocodingPlatform.instance
//           .placemarkFromCoordinates(latitude, longitude);

//       Placemark place = placmark[0];
//       print(place);
//       setState(() {
//         _currentAddress =
//             ' ${place.subAdministrativeArea},${place.subLocality},${place.street}, ${place.country}';
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   // the current step
//   int _currentStep = 0;

//   // Determines whether the stepper's orientation is vertical or horizontal
//   // This variable can be changed by using the switch below

//   // This function will be triggered when a step is tapped
//   _stepTapped(int step) {
//     setState(() => _currentStep = step);
//   }

//   // This function will be called when the continue button is tapped
//   _stepContinue() {
//     _currentStep < 2 ? setState(() => _currentStep += 1) : HomeScreen();
//   }

//   // This function will be called when the cancel button is tapped
//   _stepCancel() {
//     _currentStep > 0 ? setState(() => _currentStep -= 1) : Attendance();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Attendance'),
//       ),
//       body: Column(
//         children: [
//           // Controls the stepper orientation
//           // SwitchListTile(
//           //     title: const Text('Vertical Stepper?'),
//           //     subtitle: const Text('vertical/horizontal direction'),
//           //     value: _isVerticalStepper,
//           //     onChanged: (_) {
//           //       setState(() {
//           //         _isVerticalStepper = !_isVerticalStepper;
//           //       });
//           //     }),
//           const Divider(
//             thickness: 2,
//             height: 40,
//           ),

//           Expanded(
//             // the Stepper widget
//             child: Stepper(
//               // vertical or horizontial
//               type: StepperType.vertical,
//               physics: const ScrollPhysics(),
//               currentStep: _currentStep,
//               onStepTapped: (step) => _stepTapped(step),
//               onStepContinue: _stepContinue,
//               onStepCancel: _stepCancel,
//               steps: [
//                 // The first step: Name
//                 Step(
//                   title: const Text('Set Your Location'),
//                   content: Column(
//                     children: [
//                       const SizedBox(height: 10),
//                       if (_currentAddress != null)
//                         Text(
//                           _currentAddress!,
//                           style: const TextStyle(
//                               fontSize: 18, color: Colors.black),
//                         ),
//                       ElevatedButton.icon(
//                         onPressed: () async {
//                           setState(() {
//                             isLoading = true;
//                           });
//                           _currentPosition = await _getPosition();
//                           _getAddress(_currentPosition!.latitude,
//                               _currentPosition!.longitude);

//                           setState(() {
//                             isLoading = false;
//                           });
//                         },
//                         icon: const Icon(Icons
//                             .add_location_alt_rounded), //icon data for elevated button
//                         label: const Text("Set Location"),
//                       ),
//                     ],
//                   ),
//                   isActive: _currentStep >= 0,
//                   state: _currentStep >= 0
//                       ? StepState.complete
//                       : StepState.disabled,
//                 ),
//                 // The second step: Phone number
//                 Step(
//                   title: const Text('Scan Attendance QR'),
//                   content: Column(
//                     children: [
//                       ElevatedButton.icon(
//                         onPressed: () => scanQR(),
//                         icon: const Icon(
//                             Icons.qr_code), //icon data for elevated button
//                         label: const Text("Scan QR"),
//                       ),
//                       Text('Scan result : $_scanBarcode\n',
//                           style: const TextStyle(fontSize: 18)),
//                     ],
//                   ),
//                   isActive: _currentStep >= 0,
//                   state: _currentStep >= 1
//                       ? StepState.complete
//                       : StepState.disabled,
//                 ),
//                 // The third step: Verify phone number
//                 Step(
//                   title: const Text('Take A Selfie'),
//                   content: Column(
//                     children: [
//                       // ignore: sized_box_for_whitespace
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             image != null
//                                 // ignore: sized_box_for_whitespace
//                                 ? Container(
//                                     height: 300,
//                                     width: MediaQuery.of(context).size.width,
//                                     child: Image.file(
//                                       image!,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   )
//                                 : Container(),
//                             TextButton.icon(
//                               label: const Text('Open Camera',
//                                   style: TextStyle(color: Colors.white)),
//                               icon: const Icon(
//                                 Icons.camera,
//                                 color: Colors.white,
//                               ),
//                               style: TextButton.styleFrom(
//                                   backgroundColor: Colors.blue),
//                               onPressed: () async {
//                                 await getImage();
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   isActive: _currentStep >= 0,
//                   state: _currentStep >= 2
//                       ? StepState.complete
//                       : StepState.disabled,
//                 ),
//               ],
//             ),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               showAlertDialog(context);
//             },
//             icon: const Icon(
//                 Icons.checklist_rtl_sharp), //icon data for elevated button
//             label: const Text("Finish"),
//           ),
//           const SizedBox(height: 50),
//         ],
//       ),
//     );
//   }

//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//     print(_scanBarcode);
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }

//   Future getImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? imagePicked =
//         await _picker.pickImage(source: ImageSource.camera);
//     image = File(imagePicked!.path);
//     setState(() {});
//   }

//   showAlertDialog(BuildContext context) {
//     AlertDialog dialog = AlertDialog(
//       title: Text(_attendanceContr.empData.value.attendanceState.toString()),
//       actions: [
//         // Obx(() => Text(_homeController.employeeData[0].id.toString())),
//         ElevatedButton(
//             onPressed: () async {
//               _attendanceContr.empData.value.attendanceState == "checked_out"
//                   ? _attendanceContr
//                       .putAbsentOut(_attendanceContr.empData.value.id)
//                   : _attendanceContr.putAbsentIn(
//                       _attendanceContr.empData.value.id,
//                       _currentAddress.toString(),
//                       _scanBarcode);
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomeScreen()),
//               );
//             },
//             child: Text('OK')),
//         ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('NO')),
//       ],
//     );

//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return dialog;
//         });
//   }
// }
