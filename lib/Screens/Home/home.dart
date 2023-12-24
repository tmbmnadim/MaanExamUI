import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: mainAppBar(screenSize),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
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
                              TextSpan(
                                text: "Welcome\n",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                              TextSpan(
                                text: "Dean",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 40,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: screenSize.width,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: screenSize.width / 2.5,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(155, 155, 41, 5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Order Now",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  expandedTitleScale: 1,
                  title: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 192, 192, 192),
                        offset: Offset(0, 6),
                      ),
                    ], borderRadius: BorderRadius.circular(25)),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) {},
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: IconButton(
                          icon: const Icon(
                            CupertinoIcons.search,
                            size: 24,
                          ),
                          onPressed: () {},
                        ),
                        prefixIconColor: Colors.grey,
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
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.black26,
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
                ),
                expandedHeight: 80,
                backgroundColor: Colors.black,
                toolbarHeight: screenSize.height * 0.1,
                pinned: true,
                snap: false,
                floating: false,
              ),
            ];
          },
          body: Container(
            height: 300,
            color: Colors.lime,
            width: screenSize.width,
          ),
        ),
      ),
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
      title: Container(
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
