import 'package:flutter/material.dart';

import 'models/food_model.dart';
import 'view/home_screen.dart';
import 'view/cart_screen.dart';
import 'view/orders_screen.dart';
import 'view/profile_screen.dart';

void main() {
  runApp(const FoodXpressApp());
}

/// Root widget of the FoodXpress App
/// Using StatefulWidget to manage app-level state like selected tab & cart items
class FoodXpressApp extends StatefulWidget {
  const FoodXpressApp({super.key});

  @override
  State<FoodXpressApp> createState() => _FoodXpressAppState();
}

class _FoodXpressAppState extends State<FoodXpressApp> {
  //  Current selected index for bottom navigation bar
  int _selectedIndex = 0;

  //  List to store all added cart items
  List<FoodItem> cartItems = [];

  ///  Add food item to the cart
  void addToCart(FoodItem item) {
    setState(() {
      cartItems.add(item);
    });
  }

  ///  Remove food item from the cart
  void removeFromCart(FoodItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  ///  Logout callback to reset selected tab
  void logout() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of all main app screens
    final screens = [
      HomeScreen(onAddToCart: addToCart),
      CartScreen(cartItems: cartItems, onRemove: removeFromCart),
      const OrdersScreen(),
      ProfileScreen(onLogout: logout),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodXpress',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange, // App color theme
      ),

      // Main scaffold containing screen & bottom navigation
      home: Scaffold(
        body: screens[_selectedIndex],

        // Custom Bottom Navigation Bar with rounded corners
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),

            // Bottom navigation items
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              showUnselectedLabels: true,

              // Handle tab change
              onTap: (index) {
                setState(() => _selectedIndex = index);
              },

              // Navigation Items
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long_rounded),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
