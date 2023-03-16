class Todo {
  int? id;
  String? title;
  String? details;
  bool status;

  Todo({this.id, this.title, this.details, required this.status});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'details': details,
      'status': status
    };
    return map;
  }
}
// toMap == convert to json