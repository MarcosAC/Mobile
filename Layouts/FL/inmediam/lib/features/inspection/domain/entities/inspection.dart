class InspectionItem {
  final String id;
  final String name;
  final String category;
  bool isChecked;
  final List<String> attachments;
  String? notes;

  InspectionItem({
    required this.id,
    required this.name,
    required this.category,
    this.isChecked = false,
    this.attachments = const [],
    this.notes,
  });

  InspectionItem copyWith({
    bool? isChecked,
    List<String>? attachments,
    String? notes,
  }) {
    return InspectionItem(
      id: id,
      name: name,
      category: category,
      isChecked: isChecked ?? this.isChecked,
      attachments: attachments ?? this.attachments,
      notes: notes ?? this.notes,
    );
  }
}

class Property {
  final String title;
  final String address;
  final String rooms;
  final String status;
  final String imageUrl;

  Property({
    required this.title,
    required this.address,
    required this.rooms,
    required this.status,
    required this.imageUrl,
  });
}
