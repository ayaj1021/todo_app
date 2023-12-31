import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;
  TaskNotifier(this._repository) : super(const TaskState.initial());

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(updatedTask);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getTasks(Task task) async {
    try {
   final tasks =   await _repository.getAllTasks(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<void> getTasks() async {
  //   try {
  //     final tasks = await _repository.getAllTasks();
  //     state = state.copyWith(tasks: tasks);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}
