import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart_page.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySilverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
         return SliverAppBar(
          expandedHeight: 340,
          collapsedHeight: 120,
          floating: false,
          pinned: true,
          actions: [
            //cart button
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                //go to cart page
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
              },
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Sunset Diner',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: child,
            ),
            title: title,
            centerTitle: true,
            titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
            expandedTitleScale: 1,
          ),
        );
   
  }
}