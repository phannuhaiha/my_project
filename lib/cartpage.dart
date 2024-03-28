import 'package:flutter/material.dart';
import 'package:my_project/information.dart';
import 'package:provider/provider.dart';

// Class để lưu trữ trạng thái của giỏ hàng
class CartItems extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addToCart(Map<String, dynamic> product) {
    // Thêm sản phẩm vào giỏ hàng
    _items.add(product);
    // Cập nhật tổng
    double total = _items.fold(
      0,
      (total, item) => total + (item['price'] ?? 0),
    );
    // Thông báo cho các widget người tiêu dùng biết rằng dữ liệu đã thay đổi
    notifyListeners();
  }

  void increaseQuantity(String productName) {
    // Tăng số lượng của sản phẩm trong giỏ hàng lên 1
    for (int i = 0; i < _items.length; i++) {
      if (_items[i]['name'] == productName) {
        _items[i]['quantity'] += 1;
        break;
      }
    }
    // Thông báo cho các widget người tiêu dùng biết rằng dữ liệu đã thay đổi
    notifyListeners();
  }

  void removeFromCart(int index) {
    // Xóa sản phẩm khỏi giỏ hàng
    _items.removeAt(index);
    // Thông báo cho các widget người tiêu dùng biết rằng dữ liệu đã thay đổi
    notifyListeners();
  }
}

void main() {
  runApp(
    // Sử dụng MultiProvider để cung cấp cả CartItems cho cả Product và ShoppingCartPage
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartItems()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lấy danh sách sản phẩm từ giỏ hàng
    List<Map<String, dynamic>> cartItems =
        Provider.of<CartItems>(context).items;

    double total = cartItems.fold(
        0,
        (total, item) =>
            total + ((item['price'] ?? 0) * (item['quantity'] ?? 0)));

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
                Text('Quantity: 1'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Xóa sản phẩm khỏi giỏ hàng khi nhấn vào nút Xóa
                Provider.of<CartItems>(context, listen: false)
                    .removeFromCart(index);
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
                  List<Map<String, dynamic>> cartItems =
                      Provider.of<CartItems>(context, listen: false).items;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InformationPage(cartItems: cartItems)), // Thay YourOtherPage() bằng tên của trang bạn muốn điều hướng đến
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
