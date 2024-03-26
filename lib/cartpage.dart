import 'package:flutter/material.dart';
import 'package:my_project/information.dart';

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
  List<Map<String, dynamic>> cartItems = [
    {'name': 'Product 1', 'price': 10.00, 'quantity': 2},
    {'name': 'Product 2', 'price': 10.00, 'quantity': 7},
    {'name': 'Product 3', 'price': 10.00, 'quantity': 3},
    {'name': 'Product 4', 'price': 10.00, 'quantity': 4},
    {'name': 'Product 5', 'price': 10.00, 'quantity': 8},
  ];

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(
        0, (total, item) => total + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(cartItems[index]['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: \$${cartItems[index]['price']}'),
                Text('Quantity: ${cartItems[index]['quantity']}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  cartItems.removeAt(index);
                });
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
                'Total: \$${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InformationPage()), // Thay YourOtherPage() bằng tên của trang bạn muốn điều hướng đến
                  );
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
