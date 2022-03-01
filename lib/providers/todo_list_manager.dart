import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod/models/todo_model.dart';
import 'package:uuid/uuid.dart';



class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager([List<TodoModel>? state]) : super(state ?? []);

  void addTodo(String description) {
    state = [
      ...state,
      TodoModel(id: const Uuid().v4(), description: description)
    ];
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: id, description: todo.description, completed: !todo.completed)
        else
          todo,
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: id, description: newDescription, completed: todo.completed)
        else
          todo,
    ];
  }

  void remove(TodoModel todoModel) {
    state = state.where((element) => element.id != todoModel.id).toList();
  }
}
