import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/Izin/controllers/izin_controller.dart';
import 'package:meditation_app/src/Izin/views/izinkeperluan_content/izin_response.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_managers.dart';

class IzinBossView extends StatefulWidget {
  const IzinBossView({Key? key}) : super(key: key);

  @override
  State<IzinBossView> createState() => _IzinBossViewState();
}

class _IzinBossViewState extends State<IzinBossView> {
  late List<RequestIzinResponseIzin> reqizinItems;
  final _izinController = Get.put(IzinController());
  String _typePermission = "permission";

  @override
  void initState() {
    super.initState();
    _izinController.getListLeave(_typePermission);
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
          itemCount: _izinController.listOfPartners.length,
          itemBuilder: (context, index) {
            var reqIzin = _izinController.listOfPartners[index];
            return new Card(
                color: Theme.of(context).cardColor,
                //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10.0), top: Radius.circular(2.0)),
                ),
                child: new ItemViewRequestLeaveManager(
                  reqIzin.user!.last.toString(),
                  reqIzin.dateFrom.toString(),
                  reqIzin.dateTo.toString(),
                  // reqIzin.state.toString(),
                  reqIzin.leaveType!.last.toString(),
                  reqIzin.name.toString(),
                ));
          },
        );
      }),
    );
  }
}

class ReqIzinBossViewModel {
  List<RequestIzinBossViewResponse> reqIzinBVItems;
  ReqIzinBossViewModel({required this.reqIzinBVItems});
  getreqIZINbossview() => <RequestIzinBossViewResponse>[
        RequestIzinBossViewResponse(
          bvnameRequestIzin: 'Muhamad Izin Nurdin BOSS VIEW',
          bvmulaiIzin: '20-02-2019 ',
          bvsampaiIzin: '24-02-2019 ',
          bvcontactIzin: '085157515266',
          bvtipeIzin: 'Izin',
          bvreasonIzin:
              'Izin boos view test Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker',
        ),
      ];
}
