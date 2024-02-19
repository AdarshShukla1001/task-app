// import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
// import 'package:your_package_name_here/task_entity.dart'; // Import your TaskEntity class

class TaskListPage extends StatefulWidget {
  TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  late DatabaseReference query;
  @override
  void initState() {
    super.initState();
    query = FirebaseDatabase.instance.ref("TaskData");
  }

  // List of tasks to display
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut().then((value) {
                    // naviToLogin(context);
                  }).onError((error, stackTrace) {
                    // Utils().errortoastMessage(error.toString());
                  });
                },
                child: Text('Sign Out')),
          ),
        ],
      ),
      body: FirebaseAnimatedList(
          query: query,
          //   title: Text('${snapshot.child('name').value.toString()}' ?? 'Not Avaliable'),
          //   subtitle: Text('${snapshot.child('description').value.toString()}' ?? 'Not Avaliable'),
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            // snapshot.key
            bool _isdone = false;
            if (snapshot.child('done').value.toString() == 'true') {
              _isdone = true;
            }
            return ListTile(
              isThreeLine: true,
              trailing: IconButton(
                  onPressed: () {
                    deleteTask(context, snapshot);
                  },
                  icon: Icon(Icons.delete)),
              title: Text('${snapshot.child('name').value.toString()}' ?? 'No Name'),
              subtitle: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => EditTaskPage(data: snapshot,)));
                  },
                  child: Text('${snapshot.child('description').value.toString()}' ?? 'No Description')),
              leading: Checkbox(
                value: _isdone,
                onChanged: (n) {
                  isDoneChange(context, snapshot);
                  // You can implement logic to update task completion here
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // naviToAddTask(context);
          // You can implement logic to add a new task here
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void deleteTask(BuildContext context, DataSnapshot data) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you Want to Delete Task'),
          content: Text('${data.child('name').value.toString()}' ?? 'No Name'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                try {
                  await query.child('${data.key}').remove();
                } catch (e) {
                  // Utils().errortoastMessage(e.toString());
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void isDoneChange(BuildContext context, DataSnapshot data) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Have you finished your Task'),
          content: Text('${data.child('name').value.toString()}' ?? 'No Name'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                try {
                  DatabaseReference ref = query.child('${data.key}/done');
                  await ref.set(true);
                } catch (e) {
                  // Utils().errortoastMessage(e.toString());
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}