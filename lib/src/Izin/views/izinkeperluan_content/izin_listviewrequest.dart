import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/Izin/controllers/izin_controller.dart';
import 'package:meditation_app/src/Izin/views/izinkeperluan_content/izin.dart';
import 'package:meditation_app/src/Izin/views/izinkeperluan_content/izin_response.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_managers.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_item_user.dart';

class IzinRequestListView extends StatefulWidget {
  const IzinRequestListView({Key? key}) : super(key: key);

  @override
  State<IzinRequestListView> createState() => _IzinRequestListViewState();
}

class _IzinRequestListViewState extends State<IzinRequestListView> {
  final _izinController = Get.put(IzinController());
  // final _reqizin = ReqDinasViewModel(reqIzinItems: []);
  String _typePermission = "permission";

  @override
  void initState() {
    super.initState();
    _izinController.getListLeave(_typePermission);
    _izinController.searchPermission(_typePermission);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(IzinForm());
        },
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add),
      ),
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
                child: new ItemViewRequestLeaveUser(
                  reqIzin.user!.last.toString(),
                  reqIzin.dateFrom.toString(),
                  reqIzin.dateTo.toString(),
                  // reqIzin.state.toString(),
                  reqIzin.leaveType!.last.toString(),
                  reqIzin.name.toString(),
                  reqIzin.status.toString(),
                ));
          },
        );
      }),
    );
  }
}

class ReqDinasViewModel {
  List<RequestIzinResponseIzin> reqIzinItems;
  ReqDinasViewModel({required this.reqIzinItems});
  getreqizin() => <RequestIzinResponseIzin>[
        RequestIzinResponseIzin(
          rinameRequestIzinLeave: 'Muhamad Nurdin Izin',
          rimulaiIzinRequestLeave: '20-02-2019 ',
          risampaiIzinRequestLeave: '24-02-2019 ',
          ricontactIzinRequestLeave: '085157515266',
          ritipeIzinRequestLeave: 'Izin',
          rireasonIzinRequestLeave:
              'IZIN IZIN IZIN IZIN Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker,Sakit Keras Butuh Cuti / Kanker',
        ),
      ];
}
