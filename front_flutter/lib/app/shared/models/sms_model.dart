class MessageModel {
  String from;
  String body;
  String to;

  MessageModel({this.from, this.body, this.to});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['body'] = this.body;
    data['to'] = this.to;
    return data;
  }
}
