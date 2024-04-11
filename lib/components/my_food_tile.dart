import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$' + food.price.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 5),  
                      Text(
                        food.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  )
                ),
                const SizedBox(width: 15),
                //food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(food.imagePath, height: 120, width: 120, fit: BoxFit.cover,)
                ),
              ],
            ),
          )
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: Theme.of(context).colorScheme.primary,
        ),
      ]
    );
  }
}