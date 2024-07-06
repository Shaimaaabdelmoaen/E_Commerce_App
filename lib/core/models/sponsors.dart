class Sponsor {
  final String image;

  Sponsor({required this.image});

  factory Sponsor.fromJson(Map<String, dynamic> json) {
    return Sponsor(image: json['image']);
  }

  static List<Sponsor> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Sponsor.fromJson(json)).toList();
  }
}
