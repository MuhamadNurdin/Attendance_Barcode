import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ItemViewRequestLeaveUser extends StatelessWidget {
  final String nameRequestLeaveUser;
  final String mulaiCutiRequestLeaveUser;
  final String sampaiCutiRequestLeaveUser;
  final String tipeCutiRequestLeaveUser;
  final String reasonRequestLeaveUser;
  final String statusCuti;

  ItemViewRequestLeaveUser(
    this.nameRequestLeaveUser,
    this.mulaiCutiRequestLeaveUser,
    this.sampaiCutiRequestLeaveUser,
    this.tipeCutiRequestLeaveUser,
    this.reasonRequestLeaveUser,
    this.statusCuti,
  );

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: nameCallMap(
            nameRequestLeaveUser,
            mulaiCutiRequestLeaveUser,
            sampaiCutiRequestLeaveUser,
          ),
        ),
        new Expanded(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
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
                widgetName(nameRequestLeaveUser),
                widgetModel(
                    mulaiCutiRequestLeaveUser, sampaiCutiRequestLeaveUser),
                SizedBox(height: 10),
                widgettipeCuti(tipeCutiRequestLeaveUser),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.text_snippet_outlined,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      label: Text('Description Detail'),
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.NO_HEADER,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Description Cuti',
                          desc: reasonRequestLeaveUser,
                          // btnCancelOnPress: () {},
                          // btnOkOnPress: () {},
                        )..show();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.tealAccent, // background (button) color
                        onPrimary: Colors.black, // foreground (text) color
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.circle_notifications_outlined,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      label: Text('Status'),
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Status Pengajuan Cuti',
                          desc: statusCuti,
                          // btnCancelOnPress: () {},
                          // btnOkOnPress: () {},
                        )..show();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.tealAccent, // background (button) color
                        onPrimary: Colors.black, // foreground (text) color
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                )
                // widgetReason(reasonRequestLeave),

                // widgetDetailCuti(detailCuti),
                // widgetDeliveryType(deliveryType)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemViewMyRequest extends StatelessWidget {
  final String inquiryNo;
  final String amount;
  final String name;
  final String brand;
  final String lamaCuti;
  final String tipeCuti;
  final String model;
  final String dateTime;
  final String reason;
  // final String detailCuti;
  final String deliveryType;

  ItemViewMyRequest(
      this.inquiryNo,
      this.amount,
      this.name,
      this.brand,
      this.lamaCuti,
      // this.detailCuti,
      this.tipeCuti,
      this.model,
      this.dateTime,
      this.reason,
      this.deliveryType);

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: nameCallMap(
            name,
            lamaCuti,
            tipeCuti,
          ),
        ),
        new Expanded(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
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
                widgetName(name),

                widgetModel(brand, model),
                SizedBox(height: 15),
                widgetcontactCuti(lamaCuti),
                SizedBox(height: 10),
                widgettipeCuti(tipeCuti),
                widgetReason(reason),
                // widgetDetailCuti(detailCuti),
                widgetDeliveryType(deliveryType)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemViewLeaveBalance extends StatelessWidget {
  final String nameLeaveBalance;
  final String jenisCutiLeaveBalance;
  final String totalsisaCutiLeaveBalance;
  final String pemakaianjatahCutiLeaveBalance;
  final String sisaCutiLeaveBalance;

  ItemViewLeaveBalance(
    this.nameLeaveBalance,
    this.jenisCutiLeaveBalance,
    this.totalsisaCutiLeaveBalance,
    this.pemakaianjatahCutiLeaveBalance,
    this.sisaCutiLeaveBalance,
  );

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: nameCallMap(
            nameLeaveBalance,
            totalsisaCutiLeaveBalance,
            sisaCutiLeaveBalance,
          ),
        ),
        new Expanded(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
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
                widgetName(nameLeaveBalance),
                // widgetModel(
                //   pemakaianjatahCutiLeaveBalance,
                //   totalsisaCutiLeaveBalance,
                // ),
                SizedBox(height: 15),
                widgetcurentCuti(jenisCutiLeaveBalance),
                SizedBox(height: 15),
                widgetaccuiredCuti(totalsisaCutiLeaveBalance),
                SizedBox(height: 15),
                widgetcreditedCuti(pemakaianjatahCutiLeaveBalance),
                SizedBox(height: 15),
                widgetannualCuti(sisaCutiLeaveBalance),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemView extends StatelessWidget {
  final String inquiryNo;
  final String amount;
  final String name;
  final String brand;
  final String lamaCuti;
  final String tipeCuti;
  final String model;
  final String dateTime;
  final String reason;
  // final String detailCuti;
  final String deliveryType;

  ItemView(
      this.inquiryNo,
      this.amount,
      this.name,
      this.brand,
      this.lamaCuti,
      // this.detailCuti,
      this.tipeCuti,
      this.model,
      this.dateTime,
      this.reason,
      this.deliveryType);

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: nameCallMap(
            name,
            lamaCuti,
            tipeCuti,
          ),
        ),
        new Expanded(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
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
                widgetName(name),

                widgetModel(brand, model),
                SizedBox(height: 15),
                widgetcontactCuti(lamaCuti),
                SizedBox(height: 15),
                widgettipeCuti(tipeCuti),
                widgetReason(reason),
                // widgetDetailCuti(detailCuti),
                widgetDeliveryType(deliveryType)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 21.0,
            child: new Icon(Icons.phone, color: Colors.orange.shade200),
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 21.0,
              child: new Icon(Icons.mark_email_read_sharp,
                  color: Colors.blue.shade200),
              backgroundColor: Colors.transparent,
            )),
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

widgetcontactCuti(String widgetcontactCuti) => new Text(
      "Contact = " + widgetcontactCuti,
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

widgetaccuiredCuti(String widgetaccuiredCuti) => new Text(
      widgetaccuiredCuti + "     Accurued so far",
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

widgetcurentCuti(String widgetcurentCuti) => new Text(
      widgetcurentCuti + "     Currently Available",
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

widgetcreditedCuti(String widgetcreditedCuti) => new Text(
      widgetcreditedCuti + "     Credited from last year",
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

widgetannualCuti(String widgetcreditedCuti) => new Text(
      widgetcreditedCuti + "     Annual allotment",
      style: new TextStyle(fontSize: 14.0, color: Colors.black),
    );

buttonTextStyle(String btnName) =>
    new Text(btnName, style: new TextStyle(fontSize: 12.0));

expandStyle(int flex, Widget child) => Expanded(flex: flex, child: child);
