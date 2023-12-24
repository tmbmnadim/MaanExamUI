import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uimaanexamnadim/Screens/restaurant_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  List<String> categories = ["BBQ", "Burger", "Italian", "Pizza", "Korean"];
  List<String> foodIcons = [
    "images/drumstick.png",
    "images/burger.png",
    "images/egg.png",
    "images/pizza.png",
    "images/shrimp.png",
  ];

  List<String> restaurantBannerItems = ["Egg Beg", "Masala Ruti"];
  List<String> restaurantBannerName = ["Nadim Kitchen", "Mansur Foods"];
  List<String> restaurantBannerPic = [
    "images/food1.jpg",
    "images/food2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: greetingAndBanner(screenSize),
              ),
              SliverAppBar(
                flexibleSpace: searchAppbar(screenSize),
                expandedHeight: 80,
                backgroundColor: Colors.white,
                toolbarHeight: screenSize.height * 0.1,
                pinned: true,
                snap: false,
                floating: false,
              ),
            ];
          },
          body: SingleChildScrollView(
            child: SizedBox(
              height: screenSize.height * 0.7,
              width: screenSize.width,
              child: Column(
                children: [
                  ///----------------- Categories
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 50,
                    child: const Text(
                      "Categories",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 100,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => categoryItem(
                        text: categories[index],
                        imagePath: foodIcons[index],
                      ),
                    ),
                  ),

                  ///----------------- Restaurants near you
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 50,
                    child: const Text(
                      "Restaurants near you",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: screenSize.width,
                    height: 230,
                    child: ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => restaurantNearby(
                        restaurantName: restaurantBannerName[index],
                        imagePath: restaurantBannerPic[index],
                        restaurantItem: restaurantBannerItems[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget restaurantNearby({
    required String restaurantName,
    required String restaurantItem,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RestaurantPage(),
            ),
          );
        },
        child: Container(
          width: 250,
          height: 230,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    restaurantItem,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        restaurantName,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "4.8",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 250,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "20-25 min ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem({
    required String text,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: 80,
          height: 100,
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.deepOrange,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imagePath,
                    color: Colors.deepOrange,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlexibleSpaceBar searchAppbar(Size screenSize) {
    return FlexibleSpaceBar(
      titlePadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      expandedTitleScale: 1,
      title: Container(
        ///-------------------This container is casting the shadow for SearchBox
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 192, 192, 192),
              offset: Offset(0, 6),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),

        ///--------------------------------------------- Search Box
        child: TextFormField(
          controller: searchController,
          onChanged: (value) {},
          cursorColor: Colors.black,
          decoration: InputDecoration(
            isDense: true,

            /// Search Button
            prefixIcon: IconButton(
              icon: const Icon(
                CupertinoIcons.search,
                size: 24,
              ),
              onPressed: () {},
            ),
            prefixIconColor: Colors.grey,

            /// Filter Button
            suffixIcon: IconButton(
              icon: const Icon(
                CupertinoIcons.slider_horizontal_3,
                size: 24,
              ),
              onPressed: () {},
            ),
            suffixIconColor: Colors.grey,
            filled: true,
            fillColor: const Color.fromARGB(255, 238, 238, 238),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 15,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            hintText: "What do you want to eat...",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget greetingAndBanner(Size screenSize) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: screenSize.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 10,
              ),
              child: RichText(
                text: const TextSpan(children: [
                  ///Greetings
                  TextSpan(
                    text: "Welcome\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),

                  /// ------ Username
                  TextSpan(
                    text: "Dean",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 35,
                    ),
                  ),
                ]),
              ),
            ),
          ),

          /// --------------------- Sale Banner
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Stack(
              children: [
                Container(
                  width: screenSize.width,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: const DecorationImage(
                        image: AssetImage("images/banner.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  width: screenSize.width / 2.5,
                  height: 160,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(150, 155, 41, 5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            "50%\nDiscount on selected restaurant",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: screenSize.width / 2.5,
                          height: 40,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Order Now",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
