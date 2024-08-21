import 'package:futur_ice_cream_v1/models/ice_cream.dart';

/*
 Class of service to manage the list of favored ice creams
*/
class FavoriteIceCreamsService {
  static final List<IceCream> _favorites = [];

  /// Adds an ice cream to the list of favorites.
  ///
  /// This function checks if the given ice cream is already in the list of favorites.
  /// If it is not, the ice cream is added to the list.
  ///
  /// @param iceCream The ice cream to be added to the list of favorites.
  static void addFavorite(IceCream iceCream) {
    // Check if the given ice cream is already in the list of favorites.
    if (!_favorites.contains(iceCream)) {
      // If the ice cream is not in the list, add it to the list of favorites.
      _favorites.add(iceCream);
    }
  }

  static void removeFavorite(IceCream iceCream) {
    _favorites.remove(iceCream);
  }

  static List<IceCream> getFavorites() {
    return _favorites;
  }
}
