import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_btn.dart';
import 'package:taskati/feature/add_task/add_task_view.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: getTitleTextStyle(context, fontWeight: FontWeight.w600),
            ),
            const Gap(5),
            Text('Today',
                style: getBodyTextStyle(context, fontWeight: FontWeight.w700)),
          ],
        ),
        const Spacer(),
        CustomButton(
            height: 45,
            width: 137,
            text: '+ Add Task',
            onPressed: () {
              pushTo(context, const AddTaskView());
            })
      ],
    );
  }
}
