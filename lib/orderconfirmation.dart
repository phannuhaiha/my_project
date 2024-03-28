import 'package:flutter/material.dart';
import 'package:my_project/ordersuccess.dart';
import 'package:my_project/information.dart';

class OrderConfirmationPage extends StatelessWidget {
  final ShippingAddress shippingAddress;
  final List<Map<String, dynamic>> cartItems;

OrderConfirmationPage({required this.shippingAddress, required this.cartItems});  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ORDER CONFIRMATION'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Shipping Information:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Name: ${shippingAddress.name}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Address: ${shippingAddress.street}, ${shippingAddress.city}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Phone: ${shippingAddress.phone}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Ordered Items:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length, // Số lượng sản phẩm trong đơn hàng
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index]['name']),
                    subtitle: Text('Price: \$${cartItems[index]['price']}'), // Giá của mỗi sản phẩm
                    trailing: Text('Quantity: ${cartItems[index]['quantity']}'), // Số lượng của mỗi sản phẩm
                  );
                },
              ),
            ),
            SizedBox(
                height:
                    20.0), // Khoảng cách giữa danh sách sản phẩm và nút xác nhận
            SizedBox(
              width: double.infinity, // Mở rộng nút xác nhận theo chiều ngang
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderSuccessPage(),
                    ),
                  );
                },
                child: Text('Confirm Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
