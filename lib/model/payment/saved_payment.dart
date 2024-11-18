class SavedPayment {
  int? currentPage;
  bool? isSelectedFisicPerson;
  bool? isSelectedGiuridicPerson;
  bool? strangerPerson;

  SavedPayment(
      {int? currentPage,
      bool? isSelectedFisicPerson,
      bool? isSelectedGiuridicPerson,
      bool? strangerPerson})
      : currentPage = currentPage ?? 0,
        isSelectedFisicPerson = isSelectedFisicPerson ?? false,
        isSelectedGiuridicPerson = isSelectedGiuridicPerson ?? false,
        strangerPerson = strangerPerson ?? false;

  SavedPayment copyWith(
      {int? currentPage,
      bool? isSelectedFisicPerson,
      bool? isSelectedGiuridicPerson,
      bool? strangerPerson}) {
    return SavedPayment(
        currentPage: currentPage ?? this.currentPage,
        isSelectedFisicPerson:
            isSelectedFisicPerson ?? this.isSelectedFisicPerson,
        isSelectedGiuridicPerson:
            isSelectedGiuridicPerson ?? this.isSelectedGiuridicPerson,
        strangerPerson: strangerPerson ?? this.strangerPerson);
  }
}
