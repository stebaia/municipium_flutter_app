class GarbageCollection {
  String instructions;
  String phoneNumber;
  int id;
  String faxNumber;
  String email;

  GarbageCollection({
    required this.instructions,
    required this.phoneNumber,
    required this.id,
    required this.faxNumber,
    required this.email,
  });

  GarbageCollection.fromJson(Map<String, dynamic> json)
      : instructions = json['instructions'] ?? '',
        phoneNumber = json['phone_number'] ?? '',
        id = json['id'] ?? 0,
        faxNumber = json['fax_number'] ?? '',
        email = json['email'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instructions'] = instructions;
    data['phone_number'] = phoneNumber;
    data['id'] = id;
    data['fax_number'] = faxNumber;
    data['email'] = email;
    return data;
  }
}