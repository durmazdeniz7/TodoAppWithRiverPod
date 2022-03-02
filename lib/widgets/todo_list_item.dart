import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app_with_riverpod/models/todo_model.dart';
import 'package:todo_app_with_riverpod/providers/all_providers.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {

  const TodoListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoListItemWidgetState();
}

class _TodoListItemWidgetState extends ConsumerState<TodoListItemWidget> {
  late FocusNode _textFocusNode;
  late TextEditingController _textController;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textFocusNode = FocusNode();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

final currentTodoItem=ref.watch(currentTodoProvider);

    return Focus(
      onFocusChange: (value) {
        if (!value) {
          setState(() {
            hasFocus = false;
          });
          ref.read(todoListProvider.notifier).edit(
              id: currentTodoItem.id, newDescription: _textController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            hasFocus = true;
            _textFocusNode.requestFocus();

            _textController.text =currentTodoItem.description;
          });
        },
        leading: Checkbox(
          value:currentTodoItem.completed,
          onChanged: (value) {
            ref.read(todoListProvider.notifier).toggle(currentTodoItem.id);
          },
        ),
        title: hasFocus
            ? TextField(
                controller: _textController,
                focusNode: _textFocusNode,
              )
            : Text(currentTodoItem.description),
      ),
    );
  }
}
