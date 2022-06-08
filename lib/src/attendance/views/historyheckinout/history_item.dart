import 'package:flutter/material.dart';

class HistoryItemView extends StatelessWidget {
  final String namekaryawanHistory;
  final String checkinhistory;
  final String checkouthistory;

  HistoryItemView(
      this.namekaryawanHistory, this.checkinhistory, this.checkouthistory);

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
          ),
          child: nameCallMap(
            namekaryawanHistory,
            checkinhistory,
            checkouthistory,
          ),
        ),
        new Expanded(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 30),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // new Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       expandStyle(3, widgetInquiryNo(inquiryNo)),
                //       expandStyle(2, widgetRs(amount)),
                //       expandStyle(2, widgetDateTime(dateTime)),
                //     ]),
                widgetName(namekaryawanHistory),
                // widgetModel(
                //   pemakaianjatahCutiLeaveBalance,
                //   totalsisaCutiLeaveBalance,
                // ),
                SizedBox(height: 30),
                widgetHistoryCheckin(checkinhistory),
                SizedBox(height: 15),
                widgetHistoryCheckout(checkouthistory),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class ItemViewRequestLeave extends StatelessWidget {
//   final String nameRequestLeave;
//   final String mulaiCutiRequestLeave;
//   final String sampaiCutiRequestLeave;
//   final String contactCutiRequestLeave;
//   final String tipeCutiRequestLeave;
//   final String reasonRequestLeave;

//   ItemViewRequestLeave(
//     this.nameRequestLeave,
//     this.mulaiCutiRequestLeave,
//     this.sampaiCutiRequestLeave,
//     this.contactCutiRequestLeave,
//     this.tipeCutiRequestLeave,
//     this.reasonRequestLeave,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return new Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         new Padding(
//           padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
//           child: nameCallMap(
//             nameRequestLeave,
//             mulaiCutiRequestLeave,
//             sampaiCutiRequestLeave,
//           ),
//         ),
//         new Expanded(
//           child: new Padding(
//             padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 // new Row(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: [
//                 //       expandStyle(3, widgetInquiryNo(inquiryNo)),
//                 //       expandStyle(2, widgetRs(amount)),
//                 //       expandStyle(2, widgetDateTime(dateTime)),
//                 //     ]),
//                 widgetName(nameRequestLeave),
//                 widgetModel(mulaiCutiRequestLeave, sampaiCutiRequestLeave),
//                 SizedBox(height: 15),
//                 widgethistorystatus(contactCutiRequestLeave),
//                 SizedBox(height: 15),
//                 widgettipeCuti(tipeCutiRequestLeave),
//                 widgetReason(reasonRequestLeave),
//                 // widgetDetailCuti(detailCuti),
//                 // widgetDeliveryType(deliveryType)
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

//TODO PICK UP DETAIL WIDGETS
nameCallMap(String name, String mobile, String address) => Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 21.0,
            child: new Text(
              name.substring(0, 1),
              style: new TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 21.0,
            child: new Icon(Icons.phone, color: Colors.orange.shade200),
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 21.0,
              child: new Icon(Icons.map, color: Colors.blue.shade200),
              backgroundColor: Colors.transparent,
            )),
        SizedBox(height: 30)
      ],
    );

widgetInquiryNo(String inquiryNo) => new Column(children: [
      new Text(
        inquiryNo.contains(".") ? inquiryNo.split(".")[0] : inquiryNo,
        style: new TextStyle(
            fontFamily: 'Raleway', fontSize: 15.0, color: Colors.lightBlue),
      ),
      new Container(
        color: Colors.lightBlue,
        width: inquiryNo.length <= 3 ? 7.0 * inquiryNo.length : 21.0,
        height: 1.5,
      ),
    ], crossAxisAlignment: CrossAxisAlignment.start);

widgetDateTime(String dateTime) => new Text(
      dateTime.split(" ")[0] + "\n" + dateTime.split(" ")[1],
      textAlign: TextAlign.right,
      style: new TextStyle(fontSize: 11.0, color: Colors.black26),
    );

widgetRs(String amount) => new Text(
      amount.isEmpty ? "" : "Rs. " + amount,
      textAlign: TextAlign.right,
      style: new TextStyle(fontSize: 14.0, color: Colors.black26),
    );

widgetName(String name) => new Container(
      margin: new EdgeInsetsDirectional.only(top: 10.0),
      child: Text(
        name,
        style: new TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 17.0,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );

widgetModel(String brand, String model) => new Text(
      brand + " - " + model,
      style: new TextStyle(fontSize: 14.0, color: Colors.black45),
    );

widgethistorystatus(String widgetcontactCuti) => new Text(
      widgetcontactCuti + "Status = ",
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

widgetHistoryCheckin(String widgetcurentCuti) => new Text(
      widgetcurentCuti + "     Checked In",
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

widgetHistoryCheckout(String widgetaccuiredCuti) => new Text(
      widgetaccuiredCuti + "     Checked Out",
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

widgetStatusHitory(String widgetcreditedCuti) => new Text(
      "Status = " + widgetcreditedCuti,
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

widgetHistory8our(String widgetcreditedCuti) => new Text(
      "Telah Memenuhi 8 Jam Kerja = " + widgetcreditedCuti,
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

widgettipeCuti(String tipeCuti) => new Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Text(
        tipeCuti,
        style: new TextStyle(fontSize: 15.0, color: Colors.black87),
      ),
    );

widgetReason(String reason) => reason.isEmpty
    ? Container()
    : new Padding(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
        child: Text(
          reason,
          style: new TextStyle(fontSize: 13, color: Colors.deepOrangeAccent),
        ),
      );

widgetDetailCuti(String detailCuti) => detailCuti.isEmpty
    ? Container()
    : new Padding(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
        child: Text(
          detailCuti,
          style: new TextStyle(fontSize: 13, color: Colors.black),
        ),
      );

widgetDeliveryType(String deliveryType) => deliveryType.isEmpty
    ? Container()
    : new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Text(deliveryType, style: new TextStyle(fontSize: 12.0))
        ],
      );

buttonTextStyle(String btnName) =>
    new Text(btnName, style: new TextStyle(fontSize: 12.0));

expandStyle(int flex, Widget child) => Expanded(flex: flex, child: child);
