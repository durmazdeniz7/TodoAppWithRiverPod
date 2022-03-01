import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_with_riverpod/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref )  {
var allTodos=ref.watch(todoListProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Expanded(child: Text("${allTodos.length} Todos")),
        Tooltip(message: "All Todos",child: TextButton(onPressed: (){}, child: const Text("All")),),
        Tooltip(message: "Only Uncompleted Todos ",child: TextButton(onPressed: (){}, child: const Text("Active")),),
        Tooltip(message: "Only Completed  Todos",child: TextButton(onPressed: (){}, child: const Text("Completed")),),


      ],
    );
  }
}