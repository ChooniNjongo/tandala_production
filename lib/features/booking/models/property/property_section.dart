class PropertySection {
  final String sectionName;
  final String sectionPhoto;

  PropertySection({
    required this.sectionName,
    required this.sectionPhoto,
  });

  // Method to convert JSON to Room object
  factory PropertySection.fromJson(Map<String, dynamic> json) {
    return PropertySection(
      sectionName: json['sectionName'],
      sectionPhoto: json['sectionPhoto'],
    );
  }

  // Method to convert Room object to JSON
  Map<String, dynamic> toJson() {
    return {
      'sectionName': sectionName,
      'sectionPhoto': sectionPhoto,
    };
  }
}
