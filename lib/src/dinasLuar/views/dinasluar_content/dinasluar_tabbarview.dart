import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/dinasLuar/views/dinasluar_content/dinas_bossview.dart';
import 'package:meditation_app/src/dinasLuar/views/dinasluar_content/dinas_listviewrequest.dart';
import 'package:meditation_app/src/dinasLuar/views/dinasluar_content/dinasform.dart';

class DinasLuarTabbarView extends StatefulWidget {
  const DinasLuarTabbarView({Key? key}) : super(key: key);

  @override
  State<DinasLuarTabbarView> createState() => _DinasLuarTabbarViewState();
}

class _DinasLuarTabbarViewState extends State<DinasLuarTabbarView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: list.length, vsync: this); // initialise it here
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  List<Widget> list = [
    Tab(
      child: Column(children: [
        Image.asset(
          'assets/images/leave_icontab.png',
          height: 25,
          // color: Colors.white,
        ),
        SizedBox(height: 5),
        Text(
          'Balance',
          style: TextStyle(color: Colors.white),
        ),
      ]),
    ),
    Tab(
      child: Column(children: [
        Image.asset(
          'assets/images/exit_tabbar.png',
          height: 25,
          // color: Colors.white,
        ),
        SizedBox(height: 5),
        Text(
          'My Request',
          style: TextStyle(color: Colors.white),
        ),
      ]),
    ),
  ];

  textStyle() {
    return TextStyle(color: Colors.black, fontSize: 20.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.to(DinasForm());
      //   },
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.add),
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text(
            "Form Dinas",
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
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: list,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.white),
                insets: EdgeInsets.symmetric(horizontal: 0.0)),

            ///  indicatorPadding: EdgeInsets.all(0.0),
            indicatorWeight: 4.0,
            labelPadding: EdgeInsets.only(left: 30.0, right: 30.0),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          DinasBossView(),
          DinasRequestListView(),
        ],
      ),
    );
  }
}
