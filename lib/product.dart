import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_project/cartpage.dart';
import 'package:provider/provider.dart';

class Product extends StatelessWidget {
  final String image;
  final String tag;

  const Product({Key? key, required this.image, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartItems(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Hero(
            tag: tag,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ]),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Lấy danh sách sản phẩm từ giỏ hàng
                             List<Map<String, dynamic>> cartItems = Provider.of<CartItems>(context, listen: false).items;
    
                            // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
                            bool isProductExistInCart = cartItems.any((item) => item['name'] == 'Product');
    
                            if (isProductExistInCart) {
                            // Nếu sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng lên 1
                            Provider.of<CartItems>(context, listen: false).increaseQuantity('Product');
                            } else {
                            // Nếu sản phẩm chưa tồn tại trong giỏ hàng, thêm mới vào giỏ hàng
                               Map<String, dynamic> product = {
                                   'name': 'Product',
                                    'price': 10.00,
                                    'quantity': 1, // Thêm thông tin số lượng vào sản phẩm
                                 };
                              Provider.of<CartItems>(context, listen: false).addToCart(product);
                            }
                            // Điều hướng đến trang ShoppingCartPage
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ShoppingCartPage()),
                            );
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Center(
                              child: Icon(
                                Icons.favorite_border,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  colors: [
                                Colors.black.withOpacity(.9),
                                Colors.black.withOpacity(.0),
                              ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FadeInUp(
                                  duration: Duration(milliseconds: 1300),
                                  child: Text(
                                    "Product",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 25,
                              ),
                              FadeInUp(
                                  duration: Duration(milliseconds: 1400),
                                  child: Text(
                                    "Color",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  FadeInUp(
                                      duration: Duration(milliseconds: 1450),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        margin: EdgeInsets.only(right: 20),
                                        child: Center(
                                            child: Text(
                                          '40',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      )),
                                  FadeInUp(
                                      duration: Duration(milliseconds: 1450),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        margin: EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                          '42',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                      )),
                                  FadeInUp(
                                      duration: Duration(milliseconds: 1460),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        margin: EdgeInsets.only(right: 20),
                                        child: Center(
                                            child: Text(
                                          '44',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      )),
                                  FadeInUp(
                                      duration: Duration(milliseconds: 1470),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        margin: EdgeInsets.only(right: 20),
                                        child: Center(
                                            child: Text(
                                          '46',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Tạo một Map để lưu thông tin của sản phẩm
                                  Map<String, dynamic> product = {
                                    'name': 'Product',
                                    'price': 10.00,
                                  };
                                  // Đưa thông tin sản phẩm vào giỏ hàng thông qua CartItems provider
                                  Provider.of<CartItems>(context, listen: false)
                                      .addToCart(product);

                                  // Điều hướng đến trang ShoppingCartPage
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShoppingCartPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      'Đưa vào giỏ hàng',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
