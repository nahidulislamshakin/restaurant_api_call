import 'package:flutter/material.dart';
import '../models/recipe.api.dart';
import '../models/recipe.dart';
import './widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.green[100],
        elevation: 6,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.greenAccent, Colors.lightGreen])),
                accountName: Text(
                  "Nahidul Islam Shakin",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  "shakinhabib2000@gmail.com",
                  style: TextStyle(color: Colors.black),
                )),
            ListTile(
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.black,
              ),
              title: Text(
                "Menu",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant_menu_outlined,
                color: Colors.black,
              ),
              title: Text(
                "Menu",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant_menu_rounded,
                color: Colors.black,
              ),
              title: Text(
                "Menu",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text('Settings',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipe')
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Colors.yellow
          ),

        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].images);
              },
            ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //       backgroundColor: Colors.green
      //   ),],
      //    //  type: BottomNavigationBarType.shifting,
      //    //  //currentIndex: _selectedIndex,
      //    //  selectedItemColor: Colors.black,
      //    //  iconSize: 40,
      //    // // onTap: _onItemTapped,
      //    //  elevation: 5
      // ),
    );
  }
}
