import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/text_styles.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 8, left: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: task.colorIndex == 0
            ? AppColors.primaryColor
            : (task.colorIndex == 1
                ? AppColors.orangeColor
                : task.colorIndex == 2
                    ? AppColors.redColor
                    : Colors.green),
      ),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title ?? '',
                style: getBodyTextStyle(context, color: AppColors.whiteColor),
              ),
              const Gap(10),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.whiteColor,
                    size: 18,
                  ),
                  const Gap(5),
                  Text(
                    '${task.startTime} : ${task.endTime}',
                    style: getSmallTextStyle(color: AppColors.whiteColor),
                  ),
                ],
              ),
              const Gap(10),
              Text(
                task.description ?? '',
                style: getBodyTextStyle(context, color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
        Container(width: .5, height: 65, color: AppColors.whiteColor),
        const Gap(10),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            (task.isCompleted ?? false) ? 'COMPLETED' : 'TODO',
            style: getSmallTextStyle(
                color: AppColors.whiteColor, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
