class ToDoModel {
  String? title;
  String? date;
  String? time;
  String? des;

  ToDoModel({
    this.title,
    this.date,
    this.time,
    this.des,
  });

  ToDoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    time = json['time'];
    des = json['des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['date'] = date;
    data['time'] = time;
    data['des'] = des;
    return data;
  }
}
