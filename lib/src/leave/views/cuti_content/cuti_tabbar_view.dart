import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/src/leave/controllers/leave_controller.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_listview_manager.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_listview_leavebalance.dart';
import 'package:meditation_app/src/leave/views/cuti_content/cuti_listview_requestleave.dart';

class CutiListView1 extends StatefulWidget {
  const CutiListView1({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CutiListView1> createState() => _CutiListView1State();
}

class _CutiListView1State extends State<CutiListView1>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final _leaveController = Get.put(LeaveController());

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: list.length, vsync: this); // initialise it here
    _leaveController.searchLeave();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    _leaveController.dispose();
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
          'Leave Balance',
          style: TextStyle(color: Colors.white),
        ),
      ]),
    ),
    Tab(
      child: Column(children: [
        Image.asset(
          'assets/images/leave_icontab.png',
          height: 25,
          // color: Colors.white,
        ),
        SizedBox(height: 5),
        Text(
          'Manager Approval',
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
    return TextStyle(color: Colors.white, fontSize: 20.0);
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text(
            "Cuti Request & Balance Form",
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
          // Center(
          //     child: Text(
          //   'Leave Balance',
          //   style: textStyle(),
          // )),
          LeaveBalanceListView(),
          CutiListViewMyRequest(),
          RequestLeaveListView(),
        ],
      ),
    );
  }
}
