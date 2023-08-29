import 'package:flutter/material.dart';
import 'package:capstone_project/route/route.dart' as route;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animations/animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const FlutterLogo(
            size: 54,
          ),
          Text('Flutter dev'),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              })
        ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color.fromARGB(255, 2, 47, 84),
              ]),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 280.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
              ),
              items: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    border: Border.all(color: Colors.blue.withOpacity(0.5)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/business.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  width: 420,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    border: Border.all(color: Colors.blue.withOpacity(0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 15,
                        blurRadius: 17,
                        offset: Offset(0, 7),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/download.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                                'When you get here, you understand.',
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                ),
                                speed: const Duration(milliseconds: 200)),
                          ],
                          totalRepeatCount: 4,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: false,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    border: Border.all(color: Colors.blue.withOpacity(0.5)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/business.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    border: Border.all(color: Colors.blue.withOpacity(0.5)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/engineer.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    border: Border.all(color: Colors.blue.withOpacity(0.5)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/software.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      Icon(Icons.home, size: (36)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Home Page',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, route.home),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      Icon(Icons.pages_rounded, size: (36)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'About Us',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, route.aboutUs),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      Icon(Icons.contact_page, size: (36)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, route.contactUs),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      Icon(Icons.contact_page, size: (36)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, route.contactUs),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      Icon(Icons.contact_page, size: (36)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, route.contactUs),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.lightBlue,
                title: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text('Leave a Message',
                        style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                ),
                content: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(9)
                          ],
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            icon: Icon(Icons.account_box),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
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

void showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text('OK'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('Info'),
    content: Text(
        "This app was developed in the Mobile Application course.  It connects to a Firebase back-end and uses Firebase Auth for authentication."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
