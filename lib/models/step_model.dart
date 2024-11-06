class StepModel {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isHighlighted;

  StepModel({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.isHighlighted = false,
  });
}
