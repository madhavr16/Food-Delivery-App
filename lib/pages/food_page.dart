import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({
    super.key,
    required this.food,
  }){
    //initialize selected addons
    for(Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method for add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons){
    //close the food page and go to menu
    Navigator.pop(context);
    //get selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //food image
            Image.asset(widget.food.imagePath, height: 300, width: double.infinity, fit: BoxFit.cover,),
        
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   //food name
                   Text(widget.food.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                   ),
                   //food price
                   Text('\$' + widget.food.price.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                   ),
                    const SizedBox(height: 10),
              
                   //food description
                   Text(
                    widget.food.description, 
                   ),
                    const SizedBox(height: 10),
        
                    Divider(color: Theme.of(context).colorScheme.inversePrimary,),
        
                    const SizedBox(height: 10),
        
                    Text(
                      'Add-ons',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
              
                  //addons
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        //get individual addon
                        Addon addon = widget.food.availableAddons[index];
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text('\$' + addon.price.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),),
                          value: widget.selectedAddons[addon], 
                          onChanged: (bool? value){
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                       );
                     },
                    ),
                  )
                ],
              ),
            ),
        
            //add to cart button
            MyButton(
              onTap: () => addToCart(widget.food, widget.selectedAddons), 
              text: 'Add to Cart',
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    ),
    //back button
    SafeArea(
      child: Opacity(
        opacity: 0.8,
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          decoration: const BoxDecoration(
            //color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
            ),
      )
    ),
      ],
          );
  }
}