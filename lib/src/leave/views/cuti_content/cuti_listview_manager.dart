import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/leave/controllers/leave_controller.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_managers.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_user.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_response.dart';

class CutiListViewMyRequest extends StatefulWidget {
  const CutiListViewMyRequest({Key? key}) : super(key: key);

  @override
  State<CutiListViewMyRequest> createState() => _CutiListViewMyRequestState();
}

class _CutiListViewMyRequestState extends State<CutiListViewMyRequest> {
  // final _postPoneVM = PostPoneViewModel(postPoneItems: []);
  late List<PostPoneResponse> postPoneItems;
  final _leaveControllerManager = Get.put(LeaveController());
  String _typePermission = "leave";

  @override
  void initState() {
    super.initState();
    // postPoneItems = _postPoneVM.getPostPone();
    _leaveControllerManager.searchLeave();
    _leaveControllerManager.getListLeave(_typePermission);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Obx(() {
        return ListView.builder(
          itemCount: _leaveControllerManager.listOfPartners.length,
          itemBuilder: (context, index) {
            var reqLeave = _leaveControllerManager.listOfPartners[index];
            return new Card(
                color: Theme.of(context).cardColor,
                //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10.0),
                        top: Radius.circular(10.0)),
                    side: BorderSide(width: 1, color: Colors.black)),
                child: new ItemViewRequestLeaveManager(
                  reqLeave.user!.last,
                  reqLeave.dateFrom.toString(),
                  reqLeave.dateTo.toString(),
                  // reqLeave.rlcontactCutiRequestLeave,
                  reqLeave.leaveType!.last,
                  reqLeave.name.toString(),
                ));
          },
        );
      }),
    );
  }
}

// class PostPoneViewModel {
//   List<PostPoneResponse> postPoneItems;
//   PostPoneViewModel({required this.postPoneItems});
//   getPostPone() => <PostPoneResponse>[
//         PostPoneResponse(
//             namaKaryawan: 'Muhamad Nurdin',
//             assignTime: '20-02-2019 10:51PM',
//             postponeTime: '24-02-2019 10:51PM',
//             contactNo: '085157515266',
//             tipeCuti: 'Tipe Cuti',
//             postponedReason: 'Sakit',
//             mulaiCutiKaryawan: '20-02-2019 ',
//             sampaiCutiKaryawan: '24-02-2019 ',
//             description: 'Status Cuti',
//             refNo: 1.00,
//             codAmount: 1200.00),
//         PostPoneResponse(
//             namaKaryawan: 'AMuhamad Mukhlis',
//             assignTime: '20-02-2019 10:51PM',
//             postponeTime: '24-02-2019 10:51PM',
//             contactNo: '085157515266',
//             tipeCuti: 'Tipe Cuti',
//             postponedReason: 'Sakit',
//             mulaiCutiKaryawan: '20-02-2019 ',
//             sampaiCutiKaryawan: '24-02-2019 ',
//             description: 'Status Cuti',
//             refNo: 1.00,
//             codAmount: 1200.00),
//         PostPoneResponse(
//             namaKaryawan: 'Boy Fikri',
//             assignTime: '20-02-2019 10:51PM',
//             postponeTime: '24-02-2019 10:51PM',
//             contactNo: '085157515266',
//             tipeCuti: 'Tipe Cuti',
//             postponedReason: 'Sakit',
//             mulaiCutiKaryawan: '20-02-2019 ',
//             sampaiCutiKaryawan: '24-02-2019 ',
//             description: 'Status Cuti',
//             refNo: 1.00,
//             codAmount: 1200.00),
//       ];
// }
