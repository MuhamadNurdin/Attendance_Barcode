//----------------------------------------------------

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/leave/controllers/leave_controller.dart';
import 'package:meditation_app/src/leave/models/leave_models.dart';

class CutiForm extends StatefulWidget {
  const CutiForm({Key? key}) : super(key: key);

  @override
  State<CutiForm> createState() => _CutiFormState();
}

class _CutiFormState extends State<CutiForm> {
  final _leaveController = Get.put(LeaveController());
  late String dropDowntypeValue;
  int? catagory;

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  final GlobalKey<FormState> _formKey = GlobalKey();
  final namakaryawanCutiController = TextEditingController();
  final dariCutiController = TextEditingController();
  final sampaiCutiController = TextEditingController();
  final statusCutiController = TextEditingController();
  final deskripsiCutiController = TextEditingController();
  final _start = TextEditingController();
  final _end = TextEditingController();

  // This function is triggered when the "Save" button is pressed
  // void _saveForm() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //             content: Scrollbar(
  //           thickness: 10,
  //           isAlwaysShown: true,
  //           radius: Radius.circular(10),
  //           child: Container(
  //             height: 300,
  //             width: 500,
  //             child: ListView(children: [
  //               SingleChildScrollView(
  //                 scrollDirection: Axis.vertical,
  //                 child: Column(
  //                   children: [
  //                     Text('Nama Karyawan : '),
  //                     const SizedBox(width: 1),
  //                     Container(
  //                         width: 490,
  //                         child: Text(
  //                           namakaryawanCutiController.text,
  //                           maxLines: 5,
  //                           overflow: TextOverflow.ellipsis,
  //                         )),
  //                     const SizedBox(height: 10),
  //                     Row(children: [
  //                       Text('Dari '),
  //                       const SizedBox(width: 1),
  //                       Text(dariCutiController.text),
  //                     ]),
  //                     const SizedBox(height: 10),
  //                     Row(children: [
  //                       Text('Sampai '),
  //                       const SizedBox(width: 1),
  //                       Text(sampaiCutiController.text),
  //                     ]),
  //                     const SizedBox(height: 10),
  //                     Text('Status : '),
  //                     const SizedBox(width: 1),
  //                     Container(
  //                         width: 490,
  //                         child: Text(
  //                           statusCutiController.text,
  //                           maxLines: 5,
  //                           overflow: TextOverflow.ellipsis,
  //                         )),
  //                     const SizedBox(height: 10),
  //                     Text('Deskripsi : '),
  //                     const SizedBox(width: 1),
  //                     Container(
  //                         width: 490,
  //                         child: Text(
  //                           deskripsiCutiController.text,
  //                           maxLines: 5,
  //                           overflow: TextOverflow.ellipsis,
  //                         )),
  //                     const SizedBox(height: 10),
  //                     Text('Nama Direktur: '),
  //                     const SizedBox(width: 1),
  //                     const SizedBox(height: 10),
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.end,
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: <Widget>[
  //                         const SizedBox(width: 70),
  //                         IconButton(
  //                           icon: Icon(Icons.cancel),
  //                           onPressed: () {
  //                             Get.to(DataPengalamanKerja());
  //                           },
  //                         ),
  //                         const SizedBox(width: 20),
  //                         IconButton(
  //                           icon: Icon(Icons.check),
  //                           onPressed: () {
  //                             Get.to(PengalamanKerjaResult());
  //                           },
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ]),
  //           ),
  //         ));
  //       });
  //   final bool isValid = _formKey.currentState!.validate();
  //   if (isValid) {
  //     if (kDebugMode) {
  //       print('Got a valid input');
  //     }
  //     // And do something here
  //   }
  // }

  // DateTime _dateTime1 = DateTime.now();
  // var _daritodoDateController1 = TextEditingController();
  // Future _dariselectedTodoDate1(BuildContext context) async {
  //   var _pickedDate1 = await showDatePicker(
  //     context: context,
  //     initialDate: _dateTime1,
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(2030),
  //   );

  //   if (_pickedDate1 != null) {
  //     setState(() {
  //       _dateTime1 = _pickedDate1;
  //       _daritodoDateController1.text =
  //           DateFormat('d-MM-yyyy').format(_pickedDate1);
  //     });
  //   }
  // }

  // DateTime _dateTime11 = DateTime.now();
  // var _sampaitodoDateController11 = TextEditingController();
  // Future _sampaiselectedTodoDate11(BuildContext context) async {
  //   var _pickedDate11 = await showDatePicker(
  //     context: context,
  //     initialDate: _dateTime11,
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(2030),
  //   );

  //   if (_pickedDate11 != null) {
  //     setState(() {
  //       _dateTime11 = _pickedDate11;
  //       _sampaitodoDateController11.text =
  //           DateFormat('d-MM-yyyy').format(_pickedDate11);
  //     });
  //   }
  // }

  //dari sampai 1

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _start.text = DateFormat('d-MM-yyyy').format(dateRange.start);
    _end.text = DateFormat('d-MM-yyyy').format(dateRange.end);
    final difference = dateRange.duration;
    final days = difference.inDays + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request Leave",
          style: GoogleFonts.rubik(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800)),
        ),
        leadingWidth: 30,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF45C2E3),
        leading: GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: ImageIcon(
                AssetImage(
                  'assets/icons/exit_app.png',
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 0,
                ),
                Text(
                  "Request Leave",
                  style: blackFontStyle,
                ),
                const SizedBox(
                  height: 40,
                ),
                //RECIPIENTS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: quicksandFontStyle.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: 'Recipents :'),
                              TextSpan(
                                  text: '',
                                  style: quicksandFontStyle.copyWith(
                                      color: redColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                            ])),
                    RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: quicksandFontStyle.copyWith(
                                color: secondColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: 'Administrator'),
                              TextSpan(
                                  text: '',
                                  style: quicksandFontStyle.copyWith(
                                      color: redColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                            ])),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                //TIMEOFTYPE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: quicksandFontStyle.copyWith(
                                color: secondColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: 'Time Off Type '),
                              TextSpan(
                                  text: '',
                                  style: quicksandFontStyle.copyWith(
                                      color: redColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                            ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(25.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: greyColor),
                            hintText: "Name",
                            fillColor: greyColor),
                        value: catagory,
                        hint: const Text('Pilih Tipe'),
                        onChanged: (int? selectedValue) {
                          setState(() {
                            catagory = selectedValue!;
                          });
                          print('You selected "$catagory"');
                        },
                        items: _leaveController.catagories
                            .map((RecordsListType item) {
                          return DropdownMenuItem(
                            value: item.id,
                            child: Text(item.name.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                    // Obx(
                    //   () => DropdownButton(
                    //     isExpanded: true,
                    //     isDense:
                    //         true, // Reduces the dropdowns height by +/- 50%
                    //     icon: Icon(Icons.keyboard_arrow_down),
                    //     hint: const Text('Pilih Tipe'),
                    //     value: catagory,
                    //     items: _leaveController.catagories
                    //         .map((RecordsListType item) {
                    //       return DropdownMenuItem(
                    //         value: item.id,
                    //         child: Text(item.name.toString()),
                    //       );
                    //     }).toList(),
                    //     onChanged: (int? selectedValue) {
                    //       // _leaveController.changeSelect(selectedValue.toString());

                    //       // catagory = _leaveController.selectedItem.value;
                    //       // print(catagory);
                    //       // print(selectedValue.toString());
                    //       setState(() {
                    //         catagory = selectedValue;
                    //       });
                    //       print(catagory);
                    //       print('You selected "$catagory"');
                    //     },
                    //   ),
                    // ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                //LEAVE DURATION
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: quicksandFontStyle.copyWith(
                                color: secondColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: 'Leave Duration '),
                              TextSpan(
                                  text: '',
                                  style: quicksandFontStyle.copyWith(
                                      color: redColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                            ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.33,
                          height: size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: greyColor,
                          ),
                          child: Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: size.width * 0.01,
                                right: size.width * 0.00,
                              ),
                              alignment: AlignmentDirectional.center,
                              child: InkWell(
                                onTap: () {
                                  // _dariselectedTodoDate1(context);
                                  pickDateRange();
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/dari.svg",
                                  width: size.width * 0.08,
                                  height: size.height * 0.04,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Flexible(
                                child: TextFormField(
                              readOnly: true,
                              controller: _start,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value != null && value.trim().length < 2) {
                                  return 'This field requires a minimum of 2 characters';
                                }

                                return null;
                              },
                              onTap: () {
                                // _dariselectedTodoDate1(context);
                                pickDateRange();
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 5, bottom: 11, top: 11, right: 0),
                                  hintText: "Click Icon Calender",
                                  hintStyle: hintFontStyle),
                            )),
                          ]),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.13,
                          height: size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: greyColor,
                          ),
                          child: Center(child: Text('TO')),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.33,
                          height: size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: greyColor,
                          ),
                          child: Row(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: size.width * 0.01,
                                right: size.width * 0.00,
                              ),
                              alignment: AlignmentDirectional.center,
                              child: InkWell(
                                onTap: () {
                                  // _sampaiselectedTodoDate11(context);
                                  pickDateRange();
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/dari.svg",
                                  width: size.width * 0.08,
                                  height: size.height * 0.04,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Flexible(
                                child: TextFormField(
                              readOnly: true,
                              controller: _end,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value != null && value.trim().length < 2) {
                                  return 'This field requires a minimum of 2 characters';
                                }

                                return null;
                              },
                              onTap: () {
                                // _sampaiselectedTodoDate11(context);
                                pickDateRange();
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 5, bottom: 11, top: 11, right: 0),
                                  hintText: "Click Icon Calender",
                                  hintStyle: hintFontStyle),
                            )),
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('$days DAYS'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                //DESCRIPTION

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: quicksandFontStyle.copyWith(
                                color: secondColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: 'Description '),
                              TextSpan(
                                  text: '',
                                  style: quicksandFontStyle.copyWith(
                                      color: redColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                            ])),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: size.width * 0.9,
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: greyColor,
                      ),
                      child: Container(
                          margin: EdgeInsets.only(
                            left: size.width * 0.03,
                            right: size.width * 0.01,
                          ),
                          alignment: AlignmentDirectional.topStart,
                          child: TextField(
                            controller: deskripsiCutiController,
                            maxLines: 10,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukan alasan pengajuan cuti / izin',
                            ),
                          )),
                    ),
                  ],
                ),
//BUTTON AJUKAN
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.45,
                  height: size.height * 0.075,
                  // color: Color(0xFF45C2E3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF45C2E3), // background
                          onPrimary: Colors.white, // foreground
                        ),
                        // padding: EdgeInsets.symmetric(
                        //     vertical: 10, horizontal: 10),
                        // color: mainColor,
                        onPressed: () {
                          if (deskripsiCutiController.text.isEmpty) {
                            showWarning("Please fill Description");
                          } else {
                            _leaveController.createLeaveApi(
                                "leave",
                                catagory,
                                deskripsiCutiController.text,
                                // start.toString(),
                                DateFormat("yyyy-MM-dd")
                                    .format(dateRange.start),
                                DateFormat("yyyy-MM-dd").format(dateRange.end),
                                // end.toString(),
                                _leaveController.empData.value.id,
                                days.toDouble());
                            Get.back();
                          }
                        }
                        // _saveForm
                        ,
                        child: Text(
                          "Ajukan",
                          style: quicksandFontStyle.copyWith(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }
}
