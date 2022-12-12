import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todoeyyy/controller/add_update_delete_provider.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final formKey = GlobalKey<FormState>();

  TextEditingController? taskController = TextEditingController();

  TextEditingController? deadLineController = TextEditingController();

  String? taskDetails;

  String? taskDeadline;
  String? date;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskData>(context, listen: false);
    return Form(
      key: formKey,
      child: GestureDetector(
        ///Whole BottomSheet Design for Creating a New Task
        onTap: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.w),
                    topLeft: Radius.circular(10.w)),
                side: BorderSide.none),
            isScrollControlled: true,
            backgroundColor: Colors.white,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10.w),
                          Text(
                            'Add New Task',
                            style: TextStyle(
                                fontSize: 6.w, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          TextFormField(
                            onChanged: (newTaskText) {
                              taskDetails = newTaskText;
                            },
                            autofocus: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter Task';
                              }
                              return null;
                            },
                            maxLength: 150,
                            textCapitalization: TextCapitalization.words,
                            toolbarOptions: const ToolbarOptions(
                                copy: true,
                                cut: true,
                                paste: true,
                                selectAll: true),
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            textInputAction: TextInputAction.next,
                            showCursor: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.w),
                                  borderSide: BorderSide(
                                      width: 5.w, color: Colors.black)),
                              hintText: 'Write Task',
                              hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 5.w,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                              isDense: true,
                              //hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextFormField(
                            onChanged: (newDeadlineText) {
                              taskDeadline = newDeadlineText;
                            },
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter Deadline';
                              }
                              return null;
                            },
                            textCapitalization: TextCapitalization.words,
                            toolbarOptions: const ToolbarOptions(
                                copy: true,
                                cut: true,
                                paste: true,
                                selectAll: true),
                            showCursor: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.w),
                                  borderSide: BorderSide(
                                      width: 5.w, color: Colors.black)),
                              hintText: 'Deadline',
                              hintStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 5.w,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                              isDense: true,
                              //hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextFormField(
                            onChanged: (str) {
                              date = str;
                            },
                          ),
                          SizedBox(height: 5.w),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                provider.addTask(
                                    newTask: taskDetails,
                                    newDeadline: taskDeadline,
                                    date: date);

                                Navigator.pop(context);
                                formKey.currentState!.reset();
                              }
                            },
                            child: const Text('Add'),
                          ),
                          SizedBox(height: 5.w),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },

        ///Add New Task Button Design
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: DottedBorder(
            borderType: BorderType.RRect,
            strokeWidth: 0.4.w,
            dashPattern: [2.w, 0.5.w, 1.w, 0.5.w],
            radius: Radius.circular(4.w),
            // padding: EdgeInsets.all(2.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: Container(
                height: 25.w,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.brown.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.cyanAccent,
                      child: Icon(
                        Icons.add,
                        size: 7.w,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 2.5.w,
                    ),
                    Text(
                      'Add New Task',
                      style: TextStyle(fontSize: 5.w),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
