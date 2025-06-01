class Task {
  final String id;
  final String title;
  final String? description;
  final String categoryId;
  final bool isCompleted;
  final DateTime? dueDate;
  final DateTime createdAt;
  final String? voiceNotePath;
  final Duration? voiceNoteDuration;

  Task({
    required this.id,
    required this.title,
    this.description,
    required this.categoryId,
    this.isCompleted = false,
    this.dueDate,
    required this.createdAt,
    this.voiceNotePath,
    this.voiceNoteDuration,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'categoryId': categoryId,
        'createdAt': createdAt.toIso8601String(),
        'dueDate': dueDate?.toIso8601String(),
        'isCompleted': isCompleted,
        'voiceNotePath': voiceNotePath,
        'voiceNoteDuration': voiceNoteDuration?.inSeconds,
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        categoryId: json['categoryId'],
        createdAt: DateTime.parse(json['createdAt']),
        dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
        isCompleted: json['isCompleted'] ?? false,
        voiceNotePath: json['voiceNotePath'],
        voiceNoteDuration: json['voiceNoteDuration'] != null
            ? Duration(seconds: json['voiceNoteDuration'])
            : null,
      );
}
