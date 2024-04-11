import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank you for your order!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              )
            ),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) => 
                  Text(restaurant.displayCartReceipt()),
            )
          ),
          const SizedBox(height: 25),
          const Text('Your order will be delivered in 30 minutes.',
            style: TextStyle(
              fontSize: 16,
            )
            )
          ],
        ),
      ),
    );
  }
}