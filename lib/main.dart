import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/filter_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meals_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _avaliableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaliableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        // '/' is a default home page
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_avaliableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) =>
            FilterScreen(saveFilters: _setFilters, currentFilters: _filters),
      },
      // onGenerateRoute: (settings) {
      //   //allow us to acces to setting.name too, this is a flexible way to generate routes
      //   //and follow a desired behavior
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //     builder: (context) => CategoriesScreen(),
      //   );
      // },
      // this is the last resourse when everyother fails before suspends the app
      onUnknownRoute: (settings) {
        //MaterialPageRoute its a way to create navigation
        // MaterialPageRoute allowus to managa animation and other things inerents to navigation
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(
        child: Text(
          'Navigation time!',
        ),
      ),
    );
  }
}
