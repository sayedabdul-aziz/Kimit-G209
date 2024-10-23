import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_btn.dart';
import 'package:taskati/feature/home/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  int selectedColor = 0;
  String date = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat("hh:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Add Task',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: getBodyTextStyle(context),
                ),
                const Gap(8),
                TextFormField(
                  style: getBodyTextStyle(context),
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title here',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(16),
                Text(
                  'Description',
                  style: getBodyTextStyle(
                    context,
                  ),
                ),
                const Gap(8),
                TextFormField(
                  style: getBodyTextStyle(
                    context,
                  ),
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Enter description here',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(16),
                Text(
                  'Date',
                  style: getBodyTextStyle(
                    context,
                  ),
                ),
                const Gap(8),
                TextFormField(
                  style: getBodyTextStyle(
                    context,
                  ),
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030))
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          date = DateFormat.yMd().format(value);
                        });
                      }
                    });
                  },
                  decoration: InputDecoration(
                      hintText: date,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.primaryColor,
                      )),
                ),
                const Gap(16),
                Row(children: [
                  Expanded(
                    child: Text(
                      'Start Time',
                      style: getBodyTextStyle(
                        context,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Text(
                      'End Time',
                      style: getBodyTextStyle(
                        context,
                      ),
                    ),
                  )
                ]),
                const Gap(8),
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      style: getBodyTextStyle(
                        context,
                      ),
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              startTime = value.format(context);
                            });
                          }
                        });
                      },
                      decoration: InputDecoration(
                          hintText: startTime,
                          suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primaryColor,
                          )),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      style: getBodyTextStyle(
                        context,
                      ),
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              endTime = value.format(context);
                            });
                          }
                        });
                      },
                      decoration: InputDecoration(
                          hintText: endTime,
                          suffixIcon: Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primaryColor,
                          )),
                    ),
                  ),
                ]),
                const Gap(20),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedColor = 0;
                        });
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.primaryColor,
                        child: (selectedColor == 0)
                            ? Icon(Icons.check, color: AppColors.whiteColor)
                            : null,
                      ),
                    ),
                    const Gap(5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedColor = 1;
                        });
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.orangeColor,
                        child: (selectedColor == 1)
                            ? Icon(Icons.check, color: AppColors.whiteColor)
                            : null,
                      ),
                    ),
                    const Gap(5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedColor = 2;
                        });
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.redColor,
                        child: (selectedColor == 2)
                            ? Icon(Icons.check, color: AppColors.whiteColor)
                            : null,
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      height: 45,
                      width: 145,
                      text: 'Create Task',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String id = DateTime.now().toIso8601String();
                          AppLocalStorage.cacheTaskData(
                              id,
                              TaskModel(
                                id: id,
                                title: titleController.text,
                                description: descriptionController.text,
                                date: date,
                                startTime: startTime,
                                endTime: endTime,
                                colorIndex: selectedColor,
                                isCompleted: false,
                              ));

                          pushWithReplacement(context, const HomeView());
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
