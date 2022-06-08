import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/src/leave/controllers/leave_controller.dart';
import 'package:meditation_app/src/leave/models/leave_models.dart';

class CreateLeave extends StatefulWidget {
  // final List<dynamic> leaveType;
  // CreateLeave(this.leaveType);

  @override
  _CreateLeaveState createState() => _CreateLeaveState();
}

class _CreateLeaveState extends State<CreateLeave> {
  final _leaveController = Get.put(LeaveController());
  String dropdownValue = '';
  int? catagory;
  final desc = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _leaveController.searchLeave();
  //   print(_leaveController.responseType.value);
  // }

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    final days = difference.inDays + 1;

    return Scaffold(
      body: SafeArea(
          child: Form(
              child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => DropdownButton(
                isExpanded: true,
                isDense: true, // Reduces the dropdowns height by +/- 50%
                icon: Icon(Icons.keyboard_arrow_down),
                hint: const Text('Pilih Tipe'),
                value: catagory,
                items: _leaveController.catagories.map((RecordsListType item) {
                  return DropdownMenuItem(
                    value: item.id,
                    child: Text(item.name.toString()),
                  );
                }).toList(),
                onChanged: (int? selectedValue) {
                  // _leaveController.changeSelect(selectedValue.toString());

                  // catagory = _leaveController.selectedItem.value;
                  // print(catagory);
                  // print(selectedValue.toString());
                  setState(() {
                    catagory = selectedValue;
                  });
                  print(catagory);
                  print('You selected "$catagory"');
                },
              ),
            ),
            Text(
              'Date Range',
              style: TextStyle(height: 12),
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text('${start.day}/${start.month}/${start.year}'),
                    onPressed: () {
                      pickDateRange();
                    },
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Expanded(
                  child: ElevatedButton(
                    child: Text('${end.day}/${end.month}/${end.year}'),
                    onPressed: () {
                      pickDateRange();
                    },
                  ),
                ),
              ],
            ),
            Text(
              'Total: ${days.toString()} Hari',
              style: TextStyle(height: 12),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Deskripsi', filled: true, isDense: true),
              controller: desc,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (desc.text.isEmpty) {
                  showWarning("Please fill Description");
                } else {
                  _leaveController.createLeaveApi(
                      "leave",
                      catagory,
                      desc.text,
                      // start.toString(),
                      DateFormat("yyyy-MM-dd").format(start),
                      DateFormat("yyyy-MM-dd").format(end),
                      // end.toString(),
                      _leaveController.empData.value.id,
                      days.toDouble());
                  Get.back();
                }

                // print(_leaveController.responseType.value);
              },
              child: const Text("Submit"),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
            )
          ],
        ),
      ))),
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
