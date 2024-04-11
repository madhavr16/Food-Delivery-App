import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery in Progress...',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          )
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
          
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt()
        ]
      ),
    );
  }
  //build bottom navbar to contact driver
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: (){},
            ),
          ),
          const SizedBox(width: 10),
          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Driver Name',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text('Driver',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
                ),
              )
            ],
          ),

          const Spacer(),

          Row(
            children: [
              //call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                  onPressed: (){},
                ),
              ),

              const SizedBox(width: 10),
              //message button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.message),
                  color: Colors.blue,
                  onPressed: (){},
                ),
              ),
             
            ],
          )
        ],
      ),
    );
  }
    
}