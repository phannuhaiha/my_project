import 'package:flutter/material.dart';

void main() {
  runApp(InformationPage());
}

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nhập Thông tin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddressInputPage(),
    );
  }
}

class AddressInputPage extends StatefulWidget {
  @override
  _AddressInputPageState createState() => _AddressInputPageState();
}

class _AddressInputPageState extends State<AddressInputPage> {
  String _name = '';
  String _street = '';
  String _city = '';
  String _phone = '';

  // Hàm xác nhận đơn hàng
  void _confirmOrder() {
    print('Xác nhận đơn hàng:');
    print('Tên: $_name');
    print('Địa chỉ: $_street, $_city, $_phone');
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: _confirmOrder,
                  child: Text('Xác nhận'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


