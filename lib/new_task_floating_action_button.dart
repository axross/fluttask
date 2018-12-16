import 'package:flutter/material.dart';
import 'package:fluttask/task.dart';

class NewTaskFloatingActionButton extends StatelessWidget {
  final NewTaskAdditionCallback onAddNewTask;

  NewTaskFloatingActionButton({
    Key key,
    @required this.onAddNewTask,
  })  : assert(onAddNewTask != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        child: Icon(Icons.add_comment),
        onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.decelerate,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      constraints: BoxConstraints.tightFor(height: 91),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'New Task',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              )),
                            ),
                            autofocus: true,
                            onFieldSubmitted: (title) {
                              Navigator.of(context).pop();

                              onAddNewTask(Task(
                                  title: title, createdAt: DateTime.now()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
      );
}

typedef void NewTaskAdditionCallback(Task task);
