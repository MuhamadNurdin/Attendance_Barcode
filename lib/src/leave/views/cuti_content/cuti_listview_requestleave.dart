import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/leave/controllers/leave_controller.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_managers.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_user.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_response.dart';

class RequestLeaveListView extends StatefulWidget {
  const RequestLeaveListView({Key? key}) : super(key: key);

  @override
  State<RequestLeaveListView> createState() => _RequestLeaveListViewState();
}

class _RequestLeaveListViewState extends State<RequestLeaveListView> {
  final _leaveController = Get.put(LeaveController());
  // final _reqleaveVM = ReqLeaveViewModel(reqleaveItems: []);
  // late List<RequestLeaveResponse> reqleaveItems;
  String _typePermission = "leave";

  @override
  void initState() {
    super.initState();
    // reqleaveItems = _reqleaveVM.getreqleave();
    _leaveController.searchLeave();
    _leaveController.getListLeave(_typePermission);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CutiForm());
        },
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: _leaveController.listOfPartners.length,
          itemBuilder: (context, index) {
            var reqLeave = _leaveController.listOfPartners[index];
            return new Card(
                color: Theme.of(context).cardColor,
                //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10.0),
                        top: Radius.circular(10.0)),
                    side: BorderSide(width: 1, color: Colors.black)),
                child: new ItemViewRequestLeaveUser(
                  reqLeave.user!.last,
                  reqLeave.dateFrom.toString(),
                  reqLeave.dateTo.toString(),
                  // reqLeave.rlcontactCutiRequestLeave,
                  reqLeave.leaveType!.last,
                  reqLeave.name.toString(),
                  reqLeave.state.toString(),
                ));
          },
        );
      }),
    );
  }
}

class ReqLeaveViewModel {
  List<RequestLeaveResponse> reqleaveItems;
  ReqLeaveViewModel({required this.reqleaveItems});
  getreqleave() => <RequestLeaveResponse>[
        RequestLeaveResponse(
          rlnameRequestLeave: 'Muhamad Nurdin',
          rlmulaiCutiRequestLeave: '20-02-2019 ',
          rlsampaiCutiRequestLeave: '24-02-2019 ',
          rlcontactCutiRequestLeave: '085157515266',
          rltipeCutiRequestLeave: 'Sakit',
          rlreasonRequestLeave:
              'Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker',
        ),
        RequestLeaveResponse(
          rlnameRequestLeave: 'Muhamad Nurdin',
          rlmulaiCutiRequestLeave: '20-02-2019 ',
          rlsampaiCutiRequestLeave: '24-02-2019 ',
          rlcontactCutiRequestLeave: '085157515266',
          rltipeCutiRequestLeave: 'Sakit',
          rlreasonRequestLeave: 'Sakit Keras Butuh Cuti / Kanker',
        ),
        RequestLeaveResponse(
          rlnameRequestLeave: 'Muhamad Nurdin',
          rlmulaiCutiRequestLeave: '20-02-2019 ',
          rlsampaiCutiRequestLeave: '24-02-2019 ',
          rlcontactCutiRequestLeave: '085157515266',
          rltipeCutiRequestLeave: 'Sakit',
          rlreasonRequestLeave: 'Sakit Keras Butuh Cuti / Kanker',
        ),
      ];
}
