import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  // TextEditingController _userController = TextEditingController();
  String datetime = DateTime.now().toString();
  bool _isDone=false;
  // TextEditingController _deadlineController = TextEditingController();
  // TextEditingController _completionDateController = TextEditingController();

  // bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    bool _isLogin = false;
    final user = _auth.currentUser;

    if (user != null) {
      _isLogin = true;
    } else {
      _isLogin = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Task Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('Done'),
              value: _isDone,
              onChanged: (value) {
                setState(() {
                  _isDone = value ?? false;
                });
              },
            ),
            // SizedBox(height: 16.0),
            // TextField(
            //   controller: _deadlineController,
            //   decoration: InputDecoration(
            //     labelText: 'Deadline',
            //   ),
            // ),
            // SizedBox(height: 16.0),
            // TextField(
            //   controller: _completionDateController,
            //   decoration: InputDecoration(
            //     labelText: 'Completion Date',
            //   ),
            // ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Save task logic goes here
                String name = _nameController.text;
                String description = _descriptionController.text;
                String user_ = user!.uid;
                

                final myMap = <String, String>{
                  // "user": "${user_}",
                  "name": "${name}",
                  "description": '${description}',
                  "done": '0',
                  // 'saved':'${datetime}',
                  'completed':'',
                  't':"",


                };
                // if (user == null) {
                  DatabaseReference db = FirebaseDatabase.instance.ref('TaskData');
                  db.push().set(myMap);
                // }
                // String deadline = _deadlineController.text;
                // String completionDate = _completionDateController.text;

                // You can process the data further, like adding to a list, database, etc.
                // For simplicity, you can print them here.
                print('Name: $name');
                print('Description: $description');
                print('User: $user');
                // print('Done: $done');
                // print('Deadline: $deadline');
                // print('Completion Date: $completionDate');

                // Once done, you might want to navigate back to the previous page or clear fields.
                // Navigator.pop(context);
                // _nameController.clear();
                // _descriptionController.clear();
                // _userController.clear();
                // _deadlineController.clear();
                // _completionDateController.clear();
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
