import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_current_location.dart';
import 'package:food_delivery/components/my_description_box.dart';
import 'package:food_delivery/components/my_drawer.dart';
import 'package:food_delivery/components/my_food_tile.dart';
import 'package:food_delivery/components/my_silver_app_bar.dart';
import 'package:food_delivery/components/my_tab_bar.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  //sort and returrn a list of food items based on the category
  List<Food> _filterFoodByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of food in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){

      //get category menu
      List<Food> categoryMenu = _filterFoodByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];
          //return food tileUI
          return FoodTile(
            food: food, 
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: food)),
          )
        );
        },
      );
        
  }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: const MyDrawer(),
    body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) =>[
        MySilverAppBar(
          title: MyTabBar(
            tabController: _tabController,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(
                indent: 25,
                endIndent: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              //my current location
              const MyCurrentLocation(),
              //description box
              const MyDescriptionBox(),
            ],
          ),
        )
      ],
      body: Consumer<Restaurant>(
        builder: (context, restaurant, child) => TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(restaurant.menu),
        ),
    ),
    ),
    );
  }
}