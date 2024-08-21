class IceCream {
  final String name;
  final String price;
  final String imagePath;
  final String category; // Nouvelle variable pour la catégorie

  IceCream({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category, // Assurez-vous d'ajouter cette variable au constructeur
  });

  static IceCream fromJson(Map<String, dynamic> json) {
    return IceCream(
      name: json['name'],
      price: json['price'],
      imagePath: json['imagePath'],
      category: json['category'], // Extraire la catégorie du JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'category': category, // Ajouter la catégorie au JSON
    };
  }
}
