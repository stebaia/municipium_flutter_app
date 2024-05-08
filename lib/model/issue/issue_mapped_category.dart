class IssueMappedCategory {
  final int id;
  final String name;
  final String description;
  final bool mandatoryMessage;
  final bool isSelectable;

  IssueMappedCategory(
      {required this.id,
      required this.name,
      required this.description,
      required this.mandatoryMessage,
      required this.isSelectable});
}
