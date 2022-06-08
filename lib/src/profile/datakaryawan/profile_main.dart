import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/modules/authentication_module.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/constantmaterial/constants.dart';
import 'package:meditation_app/src/profile/account/account_screen.dart';
import 'package:meditation_app/src/profile/account/account_view.dart';
import 'package:meditation_app/src/profile/datadiri/data_diri.dart';
import 'package:meditation_app/src/profile/datadiri/data_diri_view.dart';
import 'package:meditation_app/src/profile/datakaryawan/data_keluarga.dart';
import 'package:meditation_app/src/profile/datakaryawan/data_pelatihanseminar.dart';
import 'package:meditation_app/src/profile/datakaryawan/data_pendidikan.dart';
import 'package:meditation_app/src/profile/datakaryawan/data_pengalamankerja.dart';
import 'package:meditation_app/src/profile/datakaryawan/new_password.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_data_keluarga.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_data_pendidikan.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_pelatihanseminar.dart';
import 'package:meditation_app/src/profile/datakaryawan/view_pengalamankerja.dart';

class ProfileDataKaryawan extends StatefulWidget {
  @override
  _ProfileDataKaryawanState createState() => _ProfileDataKaryawanState();
}

class _ProfileDataKaryawanState extends State<ProfileDataKaryawan> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(20.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile Data Karyawan",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          leadingWidth: 30,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF45C2E3),
          leading: GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: ImageIcon(
                  AssetImage(
                    'assets/icons/exit_app.png',
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/Lock.svg",
            press: () {
              Get.to(AccountView());
            },
          ),
          ProfileMenu(
            text: "Data Diri",
            icon: "assets/icons/icon_datadiri.svg",
            press: () {
              Get.to(DataDiriView());
            },
          ),
          ProfileMenu(
            text: "Data Keluarga",
            icon: "assets/icons/icon_datakeluarga.svg",
            press: () {
              Get.to(DataKeluargaView());
            },
          ),
          ProfileMenu(
            text: "Data Pendidikan",
            icon: "assets/icons/icon_datapendidikan.svg",
            press: () {
              Get.to(ViewDataPendidikan());
            },
          ),
          ProfileMenu(
            text: "Data Pengalaman Kerja",
            icon: "assets/icons/icon_pengalamankerja.svg",
            press: () {
              Get.to(PengalamanKerjaResult());
            },
          ),
          ProfileMenu(
            text: "Data Pelatihan & Seminar",
            icon: "assets/icons/icon_seminar.svg",
            press: () {
              Get.to(PelatihanSeminarResult());
            },
          ),
          ProfileMenu(
            text: "Change Password",
            icon: "assets/icons/icon_changepassword.svg",
            press: () {
              Get.to(NewPassword());
            },
          ),
          ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/icon_logout.svg",
              press: () {
                // ashowAlertDialog(context);
                showLogoutDialog();
              }),
        ],
      ),
    );
  }

  void ashowAlertDialog(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      title: Text("Logout Application ?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('OK')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('NO')),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Color(0xFF45C2E3),
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFE7FAFF),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.black,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/person.png"),
            backgroundColor: Color(0xff45C2E3),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/search.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
