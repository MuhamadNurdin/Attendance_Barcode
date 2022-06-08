import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/dinasLuar/controllers/dinas_controller.dart';
import 'package:meditation_app/src/dinasLuar/views/dinasluar_content/dinasform.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_managers.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_user.dart';

class DinasRequestListView extends StatefulWidget {
  const DinasRequestListView({Key? key}) : super(key: key);

  @override
  State<DinasRequestListView> createState() => _DinasRequestListViewState();
}

class _DinasRequestListViewState extends State<DinasRequestListView> {
  final _dinasController = Get.put(DinasController());
  String _typePermission = "outstation";

  @override
  void initState() {
    super.initState();
    // reqdinasItems = _reqdinas.getreqdinas();
    _dinasController.getListLeave(_typePermission);
    _dinasController.searchPermission(_typePermission);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(DinasForm());
        },
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: _dinasController.listOfPartners.length,
          itemBuilder: (context, index) {
            var reqDinas = _dinasController.listOfPartners[index];
            return new Card(
                color: Theme.of(context).cardColor,
                //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10.0),
                        top: Radius.circular(10.0)),
                    side: BorderSide(width: 1, color: Colors.black)),
                child: new ItemViewRequestLeaveUser(
                  reqDinas.user!.last.toString(),
                  reqDinas.dateFrom.toString(),
                  reqDinas.dateTo.toString(),
                  // reqDinas.state.toString(),
                  reqDinas.leaveType!.last.toString(),
                  reqDinas.name.toString(),
                  reqDinas.status.toString(),
                ));
          },
        );
      }),
    );
  }
}

// class ReqDinasViewModel {
//   List<RequestLeaveResponseDinas> reqdinasItems;
//   ReqDinasViewModel({required this.reqdinasItems});
//   getreqdinas() => <RequestLeaveResponseDinas>[
//         RequestLeaveResponseDinas(
//           rlnameRequestDinasLeave: 'Muhamad Nurdin Dinas',
//           rlmulaiDinasRequestLeave: '20-02-2019 ',
//           rlsampaiDinasRequestLeave: '24-02-2019 ',
//           rlcontactDinasRequestLeave: '085157515266',
//           rltipeDinasRequestLeave: 'Dinas',
//           rlreasonDinasRequestLeave:
//               'DINAS DINAS DINAS DINAS Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker',
//         ),
//       ];
// }
