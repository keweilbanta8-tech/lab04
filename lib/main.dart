import 'package:flutter/material.dart';

void main() {
  runApp(const PizzaStoreApp());
}

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuScreen(),

        '/vegetable': (context) => const FoodScreen(
              title: 'Vegetable Pizza',
              description: 'Fresh vegetables on crispy pizza.',
              imagePath: 'assets/images/vegetable.png',
              color: Colors.green,
            ),

        '/cheese': (context) => const FoodScreen(
              title: 'Cheese Pizza',
              description: 'Loaded with premium cheese.',
              imagePath: 'assets/images/cheese.png',
              color: Colors.orange,
            ),

        '/fries': (context) => const FoodScreen(
              title: 'Box of Fries',
              description: 'Golden crispy fries.',
              imagePath: 'assets/images/fries.png',
              color: Colors.red,
            ),
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Store'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                'assets/images/vegetable.png',
                width: 60,
              ),
              title: const Text('Vegetable Pizza'),
              onTap: () {
                Navigator.pushNamed(context, '/vegetable');
              },
            ),
          ),

          Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                'assets/images/cheese.png',
                width: 60,
              ),
              title: const Text('Cheese Pizza'),
              onTap: () {
                Navigator.pushNamed(context, '/cheese');
              },
            ),
          ),

          Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                'assets/images/fries.png',
                width: 60,
              ),
              title: const Text('Box of Fries'),
              onTap: () {
                Navigator.pushNamed(context, '/fries');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FoodScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color color;

  const FoodScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 250,
                height: 250,
              ),

              const SizedBox(height: 20),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}