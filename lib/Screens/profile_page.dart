import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> accountOptions = [
    "History",
    "Digital Payment",
    "Orders",
    "Favourites",
    "Switch to Dark Mode"
  ];
  List<IconData> accountOptionsIcons = [
    Icons.history,
    Icons.wallet,
    Icons.shopping_bag_outlined,
    Icons.favorite_border,
    Icons.dark_mode_outlined
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height * 0.75,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  thickness: 10,
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
                const SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/myimage.jpg"),
                          ),
                        ),
                      ),
                      title: Text(
                        "Mansur Nadim",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        "01712345678",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ),
                ),
                const Divider(
                  height: 10,
                  thickness: 10,
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
                ListView.builder(
                  itemCount: accountOptions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: ListTile(
                          leading: Icon(accountOptionsIcons[index]),
                          title: Text(
                            accountOptions[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          trailing:
                              const Icon(Icons.keyboard_arrow_right_outlined),
                        ),
                      ),
                      if (accountOptions[index] != accountOptions.last)
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color.fromARGB(255, 238, 238, 238),
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Ink(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 62, 5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Log out",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
