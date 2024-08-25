class AddStudyDto {
  final String minutesStudied;
  final String studyDate;

  AddStudyDto({required this.minutesStudied, required this.studyDate});

  Map<String, dynamic> toJson() {
    return {
      'minutesStudied': minutesStudied,
      'studyDate': studyDate,
    };
  }
}
