import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: 'Cheese Burger',
      description: 'Cheese, beef patty, lettuce, tomato, onions, pickles, ketchup, mustard',
      imagePath: 'lib/fooddelimages/burger/burger1.jpg',
      price: 5.99,
      category: FoodCategory.Burger,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
      ],
    ),
    Food(
      name: 'Chicken Burger',
      description: 'Grilled chicken, lettuce, tomato, onions, pickles, mayo',
      imagePath: 'lib/fooddelimages/burger/burger2.jpg',
      price: 6.99,
      category: FoodCategory.Burger,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      description: 'Veggie patty, lettuce, tomato, onions, pickles, ketchup, mustard',
      imagePath: 'lib/fooddelimages/burger/burger3.jpg',
      price: 4.99,
      category: FoodCategory.Burger,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
      ],
    ),
    Food(
      name: 'Fish Burger',
      description: 'Breaded fish fillet, lettuce, tomato, onions, pickles, tartar sauce',
      imagePath: 'lib/fooddelimages/burger/burger4.jpg',
      price: 7.99,
      category: FoodCategory.Burger,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
      ],
    ),

    //salads
    Food(
      name: 'Garden Salad',
      description: 'Lettuce, tomato, cucumber, onions, olives, feta cheese, vinaigrette',
      imagePath: 'lib/fooddelimages/salad/salad1.jpg',
      price: 3.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.50),
        Addon(name: 'Shrimp', price: 3.50),
        Addon(name: 'Salmon', price: 4.50),
      ],
    ),
    Food(
      name: 'Caesar Salad',
      description: 'Romaine lettuce, croutons, parmesan cheese, caesar dressing',
      imagePath: 'lib/fooddelimages/salad/salad2.jpg',
      price: 4.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.50),
        Addon(name: 'Shrimp', price: 3.50),
        Addon(name: 'Salmon', price: 4.50),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description: 'Lettuce, tomato, cucumber, onions, olives, feta cheese, vinaigrette',
      imagePath: 'lib/fooddelimages/salad/salad3.jpg',
      price: 5.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.50),
        Addon(name: 'Shrimp', price: 3.50),
        Addon(name: 'Salmon', price: 4.50),
      ],
    ),
    Food(
      name: 'Cobb Salad',
      description: 'Lettuce, tomato, cucumber, onions, olives, feta cheese, vinaigrette',
      imagePath: 'lib/fooddelimages/salad/salad4.jpg',
      price: 6.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.50),
        Addon(name: 'Shrimp', price: 3.50),
        Addon(name: 'Salmon', price: 4.50),
      ],
    ),

    //sides
    Food(
      name: 'French Fries',
      description: 'Crispy fried potatoes',
      imagePath: 'lib/fooddelimages/side/sides1.jpg',
      price: 1.99,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: 'Cheese', price: 0.50),
        Addon(name: 'Bacon', price: 1.50),
        Addon(name: 'Chili', price: 0.75),
      ],
    ),
    Food(
      name: 'Onion Rings',
      description: 'Breaded and fried onion rings',
      imagePath: 'lib/fooddelimages/side/sides2.jpg',
      price: 2.99,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: 'Cheese', price: 0.50),
        Addon(name: 'Bacon', price: 1.50),
        Addon(name: 'Chili', price: 0.75),
      ],
    ),
    //desserts
    Food(
      name: 'Chocolate Cake',
      description: 'Rich chocolate cake with chocolate frosting',
      imagePath: 'lib/fooddelimages/dessert/dessert1.jpg',
      price: 3.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.50),
        Addon(name: 'Chocolate Ice Cream', price: 1.50),
        Addon(name: 'Whipped Cream', price: 0.75),
      ],
    ),
    Food(
      name: 'Cheesecake',
      description: 'Creamy cheesecake with graham cracker crust',
      imagePath: 'lib/fooddelimages/dessert/dessert2.jpg',
      price: 4.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.50),
        Addon(name: 'Chocolate Ice Cream', price: 1.50),
        Addon(name: 'Whipped Cream', price: 0.75),
      ],
    ),
    Food(
      name: 'Apple Pie',
      description: 'Warm apple pie with vanilla ice cream',
      imagePath: 'lib/fooddelimages/dessert/dessert3.jpg',
      price: 5.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.50),
        Addon(name: 'Chocolate Ice Cream', price: 1.50),
        Addon(name: 'Whipped Cream', price: 0.75),
      ],
    ),

    //drinks
    Food(
      name: 'Coke',
      description: '12 oz can of Coca Cola',
      imagePath: 'lib/fooddelimages/drink/drinks1.jpg',
      price: 1.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: 'Cherry Syrup', price: 0.50),
        Addon(name: 'Vanilla Syrup', price: 0.50),
        Addon(name: 'Lime Syrup', price: 0.50),
      ],
    ),
    Food(
      name: 'Sprite',
      description: '12 oz can of Sprite',
      imagePath: 'lib/fooddelimages/drink/drinks2.jpg',
      price: 1.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: 'Cherry Syrup', price: 0.50),
        Addon(name: 'Vanilla Syrup', price: 0.50),
        Addon(name: 'Lime Syrup', price: 0.50),
      ],
    ),
  ];

  /*
  * Getters
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*
  Operations
  */

  // user cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons){
    // see if there is a cart item with the same food and addons
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      // check if the food item is the same
      bool isSameFood = item.food == food;

      // check if the addons are the same
      bool isSameAddons = const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    // if there is a cart item with the same food and addons, increment the quantity
    if(cartItem != null){
      cartItem.quantity++;
    }
    //otherwise, add a new cart item
    else{
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);
    if(cartIndex != -1){
      _cart.removeAt(cartIndex);
    }else{
      _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }
    

  //get total price of cart
  double getTotalPrice(){
    double total = 0.0;
    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.totalPrice;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
   }
    return total;
  }
    

  //get total number of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;
    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  /*
  helpers
  */
  //generate receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt:");
    receipt.writeln();
  
  // format the date to include up to seconds only
  String formattedDate = 
    DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln('-----------');

  // loop through the cart items
  for(final cartItem in _cart){
    receipt.writeln('${cartItem.quantity} x ${cartItem.food.name} - ${formatPrice(cartItem.food.price)}');
    if(cartItem.selectedAddons.isNotEmpty){
      receipt.writeln("Addons: ${formatAddons(cartItem.selectedAddons)}");
    }
    receipt.writeln();
  }
  
    receipt.writeln('-----------');
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${formatPrice(getTotalPrice())}");
    return receipt.toString();
 }

  //format double value into money
  String formatPrice(double price){
    return '\$${price.toStringAsFixed(2)}';
  }

  //format list of addons into string summary
  String formatAddons(List<Addon> addons){
    return addons.map((addon) => "${addon.name} (${formatPrice(addon.price)})").join(', ');
  }
}