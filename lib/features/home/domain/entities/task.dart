import 'package:equatable/equatable.dart';


// .why>??
class TaskEntity  extends Equatable{
  final int? id;
  final String? name;
  final String? description;
  final bool? done;
  final DateTime? deadLine;
  final DateTime? completedIn;

  TaskEntity({this.id, 
  this.name, this.description, this.done,this.deadLine,this.completedIn
  });
   
     @override
     // TODO: implement props
     List<Object?> get props {
      return [
        id,
        name,
        description,
        done,
        deadLine,
        completedIn,
      ];
      
     }
}