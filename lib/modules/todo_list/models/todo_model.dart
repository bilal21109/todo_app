class TodoModel {
  final String name;
  final String? id;
  final String description;
  final DateTime date;
  final DateTime time;
  final TodoProgressStatus status;

  TodoModel(
      {this.id,
      required this.name,
      required this.description,
      required this.date,
      required this.time,
      this.status = TodoProgressStatus.pending});

  TodoModel copyWith(
      {String? id,
      String? name,
      String? description,
      DateTime? date,
      DateTime? time,
      TodoProgressStatus? status}) {
    return TodoModel(
        name: name ?? this.name,
        id: id ?? this.id,
        description: description ?? this.description,
        date: date ?? this.date,
        time: time ?? this.time,
        status: status ?? this.status);
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        date: DateTime.parse(map['date']),
        time: DateTime.parse(map['time']),
        status: _getStatus(map['status']));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "date": date.toIso8601String(),
      "time": time.toIso8601String(),
      "status": status.name,
    };
  }

  static TodoProgressStatus _getStatus(String status) {
    TodoProgressStatus todoProgressStatus = TodoProgressStatus.pending;
    switch (status) {
      case 'pending':
        todoProgressStatus = TodoProgressStatus.pending;
        break;
      case 'inProgress':
        todoProgressStatus = TodoProgressStatus.inProgress;
        break;
      case 'complete':
        todoProgressStatus = TodoProgressStatus.complete;
        break;
    }
    return todoProgressStatus;
  }
}

enum TodoProgressStatus { pending, inProgress, complete }
