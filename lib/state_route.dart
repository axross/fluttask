import 'package:flutter/material.dart';
import 'package:fluttask/task_list.dart';

class StateRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateRouteState();
}

class _StateRouteState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('with StatefulWidget'),
        ),
        body: TaskList(onChangeTasks: (tasks) => print('changed')),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('All'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Unfinished'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Finished'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          onTap: (tappedIndex) => print(tappedIndex),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_comment),
          onPressed: () => print('yeah'),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}
