import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? date;

  @HiveField(4)
  String? startTime;

  @HiveField(5)
  String? endTime;

  @HiveField(6)
  int? colorIndex;

  @HiveField(7)
  bool? isCompleted;

  TaskModel(
      {this.id,
      this.title,
      this.description,
      this.date,
      this.startTime,
      this.endTime,
      this.colorIndex,
      this.isCompleted});
}
