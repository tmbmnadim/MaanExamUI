import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uimaanexamnadim/Screens/Home/homepage.dart';
import 'package:uimaanexamnadim/Screens/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: mainAppBar(screenSize),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _onTappedBar(index);
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "Nearby",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Homepage(),
          ProfilePage(),
          ProfilePage(),
          ProfilePage(),
        ],
      ),
    );
  }

  Widget titleWidget(Size screenSize, int index) {
    List<Widget> titleWidgets = [
      Container(
        width: screenSize.width * 0.65,
        height: screenSize.height * 0.045,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Center(
          child: Text(
            "Dhaka, Bangladesh",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
      const Text("Account"),
      const Text("Account"),
      const Text("Account"),
    ];
    return titleWidgets[index];
  }

  void _onTappedBar(int value) {
    setState(() {
      _currentIndex = value;
    });
    _pageController.animateToPage(
      value,
      duration: const Duration(microseconds: 500),
      curve: Curves.decelerate,
    );
  }

  PreferredSizeWidget mainAppBar(Size screenSize) {
    return AppBar(
      ///--------------------------------------Profile Pic On AppBar
      leading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: CircleAvatar(
          backgroundImage: AssetImage("images/myimage.jpg"),
        ),
      ),

      ///--------------------------------------Location data On AppBar
      title: titleWidget(screenSize, _currentIndex),

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
    );
  }
}
