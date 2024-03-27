import 'package:flutter/material.dart';
import 'package:my_project/ordersuccess.dart';

void main() {
  runApp(OrderConfirmPage());
}

class OrderConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Confirmation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderConfirmationPage(),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
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
              'Name: Đừu Mạnh Lam',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Address: 123 Bình Thạnh, Hồ Chí Minh',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Phone: 123456789',
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
                itemCount: 3, // Số lượng sản phẩm trong đơn hàng
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Product ${index + 1}'),
                    subtitle: Text('Price: \$10.00'), // Giá của mỗi sản phẩm
                    trailing: Text('Quantity: 1'), // Số lượng của mỗi sản phẩm
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
