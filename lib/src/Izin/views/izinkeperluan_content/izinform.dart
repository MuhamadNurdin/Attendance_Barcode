import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/constantmaterial/shared.dart';
import 'package:meditation_app/src/profile/datakaryawan/data_pengalamankerja.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_pengalamankerja.dart';

class IzinForm extends StatefulWidget {
  const IzinForm({Key? key}) : super(key: key);

  @override
  State<IzinForm> createState() => _IzinFormState();
}

class _IzinFormState extends State<IzinForm> {
  late String dropDowntypeValue;
  @override
  void initState() {
    //setFilters();
    dropDowntypeValue = 'Izin';
    super.initState();
  }

  setFilters() {
    setState(() {
      dropDowntypeValue = typetimeof[2];
    });
  }

  List<String> typetimeof = [
    'Izin',
    'Type 2',
    'Type 3',
    'Type 4',
  ];
  final GlobalKey<FormState> _formKey = GlobalKey();
  final namakaryawanIzinController = TextEditingController();
  final dariIzinController = TextEditingController();
  final sampaiIzinController = TextEditingController();
  final statusIzinController = TextEditingController();
  final deskripsiIzinController = TextEditingController();

  // This function is triggered when the "Save" button is pressed
  void _saveForm() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Scrollbar(
            thickness: 10,
            isAlwaysShown: true,
            radius: Radius.circular(10),
            child: Container(
              height: 300,
              width: 500,
              child: ListView(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Text('Nama Karyawan : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            namakaryawanIzinController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Dari '),
                        const SizedBox(width: 1),
                        Text(dariIzinController.text),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text('Sampai '),
                        const SizedBox(width: 1),
                        Text(sampaiIzinController.text),
                      ]),
                      const SizedBox(height: 10),
                      Text('Status : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            statusIzinController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Deskripsi : '),
                      const SizedBox(width: 1),
                      Container(
                          width: 490,
                          child: Text(
                            deskripsiIzinController.text,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(height: 10),
                      Text('Nama Direktur: '),
                      const SizedBox(width: 1),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const SizedBox(width: 70),
                          IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              Get.to(DataPengalamanKerja());
                            },
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              Get.to(PengalamanKerjaResult());
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ));
        });
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      if (kDebugMode) {
        print('Got a valid input');
      }
      // And do something here
    }
  }

  DateTime _dateTime1 = DateTime.now();
  var _daritodoDateController1 = TextEditingController();
  Future _dariselectedTodoDate1(BuildContext context) async {
    var _pickedDate1 = await showDatePicker(
      context: context,
      initialDate: _dateTime1,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
    );

    if (_pickedDate1 != null) {
      setState(() {
        _dateTime1 = _pickedDate1;
        _daritodoDateController1.text =
            DateFormat('d-MM-yyyy').format(_pickedDate1);
      });
    }
  }

  DateTime _dateTime11 = DateTime.now();
  var _sampaitodoDateController11 = TextEditingController();
  Future _sampaiselectedTodoDate11(BuildContext context) async {
    var _pickedDate11 = await showDatePicker(
      context: context,
      initialDate: _dateTime11,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
    );

    if (_pickedDate11 != null) {
      setState(() {
        _dateTime11 = _pickedDate11;
        _sampaitodoDateController11.text =
            DateFormat('d-MM-yyyy').format(_pickedDate11);
      });
    }
  }

  //dari sampai 1

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Data Diri'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Izin Keperluan",
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
                    DropdownButtonFormField(
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
                      value: dropDowntypeValue,
                      onChanged: (String? droptypevalue) {
                        setState(() {
                          dropDowntypeValue = droptypevalue!;
                        });
                      },
                      items: typetimeof
                          .map((cityTitle) => DropdownMenuItem(
                              value: cityTitle, child: Text("$cityTitle")))
                          .toList(),
                    ),
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
                                  _dariselectedTodoDate1(context);
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
                              controller: _daritodoDateController1,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value != null && value.trim().length < 2) {
                                  return 'This field requires a minimum of 2 characters';
                                }

                                return null;
                              },
                              onTap: () {
                                _dariselectedTodoDate1(context);
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
                                  _sampaiselectedTodoDate11(context);
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
                              controller: _sampaitodoDateController11,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value != null && value.trim().length < 2) {
                                  return 'This field requires a minimum of 2 characters';
                                }

                                return null;
                              },
                              onTap: () {
                                _sampaiselectedTodoDate11(context);
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
                    Text('DAYS'),
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukan alasan pengajuan Dinas Luar',
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(

                        // padding: EdgeInsets.symmetric(
                        //     vertical: 10, horizontal: 10),
                        // color: mainColor,
                        onPressed: _saveForm,
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
}
