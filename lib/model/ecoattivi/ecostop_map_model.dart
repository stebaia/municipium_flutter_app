class EcostopMapModel {
  bool? isListSection;

  EcostopMapModel({this.isListSection});

  EcostopMapModel copyWith({bool? isListSection}) {
    return EcostopMapModel(
      isListSection: isListSection ?? this.isListSection,
    );
  }
}
