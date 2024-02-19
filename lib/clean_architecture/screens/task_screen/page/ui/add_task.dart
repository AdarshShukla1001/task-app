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
  bool _isDone = false;
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
           
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                // Save task logic goes here
                String name = _nameController.text;
                String description = _descriptionController.text;
                String user_ = user!.uid;
               

                final myMap = <String, dynamic>{
                  // "user": "${user_}",
                  "name": "${name}",
                  "description": '${description}',
                  "done": _isDone,
                  'saved': datetime,
                  'user_id': '${user_}'
                };
                // if (user == null) {
               try{
                DatabaseReference db = FirebaseDatabase.instance.ref('TaskData');
                await db.push().set(myMap);
                // naviToHome(context);
                } catch (e){
                  // Utils().errortoastMessage('${e}');
                }

                print('Description: $description');
                print('User: $user');
              
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}