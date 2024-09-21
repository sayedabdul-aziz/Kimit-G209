import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/widgets/custom_btn.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  int selectedColor = 0;
  String date = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat("hh:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Title'),
              const Gap(8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter title here',
                ),
              ),
              const Gap(16),
              const Text('Description'),
              const Gap(8),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter description here',
                ),
              ),
              const Gap(16),
              const Text('Date'),
              const Gap(8),
              TextFormField(
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
              const Row(children: [
                Expanded(
                  child: Text('Start Time'),
                ),
                Gap(10),
                Expanded(
                  child: Text('End Time'),
                )
              ]),
              const Gap(8),
              Row(children: [
                Expanded(
                  child: TextFormField(
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
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ));
  }
}
