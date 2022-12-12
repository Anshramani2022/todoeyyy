import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyyy/view/home_screen.dart';
import 'package:sizer/sizer.dart';

import 'controller/add_update_delete_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        child: Sizer(
          builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          },
        ),
        create: (context) => TaskData());
  }
}
