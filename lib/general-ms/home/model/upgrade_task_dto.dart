class UpgradeTaskDto {
  final int id;
  final bool isComplate;
  UpgradeTaskDto({
    required this.id,
    required this.isComplate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'isCompleted': isComplate,
      };
}
