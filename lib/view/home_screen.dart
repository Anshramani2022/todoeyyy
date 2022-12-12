import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/common_widget/create_task_method.dart';
import '../common/common_widget/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1.5.w),
              margin: EdgeInsets.only(right: 5.w, top: 1.w),
              decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Date : ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 4.w,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Time : ${DateTime.now().hour.toString()} : ${DateTime.now().minute} ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 4.w,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
          title: Text(
            'Todoey',
            style: GoogleFonts.alice(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 10.w),
          ),
          centerTitle: false,
        ),
        drawer: const Drawer(
          backgroundColor: Colors.lightBlueAccent,
          child: AboutListTile(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5.w),
                CreateTask(),
                SizedBox(height: 5.w),
                TaskList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
