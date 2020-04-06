class EmailModel {
  String to;
  String from;
  String subject;
  String text;
  String html;

  EmailModel({this.to, this.from, this.subject, this.text, this.html});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to'] = this.to;
    data['from'] = this.from;
    data['subject'] = this.subject;
    data['text'] = this.text;
    data['html'] = this.html;
    return data;
  }
}
