import 'package:flutter/material.dart';
import 'chapters/chapter1.dart';
import 'chapters/chapter10.dart';
import 'chapters/chapter2.dart';
import 'chapters/chapter3.dart';
import 'chapters/chapter4.dart';
import 'chapters/chapter5.dart';
import 'chapters/chapter6.dart';
import 'chapters/chapter7.dart';
import 'chapters/chapter8.dart';
import 'chapters/chapter9.dart';
import 'chapters/chapter11.dart';
import 'home.dart';
import 'my_shared_preferences.dart'; // Import the MySharedPreferences class
import 'chapter_screen.dart'; // Import the ChapterScreen class

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) >
                Duration(seconds: 4)) {
          // Show snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tap again to exit'),
              duration: Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
            ),
          );

          // Update the currentBackPressTime
          currentBackPressTime = DateTime.now();

          // Return false to prevent exiting
          return false;
        }

        // Allow exiting
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Home'),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) async {
                if (value == 'signOut') {
                  // Add your sign-out logic here
                  print('Signing out...');

                  // Clear user details from shared preferences on sign out
                  await MySharedPreferences.setUserEmail('');
                  await MySharedPreferences.setFirstTime(true);
                  await MySharedPreferences.setHasVisitedHomePage(false);

                  Navigator.pop(context); // Pop current screen
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'signOut',
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildCard(
                name: 'Audio Version',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 1',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter1.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 2',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter2.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 3',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter3.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 4',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter4.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 5',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter5.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 6',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter6.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 7',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter7.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 8',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter8.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Chapter 9',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter9.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'About the Book',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter10.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
              buildCard(
                name: 'Possible Questions \nwith Answers',
                color: Colors.white,
                onTap: () async {
                  String? userEmail = await MySharedPreferences.getUserEmail();
                  await MySharedPreferences.setUserEmail(userEmail ?? '');
                  await MySharedPreferences.setHasVisitedHomePage(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterScreen(
                        chapterContent: Chapter11.getTextContent(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required String name,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
