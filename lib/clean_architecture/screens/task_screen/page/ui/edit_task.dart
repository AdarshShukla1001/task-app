import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class EditTaskPage extends StatefulWidget {
  DataSnapshot data;
  EditTaskPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  // TextEditingController _userController = TextEditingController();
  String datetime = DateTime.now().toString();
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: '${widget.data.child('name').value.toString()}');
    _descriptionController = TextEditingController(text: '${widget.data.child('description').value.toString()}');
  }

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
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              // initialValue: '${widget.data.child('name').value.toString()}',
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Task Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              // initialValue: '${widget.data.child('description').value.toString()}',
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),

            SizedBox(height: 16.0),

          
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {

              },
              child: Text('Edit Task'),
            ),
          ],
        ),
      ),
    );
  }
}