//  Model class representing a single food item
class FoodItem {
  //  Name of the food item (e.g., "Cheese Pizza")
  final String name;

  //  Path to the image asset for displaying the food item
  final String image;

  //  Price of the food item in rupees
  final double price;

  FoodItem({required this.name, required this.image, required this.price});
}
