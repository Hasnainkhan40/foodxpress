import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// A stateless widget that shows a list of previous food orders
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of orders (can later come from API or database)
    final orders = [
      {"name": "Cheese Pizza", "price": 199, "date": "2025-10-01"},
      {"name": "Veg Burger", "price": 99, "date": "2025-10-15"},
      {"name": "Chicken Biryani", "price": 249, "date": "2025-10-22"},
      {"name": "Cold Drink", "price": 49, "date": "2025-10-29"},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      // AppBar section at the top
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "My Orders",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      // Main body section that displays the list of orders
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          // parse and format date safely
          final parsedDate = DateTime.tryParse(order["date"].toString());
          final dateText = parsedDate != null
              ? DateFormat('dd MMM yyyy').format(parsedDate)
              : order["date"].toString();
          // Each order item will be displayed inside a rounded white container (card)
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            // ListTile is a ready-made layout with leading, title, subtitle & trailing
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.fastfood_rounded,
                  color: Colors.deepOrange,
                  size: 28,
                ),
              ),
              title: Text(
                order["name"].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "Ordered on $dateText",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "₹${order["price"]}",
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Delivered",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
