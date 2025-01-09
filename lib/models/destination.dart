
class Destination {
  final int id;
  final String name;
  final String country;
  final String description;
  final String image;

  Destination({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.image,
  });

  factory Destination.fromJson(Map json) {
    return Destination(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      description: json['description'],
      image: json['image'],
    );
  }}
