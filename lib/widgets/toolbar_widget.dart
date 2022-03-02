import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  ToolBarWidget({Key? key}) : super(key: key);

  var _currentFilter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filt) {
    return _currentFilter == filt ? Colors.orange : Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCompletedTodoCount = ref.watch(unCompletedTodoCount);

    _currentFilter = ref.watch(todoListFiler);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          onCompletedTodoCount == 0
              ? "Tüm Görevler Tamamlanmış"
              : "$onCompletedTodoCount Görev Tamamlanmadı",
          overflow: TextOverflow.ellipsis,
        )),
        Tooltip(
          message: "All Todos",
          child: TextButton(
            onPressed: () {
              ref.read(todoListFiler.notifier).state = TodoListFilter.all;
            },
            child: const Text("All"),
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.all)),
          ),
        ),
        Tooltip(
          message: "Only Uncompleted Todos ",
          child: TextButton(
            onPressed: () {
              ref.read(todoListFiler.notifier).state = TodoListFilter.active;
            },
            child: const Text("Active"),
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.active)),
          ),
        ),
        Tooltip(
          message: "Only Completed  Todos",
          child: TextButton(
            onPressed: () {
              ref.read(todoListFiler.notifier).state = TodoListFilter.completed;
            },
            child: const Text("Completed"),
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.completed)),
          ),
        ),
      ],
    );
  }
}
