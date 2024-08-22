class IceCream {
  // Properties of the IceCream class
  final String name; // Name of the ice cream
  final String price; // Price of the ice cream
  final String imagePath; // Path to the image of the ice cream
  final String
      category; // Category of the ice cream (e.g., Cornet, Scoop, Candy, etc.)

  // Constructor to initialize the IceCream object
  IceCream({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
  });

  /// Creates an IceCream object from a JSON map.
  ///
  /// This function takes a JSON map as input and returns an instance of the IceCream class.
  /// The JSON map should contain keys corresponding to the properties of the IceCream class.
  ///
  /// @param json The JSON map containing the ice cream data.
  /// @return An IceCream object initialized with data from the JSON map.
  static IceCream fromJson(Map<String, dynamic> json) {
    return IceCream(
      name: json['name'], // Retrieve the name from the JSON map
      price: json['price'], // Retrieve the price from the JSON map
      imagePath: json['imagePath'], // Retrieve the image path from the JSON map
      category: json['category'], // Retrieve the category from the JSON map
    );
  }

  /// Converts the IceCream object to a JSON map.
  ///
  /// This function returns a JSON map representing the IceCream object.
  /// The JSON map will contain keys for the name, price, imagePath, and category properties.
  ///
  /// @return A JSON map containing the ice cream data.
  Map<String, dynamic> toJson() {
    return {
      'name': name, // Include the name in the JSON map
      'price': price, // Include the price in the JSON map
      'imagePath': imagePath, // Include the image path in the JSON map
      'category': category, // Include the category in the JSON map
    };
  }
}
