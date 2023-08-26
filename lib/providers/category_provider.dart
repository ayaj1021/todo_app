import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/utils/utils.dart';

final categoryProvider = StateProvider<TaskCategories>((ref) {
  return TaskCategories.others;
});
