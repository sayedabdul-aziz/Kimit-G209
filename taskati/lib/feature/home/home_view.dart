import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/task_item.dart';
import 'package:taskati/feature/home/widgets/today_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedDate = DateFormat.yMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            children: [
              const HomeHeaderWidget(),
              const Gap(15),
              const TodayHeaderWidget(),
              const Gap(25),
              DatePicker(
                height: 100,
                width: 80,
                DateTime.now().subtract(const Duration(days: 2)),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                dateTextStyle: getBodyTextStyle(
                  context,
                ),
                dayTextStyle: getBodyTextStyle(
                  context,
                ),
                monthTextStyle: getBodyTextStyle(
                  context,
                ),
                onDateChange: (date) {
                  setState(() {
                    selectedDate = DateFormat.yMd().format(date);
                  });
                },
              ),
              const Gap(25),
              Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable: AppLocalStorage.tasksBox.listenable(),
                  builder: (context, Box<TaskModel> box, child) {
                    List<TaskModel> tasks = [];
                    for (var task in box.values) {
                      if (task.date == selectedDate) {
                        tasks.add(task);
                      }
                    }
                    if (tasks.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/images/empty.json'),
                            const Text('No tasks found'),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        var task = tasks[index];
                        return Dismissible(
                            key: UniqueKey(),
                            background: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green,
                              ),
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  const Icon(Icons.check, color: Colors.white),
                                  const Gap(10),
                                  Text('Complete Task',
                                      style: getBodyTextStyle(context,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                            secondaryBackground: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.redColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.delete, color: Colors.white),
                                  const Gap(10),
                                  Text('Delete Task',
                                      style: getBodyTextStyle(context,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                // delete task
                                box.delete(task.id);
                              } else {
                                // complete task
                                box.put(
                                    task.id,
                                    TaskModel(
                                      id: task.id,
                                      title: task.title,
                                      date: task.date,
                                      isCompleted: true,
                                      colorIndex: 3,
                                      startTime: task.startTime,
                                      endTime: task.endTime,
                                      description: task.description,
                                    ));
                              }
                            },
                            child: TaskItemCard(task: task));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
