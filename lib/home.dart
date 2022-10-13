import 'package:flutter/material.dart';
import 'package:fooderlich/screens/recipes_screen.dart';
import 'models/explore_recipe.dart';
import 'screens/explore_screen.dart';
import 'screens/grocery_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static bool isFavorited = false;
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen()
    // Card1(
    //     recipe: ExploreRecipe(
    //         authorName: 'Ray Wenderlich',
    //         title: 'The Art of Dough',
    //         subtitle: 'Editor\'s Choice',
    //         message: 'Learn to make the perfect bread.',
    //         backgroundImage: 'assets/magazine_pics/card_bread.jpg')),
    // Card2(
    //     recipe: ExploreRecipe(
    //         authorName: 'Mike Katz',
    //         role: 'Smoothie Connoisseur',
    //         profileImage: 'assets/profile_pics/person_katz.jpeg',
    //         title: 'Recipe',
    //         subtitle: 'Smoothies',
    //         backgroundImage: 'assets/magazine_pics/mag2.png')),
    // Card3(
    //     recipe: ExploreRecipe(
    //         title: 'Vegan Trends',
    //         tags: [
    //           'Healthy',
    //           'Vegan',
    //           'Carrots',
    //           'Greens',
    //           'Wheat',
    //           'Pescetarian',
    //           'Mint',
    //           'Lemongrass',
    //           'Salad',
    //           'Water'
    //         ],
    //         backgroundImage: 'assets/magazine_pics/mag3.png')),
  ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Fooderlich',
                    style: Theme.of(context).textTheme.headline6)),
            body: IndexedStack(index: tabManager.selectedTab, children: pages),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor:
                    Theme.of(context).textSelectionTheme.selectionColor,
                currentIndex: tabManager.selectedTab,
                onTap: (index) {
                  tabManager.goToTab(index);
                },
                items: <BottomNavigationBarItem>[
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.explore), label: 'Explore'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.book), label: 'Recipes'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'To Buy'),
                ]));
      },
    );
  }
}