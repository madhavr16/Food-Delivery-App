import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_quantity_selector.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem,
    });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) =>
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //food image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        cartItem.food.imagePath, height: 100, width: 100, fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    //name and price
                    Column(
                      children: [
                        //food name
                        Text(cartItem.food.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        //price
                        Text('\$${cartItem.food.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    
                    //increment and decrement buttons
                    MyQuantitySelector(
                      quantity: cartItem.quantity, 
                      food: cartItem.food, 
                      onIncrement: (){
                        restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                      }, 
                      onDecrement: (){
                        restaurant.removeFromCart(cartItem);
                      },
                    )
                  ],
                ),
              ),
              //const SizedBox(height: 10),
              //divider
              //Divider(color: Theme.of(context).colorScheme.secondary,),
              //addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                  children: [
                    Wrap(
                      children: cartItem.selectedAddons.map(
                        (addon) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Row(
                              children: [
                                //addon name
                                Text(addon.name),
                                //addon price
                                Text(' \$${addon.price}',
                                ),
                              ],
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),  
                            ),
                            onSelected: (bool selected) {
                              // Add your logic here
                            },
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ).toList(),
                    )
                  ],
                ),
              )
            ]
          ),
        )
    );
  }
}