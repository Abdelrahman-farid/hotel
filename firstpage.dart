import 'dart:async';
import 'package:flutter/material.dart';
import 'package:training/done.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final List<Widget> _listWidget = [];  // Made final since it's initialized in initState
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  int _currentSelected = 0;  // Moved from local variable to class field

  @override
  void initState() {
    super.initState();
    
    // Initialize listWidget
    _listWidget.addAll([
      _buildHomeTab(),
      _buildBookingTab(),
      _buildHelpTab(),
    ]);

    // Setup auto-scroll timer for image slider
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 6) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {  // Add check for controller attachment
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildHomeTab() {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 300,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {  // Add page change handler
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  _NetworkImage("https://tse3.mm.bing.net/th?id=OIP.StNUTuxuNZHVc9meSKoWJwHaEK&pid=Api&P=0&h=220"),
                  _NetworkImage("https://tse2.mm.bing.net/th?id=OIP.9jZ3myrJbRuUUa3xsvH7QAHaE8&pid=Api&P=0&h=220"),
                  _NetworkImage("https://tse2.mm.bing.net/th?id=OIP.WjJZc7laGAbZpGTSoX7nqwHaEw&pid=Api&P=0&h=220"),
                  _NetworkImage("https://tse2.mm.bing.net/th?id=OIP.9XUpT4t7WX46Edip7Qs5KwHaDp&pid=Api&P=0&h=220"),
                  _NetworkImage("https://tse1.mm.bing.net/th?id=OIP.6950I-QnJTu9y4GJ2nAlZgHaE7&pid=Api&P=0&h=220"),
                  _NetworkImage("https://tse4.mm.bing.net/th?id=OIP.s365iUzxSDwezLqGZVoyQgHaFJ&pid=Api&P=0&h=220"),
                  _NetworkImage("https://tse2.mm.bing.net/th?id=OIP.K9HyVS9-7moZ1ddIlL64PAHaEK&pid=Api&P=0&h=220"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 20, left: 40),
              child: const Text(
                "Branches:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            _buildBranchesGrid(),
          ],
        ),
      ],
    );
  }

  Widget _buildBookingTab() {
    return ListView(
      children: [
        Column(
          children: [
            _buildHotelCard(
              "https://tse4.mm.bing.net/th?id=OIP.gm2CgwVHI2maOW7eHMclbAHaF9&pid=Api&P=0&h=220",
              "Hurghada Plaza",
              "65",
            ),
            _buildHotelCard(
              "https://tse3.mm.bing.net/th?id=OIP.hCgAsVJVjImN7Xx3OqalUwHaDt&pid=Api&P=0&h=220",
              "Marsa Alam",
              "70",
            ),
            _buildHotelCard(
              "https://tse2.mm.bing.net/th?id=OIP.SCWAzcU-Y5c51veghHgwbgHaE8&pid=Api&P=0&h=220",
              "Alexandria Corniche",
              "70",
            ),
            _buildHotelCard(
              "https://tse1.mm.bing.net/th?id=OIP.YrCAJdceAR4MegxpbEHp0AHaE3&pid=Api&P=0&h=220",
              "Taba Resort",
              "70",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHelpTab() {
    return const Column(
      children: [
        Center(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.call),
                  title: Text("Call us"),
                  trailing: Text("01020350414"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.info_outline_rounded),
                  title: Text("More info"),
                  trailing: Text("https://www.hilton.com/en/"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBranchesGrid() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 280,
        crossAxisSpacing: 10.0,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),  // Prevent grid scroll within ListView
      children: [
        _buildBranchCard(
          "https://tse4.mm.bing.net/th?id=OIP.gm2CgwVHI2maOW7eHMclbAHaF9&pid=Api&P=0&h=220",
          "Hurghada Plaza",
          5,
        ),
        _buildBranchCard(
          "https://tse3.mm.bing.net/th?id=OIP.hCgAsVJVjImN7Xx3OqalUwHaDt&pid=Api&P=0&h=220",
          "Marsa Alam",
          4.5,
        ),
        _buildBranchCard(
          "https://tse2.mm.bing.net/th?id=OIP.SCWAzcU-Y5c51veghHgwbgHaE8&pid=Api&P=0&h=220",
          "Alexandria Corniche",
          4,
        ),
        _buildBranchCard(
          "https://tse1.mm.bing.net/th?id=OIP.YrCAJdceAR4MegxpbEHp0AHaE3&pid=Api&P=0&h=220",
          "Taba Resort",
          4.5,
        ),
      ],
    );
  }

  Widget _buildBranchCard(String imageUrl, String title, double rating) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: 300,
            child: Image.network(
              imageUrl,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                if (index < rating.floor()) {
                  return const Icon(Icons.star, color: Colors.yellow);
                } else if (index < rating) {
                  return const Icon(Icons.star_half, color: Colors.yellow);
                } else {
                  return const Icon(Icons.star_border, color: Colors.yellow);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard(String imageUrl, String title, String price) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl, width: 300),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "$price\$ /night",
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Done(),
                ),
              );
            },
            child: const Text("Book now"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("X Hotel"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentSelected = value;
          });
        },
        currentIndex: _currentSelected,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add_outlined),
            label: "Book",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Help"),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(0),
                      width: 60,
                      height: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/www.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: const Text("Abdelrahman Farid"),
                    subtitle: const Text("abdofarid133@gmail.com"),
                  ),
                ),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Account"),
                  leading: const Icon(Icons.account_circle),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("About us"),
                  leading: const Icon(Icons.info_outline),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Support"),
                  leading: const Icon(Icons.help_outline_sharp),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: _listWidget[_currentSelected],
    );
  }
}

// Helper widget for network images
class _NetworkImage extends StatelessWidget {
  final String url;
  
  const _NetworkImage(this.url);
  
  get loadingBuilder => null;
  
  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingBuilder == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Icon(Icons.error));
      },
    );
  }
}