import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/dinasLuar/controllers/dinas_controller.dart';
import 'package:meditation_app/src/dinasLuar/views/dinasluar_content/dinas_response.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_managers.dart';

class DinasBossView extends StatefulWidget {
  const DinasBossView({Key? key}) : super(key: key);

  @override
  State<DinasBossView> createState() => _DinasBossViewState();
}

class _DinasBossViewState extends State<DinasBossView> {
  final _dinasController = Get.put(DinasController());
  String _typePermission = "outstation";

  @override
  void initState() {
    super.initState();
    _dinasController.getListLeave(_typePermission);
    _dinasController.searchPermission(_typePermission);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.to(CutiForm());
      //   },
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.add),
      // ),
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
                child: new ItemViewRequestLeaveManager(
                  reqDinas.user!.last.toString(),
                  reqDinas.dateFrom.toString(),
                  reqDinas.dateTo.toString(),
                  // reqDinas.state.toString(),
                  reqDinas.leaveType!.last.toString(),
                  reqDinas.name.toString(),
                ));
          },
        );
      }),
    );
  }
}

class ReqDinasBossViewModel {
  List<RequestLeaveBossViewResponse> reqleaveDinasItems;
  ReqDinasBossViewModel({required this.reqleaveDinasItems});
  getreqdinasbossview() => <RequestLeaveBossViewResponse>[
        RequestLeaveBossViewResponse(
          bvnameRequestDinasLeave: 'Muhamad Nurdin BOSS VIEW',
          bvmulaiDinasRequestLeave: '20-02-2019 ',
          bvsampaiDinasRequestLeave: '24-02-2019 ',
          bvcontactDinasRequestLeave: '085157515266',
          bvtipeDinasRequestLeave: 'Sakit',
          bvreasonRequestLeave:
              'dinas boos view test Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker',
        ),
      ];
}
