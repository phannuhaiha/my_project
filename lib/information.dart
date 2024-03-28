import 'package:flutter/material.dart';
import 'package:my_project/cartpage.dart';
import 'package:my_project/orderconfirmation.dart';
import 'dart:core';


class ShippingAddress {
  final String name;
  final String street;
  final String city;
  final String phone;

  ShippingAddress({
    required this.name,
    required this.street,
    required this.city,
    required this.phone,
  });
}

class InformationPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  InformationPage({required this.cartItems});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nhập Thông tin giao hàng',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddressInputPage(cartItems: cartItems),
    );
  }
}

class AddressInputPage extends StatefulWidget {
   final List<Map<String, dynamic>> cartItems;
   AddressInputPage({required this.cartItems});
  @override
  _AddressInputPageState createState() => _AddressInputPageState();
}

class _AddressInputPageState extends State<AddressInputPage> {
  String _name = '';
  String _street = '';
  String _city = '';
  String _phone = '';

  // Hàm xác nhận đơn hàng
  void _confirmOrder(BuildContext context) {
    // Tạo một đối tượng ShippingAddress từ thông tin nhập vào

    ShippingAddress shippingAddress = ShippingAddress(
      name: _name,
      street: _street,
      city: _city,
      phone: _phone,
    );

    // Chuyển đến trang xác nhận đơn hàng và truyền thông tin địa chỉ giao hàng
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
       OrderConfirmationPage(shippingAddress: shippingAddress, cartItems: widget.cartItems,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nhập Thông tin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Street'),
              onChanged: (value) {
                setState(() {
                  _street = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'City'),
              onChanged: (value) {
                setState(() {
                  _city = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone'),
              onChanged: (value) {
                setState(() {
                  _phone = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            // Sử dụng hàm xác nhận đơn hàng
            SizedBox(
              width: double.infinity, // Mở rộng nút theo chiều ngang
              child: ElevatedButton(
                onPressed: () {
                 _confirmOrder(context); // Gọi hàm xác nhận đơn hàng
                },
                child: Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
