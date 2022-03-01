import 'package:flutter/material.dart';

import 'package:todo_app_with_riverpod/models/todo_model.dart';

class TodoListItemWidget extends StatelessWidget {
final  TodoModel todoModel;
  const TodoListItemWidget({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: todoModel.completed,onChanged: (value){

todoModel.completed=value!;
      },),
      title:  Text(todoModel.description),
    );
  }
}
