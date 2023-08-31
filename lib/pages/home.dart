import 'package:flutter/material.dart';
import 'package:capstone_project/route/route.dart' as route;
import 'package:timeago/timeago.dart' as timeago;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animations/animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Create a Firestore instance
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Reference to the 'guests' collection in Firestore
  CollectionReference guests = FirebaseFirestore.instance.collection('guests');

  //Conrollers to manage user input for guest name and message
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  //Dispose of the controllers when the widget is disposed.
  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  //Adds a new guest name and post to the 'guests' collection.
  Future<void> addGuestPost() async {
    db
        .collection('guests')
        .add({
          'guest_name': myController1.text,
          'message': myController2.text,
          'created': DateTime.now(),
        })
        .then((value) => print("Guest & message added."))
        .catchError((error) => print("Failed add guest & message: $error"));
  }

  //Retrieve guest posts from the 'guests' collection
  Future<void> getGuestPosts() async {
    db.collection("guests").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  // Set initial opacity level to 1.0
  double opacityLevel = 1.0;

  // Toggle the opacity level between 1.0 and 0.0
  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    //Get the screen dimensions
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

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
            if (sizeHeight > 800)
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
            if (sizeHeight > 800)
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.blue,
                      blurRadius: 2,
                      offset: Offset(1.0, 1.0))
                ]),
                height: 40,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.history_edu,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(width: 12),
                  Text('RDP Guestbook',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ))
                ]),
              ),
            Center(
              child: Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('guests')
                      .orderBy('created', descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading...");
                    }
                    return Scrollbar(
                      thumbVisibility: true,
                      thickness: 8,
                      radius: Radius.circular(23),
                      child: SizedBox(
                        height: 401,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;

                            final firestoreTimestamp =
                                data['created'] as Timestamp;
                            final dataTime = firestoreTimestamp.toDate();
                            final timeAgo =
                                timeago.format(dataTime, locale: 'en_short');

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                  leading: Text('↪' + ' ' + data['guest_name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20)),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(data['message'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            background: Paint()
                                              ..color =
                                                  Colors.blue.withOpacity(0.3)
                                              ..strokeWidth = 30
                                              ..style = PaintingStyle.stroke
                                              ..strokeJoin = StrokeJoin.round
                                              ..strokeCap = StrokeCap.round,
                                          )),
                                      Icon(
                                        Icons.format_quote,
                                        size: 34,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                  trailing: Text(timeAgo,
                                      style: TextStyle(color: Colors.white))),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(9)
                              ],
                              controller: myController1,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            SizedBox(height: 50),
                            TextFormField(
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(18)
                              ],
                              maxLines: 8,
                              controller: myController2,
                              decoration: InputDecoration(
                                labelText: 'Message',
                                icon: Icon(Icons.message),
                                border: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          addGuestPost();
                          myController1.clear();
                          myController2.clear();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Message sent to the database!'),
                          ));
                        })
                  ]);
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
            // Callback function when a navigation item is tapped
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
