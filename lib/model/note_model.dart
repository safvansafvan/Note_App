class NoteData {
  String? content;
  String? subject;
  String? date;
  String? updatedDate;
  NoteData({this.content, this.subject, this.date, this.updatedDate});

  factory NoteData.fromJson(Map<String, dynamic> json) => NoteData(
        content: json["content"],
        subject: json["subject"],
        date: json["date"],
        updatedDate: json["updatedDate"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "subject": subject,
        "date": date,
        "updatedDate": updatedDate,
      };
}
