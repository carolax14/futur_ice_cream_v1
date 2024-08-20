import 'package:futur_ice_cream_v1/models/ice_cream.dart';

/*
 Class of service to manage the list of favored ice creams
*/
class FavoriteIceCreamsService {
  static final List<IceCream> _favorites = [];

  static void addFavorite(IceCream iceCream) {
    if (!_favorites.contains(iceCream)) {
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
