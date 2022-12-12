import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:todoeyyy/controller/add_update_delete_provider.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskData>(context, listen: false);
    final list = provider.tasks;

    return Consumer<TaskData>(
      builder: (context, value, child) {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = list[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                provider.deleteTask(data);
              },
              child: ListTile(
                title: Text(
                  "TASK : ${data.task}",
                  style: TextStyle(
                      fontSize: 5.w,
                      fontWeight: FontWeight.w700,
                      decoration:
                          data.isDone ? TextDecoration.lineThrough : null),
                ),
                trailing: Checkbox(
                  value: data.isDone,
                  onChanged: (value) {
                    provider.updateTask(data);
                  },
                ),
                subtitle: Text(
                  "DEADLINE : ${data.date}",
                  style: TextStyle(fontSize: 4.w, fontWeight: FontWeight.w400),
                ),
              ),
            );
          },
          itemCount: list.length,
          separatorBuilder: (context, index) => SizedBox(height: 2.w),
        );
      },
    );
  }
}

//     .where((element) =>
// element.date == DateFormat('dd-MM-yyyy').format(DateTime.now()))
// .toList()
