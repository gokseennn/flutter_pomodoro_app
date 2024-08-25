class DayStatistics {
  int id;
  int minutesStudied;
  DateTime studyDate;

  DayStatistics(
      {required this.id,
      required this.minutesStudied,
      required this.studyDate});

  factory DayStatistics.fromJson(Map<String, dynamic> json) {
    return DayStatistics(
      id: json['id'],
      minutesStudied: json['minutesStudied'],
      studyDate: DateTime.parse(json['studyDate']),
    );
  }
}
