import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/modules/todo_list/models/todo_model.dart';

class TodoRepository {
  final FirebaseFirestore firebaseFirestore;
  // List<TodoModel> todos = [];

  TodoRepository({required this.firebaseFirestore});

  void addTodo(TodoModel model) async {
    CollectionReference collectionReference =
        firebaseFirestore.collection('todos');
    String docId = collectionReference.doc().id;
    TodoModel newModel = model.copyWith(id: docId);
    collectionReference.doc(docId).set(newModel.toJson());
  }

  Future<void> updateTodo(String id, TodoProgressStatus status) async {
    CollectionReference collectionReference =
        firebaseFirestore.collection('todos');
    await collectionReference.doc(id).update({'status': status.name});
  }

  Future<void> deleteTodo(String id) async {
    CollectionReference collectionReference =
        firebaseFirestore.collection('todos');
    await collectionReference.doc(id).delete();
  }

  Future<List<TodoModel>> getAllTodos({String? status,required DateTime selectedDate}) async {
print(status);
print(selectedDate.toIso8601String());
    QuerySnapshot<Map<String, dynamic>> todoSnapshot = await firebaseFirestore
        .collection('todos')
        .where('status', isEqualTo: status)

        .where('date',isEqualTo: selectedDate.toIso8601String())
        .get();
    return todoSnapshot.docs.map((e) => TodoModel.fromMap(e.data())).toList();
  }
}
