import 'food_menu.dart';

class CartItem {
  FoodMenu foodMenu;
  int Quantity;

  CartItem({required this.foodMenu, this.Quantity = 1});
}
