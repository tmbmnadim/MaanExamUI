import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        ///--------------------------------------Location data On AppBar
        title: Text("Nadim's Kitchen"),

        ///--------------------------------------Bell Icon On AppBar
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bell_fill,
                color: Colors.orange,
              )),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: screenSize.height * 0.1,
        // bottom: searchAppBar(screenSize.width),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: screenSize.width,
                  height: 320,
                  color: Colors.black12,
                  child: Container(
                    width: screenSize.width,
                    height: 230,
                    color: Colors.green,
                    child: Image.asset(
                      "images/food1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 30,
                  child: Container(
                    width: 300,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Nadim's Kitchen",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "21 Matt st, NY 10013, New York",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Open 8:00 - 22:00",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Chines . Italian . Fast food",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 12),
                          SizedBox(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "4.4",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Colors.deepOrange,
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.wallet,
                                  size: 16,
                                  color: Colors.deepOrange,
                                ),
                                Text(
                                  "\$35- \$65",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: screenSize.width,
              height: 320,
              color: Colors.blue,
              // child: TabBar(
              //   controller: TabController(length: 3, vsync: this),
              //   tabs: <Widget>[
              //     Tab(
              //       icon: Icon(Icons.cloud_outlined),
              //     ),
              //     Tab(
              //       icon: Icon(Icons.beach_access_sharp),
              //     ),
              //     Tab(
              //       icon: Icon(Icons.brightness_5_sharp),
              //     ),
              //   ],
              // ),
            ),
            // const TabBarView(
            //   children: <Widget>[
            //     Center(
            //       child: Text("It's cloudy here"),
            //     ),
            //     Center(
            //       child: Text("It's rainy here"),
            //     ),
            //     Center(
            //       child: Text("It's sunny here"),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
