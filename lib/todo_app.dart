import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod/providers/all_providers.dart';
import 'package:todo_app_with_riverpod/widgets/title_widget.dart';
import 'package:todo_app_with_riverpod/widgets/todo_list_item.dart';
import 'package:todo_app_with_riverpod/widgets/toolbar_widget.dart';

class TodoApp extends ConsumerWidget {
  final TextEditingController newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(filteredTodoList);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration:
                const InputDecoration(labelText: "Neler Yapacaksın Bugün ? "),
            onSubmitted: (newTodo) {
              ref.read(todoListProvider.notifier).addTodo(newTodo);
            },
          ),
           ToolBarWidget(),
          const SizedBox(
            height: 20,
          ),
          allTodos.isEmpty?const Center(child:  Text("Herhangi Bir Görev Yok")): const SizedBox(),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
              onDismissed: ((direction) {
                ref.read(todoListProvider.notifier).remove(allTodos[i]);
              }),
              key: Key(allTodos[i].id),
              child:  ProviderScope(
                overrides: [
                  currentTodoProvider.overrideWithValue(allTodos[i]),
                ],
                child: const TodoListItemWidget(),
              ),
            ),
        ],
      ),
    );
  }
}
