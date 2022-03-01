import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod/models/todo_model.dart';
import 'package:todo_app_with_riverpod/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([
    TodoModel(id: const Uuid().v4(), description: "Spora Git"),
    TodoModel(id: const Uuid().v4(), description: "Ders Çalış"),
    TodoModel(id: const Uuid().v4(), description: "Alışveriş"),
    TodoModel(id: const Uuid().v4(), description: "Tv İzle"),

  ]);
});