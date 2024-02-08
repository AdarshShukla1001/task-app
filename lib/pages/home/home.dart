import 'package:fireapp/features/home/domain/entities/task.dart';
import 'package:fireapp/pages/login/utils.dart/utils.dart';
import 'package:fireapp/pages/utils/route_func.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:your_package_name_here/task_entity.dart'; // Import your TaskEntity class

class TaskListPage extends StatelessWidget {
  List<TaskEntity> sampleTasks = [
    TaskEntity(
      id: 1,
      name: 'Complete Flutter tutorial',
      description: 'Follow a Flutter tutorial and build a sample app',
      done: false,
      deadLine: DateTime(2024, 2, 28), // Set deadline as 28th February 2024
      completedIn: null,
    ),
    TaskEntity(
      id: 2,
      name: 'Prepare for interview',
      description: 'Review data structures and algorithms',
      done: true,
      deadLine: DateTime(2024, 3, 15), // Set deadline as 15th March 2024
      completedIn: DateTime(2024, 2, 15), // Set completion date as 15th February 2024
    ),
    TaskEntity(
      id: 3,
      name: 'Exercise',
      description: 'Go for a run or visit the gym',
      done: false,
      deadLine: DateTime(2024, 2, 10), // Set deadline as 10th February 2024
      completedIn: null,
    ),
  ];

  TaskListPage({super.key});

  // List of tasks to display

  // TaskListPage({required this.tasks});

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
                    naviToLogin(context);
                  }).onError((error, stackTrace) {
                    Utils().errortoastMessage(error.toString());
                  });
                },
                child: Text('Sign Out')),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sampleTasks.length,
        itemBuilder: (context, index) {
          final task = sampleTasks[index];
          return ListTile(
            title: Text(task.name ?? 'No Name'),
            subtitle: Text(task.description ?? 'No Description'),
            trailing: Checkbox(
              value: task.done ?? false,
              onChanged: (newValue) {
                // You can implement logic to update task completion here
              },
            ),
            onTap: () {
              // You can implement navigation to a task detail page here
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          naviToAddTask(context);
          // You can implement logic to add a new task here
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
