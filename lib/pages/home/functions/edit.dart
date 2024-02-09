import 'package:fireapp/pages/login/utils.dart/utils.dart';
import 'package:fireapp/pages/utils/route_func.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void EditTask(BuildContext context, DataSnapshot data, String name, String description, bool _isDone, String datetime, String user) async {
  final myMap = <String, dynamic>{
    // "user": "${user_}",
    "name": "${name}",
    "description": '${description}',
    "done": _isDone,
    'saved': datetime,
    'user_id': '${user}'
  };
  // if (user == null) {
  try {
    DatabaseReference db = FirebaseDatabase.instance.ref('TaskData').child('${data.key}');
    await db.set(myMap);
    naviToHome(context);
  } catch (e) {
    Utils().errortoastMessage('${e}');
  }
}
