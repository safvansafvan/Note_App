class NoteData {
  String? content;
  String? subject;

  NoteData({
    this.content,
    this.subject,
  });

  factory NoteData.fromJson(Map<String, dynamic> json) => NoteData(
        content: json["content"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "subject": subject,
      };
}
