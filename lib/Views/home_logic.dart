import 'package:covid19_virus_tracker/Views/home_view.dart';
import 'package:covid19_virus_tracker/Views/information_view.dart';
import 'package:covid19_virus_tracker/Views/news_view.dart';
import 'package:covid19_virus_tracker/Views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeLogic extends StatefulWidget {
  @override
  _HomeLogicState createState() => _HomeLogicState();
}

class _HomeLogicState extends State<HomeLogic> {
  @override
  void initState() {
    print("hello world");
    super.initState();
  }

  void addPostFrameCallBack(FrameCallBack callBack) {}
  int selectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  void pageChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // void bottomTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //     pageController.animateToPage(index,
  //         duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Text(
                    "Covid-19",
                    style: GoogleFonts.cabin(
                        textStyle: TextStyle(
                      fontSize: 21,
                      color: Color(0xff989CAC),
                    )),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Tracker",
                    style: GoogleFonts.cabin(
                        textStyle: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (int index) {
                  pageChange(index);
                },
                controller: pageController,
                children: <Widget>[
                  HomeView(),
                  NewsView(),
                  InformationView(),
                  SettingsView()
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]
              // Box Shadow
              ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10).add(EdgeInsets.only(top: 5)),
            child: GNav(
              gap: 10,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.white,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: "Home",
                  backgroundColor: Colors.red,
                ),
                GButton(
                    icon: LineIcons.newspaper_o,
                    text: "News",
                    backgroundColor: Colors.cyan),
                GButton(
                  icon: LineIcons.list_ul,
                  text: "Guides",
                  backgroundColor: Colors.green,
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: "Setttings",
                  backgroundColor: Colors.green,
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  pageController.jumpToPage(index);
                });
              },
            ),
          )),
        ),
      ),
    );
  }
}

mixin FrameCallBack {}
