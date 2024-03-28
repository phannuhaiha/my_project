import 'package:animate_do/animate_do.dart';
import 'package:my_project/product.dart';
import 'package:flutter/material.dart';
import 'package:my_project/cartpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartItems())],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text(
          "CCBHL",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        // brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ShoppingCartPage()), // Thay YourOtherPage() bằng tên của trang bạn muốn điều hướng đến
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "Gương",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1100),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Bàn",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1200),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Ghế",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1300),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Đèn",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Tủ",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Giường",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Thảm",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeInUp(
                  duration: Duration(milliseconds: 1500),
                  child: makeItem(
                      image: 'images/ban-chu-nhat-den.jpg',
                      tag: 'red',
                      context: context)),
              FadeInUp(
                  duration: Duration(milliseconds: 1600),
                  child: makeItem(
                      image: 'images/ban-chu-nhat-den.jpg',
                      tag: 'blue',
                      context: context)),
              FadeInUp(
                  duration: Duration(milliseconds: 1700),
                  child: makeItem(
                      image: 'assets/images/three.jpg',
                      tag: 'white',
                      context: context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, tag, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Product(
                        image: image,
                        tag: tag,
                      )));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1000),
                            child: Text(
                              "Product",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1100),
                            child: Text(
                              "Color",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                  FadeInUp(
                      duration: Duration(milliseconds: 1200),
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
                      ))
                ],
              ),
              FadeInUp(
                  duration: Duration(milliseconds: 1200),
                  child: Text(
                    "100\$",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
