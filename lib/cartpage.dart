import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: 5, // Number of items in the cart
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Product ${(index + 1)}'),
            subtitle: Text('Price: \$10.00'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove item from cart
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total: \$50.00',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Proceed to checkout
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
