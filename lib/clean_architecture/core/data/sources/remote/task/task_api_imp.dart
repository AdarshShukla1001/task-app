import 'package:fireapp/clean_architecture/screens/task_screen/data/sources/remote/firebase/firebase_task_api.dart';
import 'package:fireapp/clean_architecture/screens/task_screen/domain/entity/task_entity.dart';
import 'package:fireapp/clean_architecture/utils/data_state.dart';
import 'package:firebase_database/firebase_database.dart';

class TaskApiImpl implements TaskApi {
  final DatabaseReference db = FirebaseDatabase.instance.ref('TaskData');
  @override
  Future<DataState<bool>> addTaskApi({required String name, required String descritpion, bool done = false, String? saved, required String user_id})  async{
   final myMap = <String, dynamic>{"name": name, "description": descritpion, "done": done, 'saved': saved, 'user_id': user_id};

    if (name == '' || descritpion == null || descritpion == '') {
      return const DataFailed('Incomplete data');
    }

    try {
      await db.push().set(myMap);
      return const DataSuccess(true);
    } catch (e) {
      return const DataFailed('Something went wrong');
    }
  }
  

  @override
  Future<DataState<bool>> deleteTaskApi({required String id}) async {
    if (id.isEmpty) {
      return const DataFailed('Id can not be empty');
    }
    try {
      await db.child(id).remove();

      return const DataSuccess(true);
    } catch (e) {
      return const DataFailed('Something went wrong');
    }
  }

  @override
  Future<DataState<TaskEntity>> getTask() {
    
    
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<DataState<bool>> editTaskApi({required String id, required name, required descritpion, bool done = false, String? saved, required String user_id}) async {
    final myMap = <String, dynamic>{
      // "user": "${user_}",
      "name": "${name}",
      "description": '${descritpion}',
      "done": done,
      'saved': saved,
      'user_id': '${user_id}'
    };

    try {
      DatabaseReference editTask = db.child('${id}');
      await editTask.set(myMap);
      return const DataSuccess(true);
    } catch (e) {
      return const DataFailed('Something went wrong');
    }
    
  }
  

}









// class TaskApiFirebaseImpl extends TaskApi{

//     final DatabaseReference db = FirebaseDatabase.instance.ref('TaskData');

//   @override
//   Future<DataState<bool>> addTaskApi({required String name, required descritpion, bool done = false, String? saved, required String user_id}) async {
//      final myMap = <String, dynamic>{"name": name, "description": descritpion, "done": done, 'saved': saved, 'user_id': user_id};

//     if (name == '' || descritpion == null || descritpion == '') {
//       return const DataFailed('Incomplete data');
//     }

//     try {
//       await db.push().set(myMap);
//       return const DataSuccess(true);
//     } catch (e) {
//       return const DataFailed('Something went wrong');
//     }
//   }

//   @override
//   Future<DataState<bool>> deleteTaskApi({required String id}) {
//     // TODO: implement deleteTaskApi
//     throw UnimplementedError();
//   }

//   @override
//   Future<DataState<bool>> editTaskApi({required String id, required name, required descritpion, bool done = false, String saved, required String user_id}) {
//     // TODO: implement editTaskApi
//     throw UnimplementedError();
//   }

//   @override
//   Future<DataState<TaskEntity>> getTask() {
//     // TODO: implement getTask
//     throw UnimplementedError();
//   }
  
// }