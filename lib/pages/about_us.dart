import 'package:flutter/material.dart';
import 'package:capstone_project/route/route.dart' as route;

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us')),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pageview, color: Colors.white),
              label: 'About Us',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pageview, color: Colors.white),
              label: 'Contact Us',
            ),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, route.home);
                break;
              case 1:
                Navigator.pushNamed(context, route.aboutUs);
                break;
              case 2:
                Navigator.pushNamed(context, route.contactUs);
                break;
              default:
                break;
            }
          }),
    );
  }
}
