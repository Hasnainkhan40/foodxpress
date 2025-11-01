import 'package:flutter/material.dart';
import '../models/food_model.dart';

/// FoodCard Widget
/// Displays a single food item with image, name, price, and an "Add" button.
class FoodCard extends StatelessWidget {
  final FoodItem food;
  final VoidCallback onAdd;

  const FoodCard({super.key, required this.food, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        //  Food Image
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            food.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        //  Food Name
        title: Text(
          food.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        //  Food Price
        subtitle: Text("₹${food.price.toStringAsFixed(2)}"),

        //  Add Button (Circular + Animated)
        trailing: ElevatedButton(
          onPressed: () {
            onAdd();
          },

          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.deepOrangeAccent,
            padding: const EdgeInsets.all(10),
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
