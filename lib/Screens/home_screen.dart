import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/Screens/agent_profile_screen.dart';
import 'package:house_rent/Screens/front_screen.dart';
import 'package:house_rent/Screens/search_result_screen.dart';
import 'package:house_rent/Screens/signup_screen.dart';
import 'package:house_rent/Screens/super_admin_screen.dart';
import 'package:house_rent/module/user_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _currentTab = 0;
  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String currentUserId = Provider.of<UserData>(context).currentUserId;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          // FeedsTestingScreen(currentUser: currentUserId,
          //   userId: currentUserId,),

          FrontScreen(
            currentUserId: currentUserId,
          ),
          SearchResultScreen(),
          SuperAdminScreen(),
          AgentProfileScreen(
            currentUserId: currentUserId,
          ),
          SignupScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Colors.black87,
          currentIndex: _currentTab,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            _pageController.animateToPage(index,
                duration: Duration(microseconds: 200), curve: Curves.easeIn);
          },
          activeColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icon1.png',
                width: 32,
                height: 32,
              ),
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
              'assets/images/icon2.png',
              width: 32,
              height: 32,
            )),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icon 3.png',
                width: 32,
                height: 32,
              ),
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
              'assets/images/icon 4.png',
              width: 32,
              height: 32,
            )),
            BottomNavigationBarItem(
                icon: Image.asset(
              'assets/images/icon 5.png',
              width: 32,
              height: 32,
            )),
          ]),
    );
  }
}
