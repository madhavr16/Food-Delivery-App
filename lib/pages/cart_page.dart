import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;
      //scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            )
            ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text('Are you sure, you want to clear the cart?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary
                        //color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    actions: [
                      //cancel button
                      TextButton(
                        onPressed: () => Navigator.pop(context), 
                        child: const Text('Cancel')
                      ),
                      //yes button
                      TextButton(
                        onPressed: () {
                           Navigator.pop(context);
                           restaurant.clearCart();
                        }, 
                        child: const Text('Yes')
                      )
                    ],
                  )
                );
              }, 
              icon: const Icon(Icons.delete)
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: userCart.isEmpty? const Expanded(
                      child:  Center(
                        child: Text('Cart is empty')
                      )
                    ): Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          //get individual cart item
                          final cartItem = userCart[index];
                      
                          //return cart tile UI
                          return MyCartTile(cartItem: cartItem,);
                        }
                      ),
                    )
                  )
                ],
              ),
            ),
            //buton to pay
            MyButton(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
              }, 
              text: 'Go to Payment',
            ),
            const SizedBox(height: 25,),
          ],
        ),
      );
    });
      
  }
}
