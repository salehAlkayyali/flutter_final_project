import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'getting_started.dart';
import 'item_details.dart';
import 'login_page.dart';
import 'more.dart';


class Option {
  final String title;
  final void Function()? onTap;
  final String? content;

  Option({
    required this.title,
    required this.onTap,
    this.content,
  });
}

class Profile extends StatelessWidget {
  final int _selectedIndex = 2; // Starting index for BottomNavigationBar

  final List<Option> options = [
    Option(title: "Language", onTap: () {}, content: "English"),
    Option(title: "My Rates", onTap: () {}),
    Option(title: "Contact us", onTap: () {}),
    Option(title: "Share App", onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: SvgPicture.asset(
                  'icons/ic_setting.svg',
                  color: Colors.white,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white,
                        width: 7.0,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('images/profile.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 120,
                      height: 120,
                    ),
                  ),
                  Positioned(
                    top: 133,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Saleh Alkayyali',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Gaza, Palestine',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.grey[100],
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    for (var option in options) ...[
                      nCard(
                        title: option.title,
                        content: option.content,
                        onTap: option.onTap,
                        haveContent: option.content != null,
                      ),
                    ],
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.brown,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              'SIGN OUT',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomPaint(
        painter: LinePainter(
          selectedIndex: _selectedIndex,
          iconCount: 4,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/gettingstarted');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/itemdetails');
            } else if (index == 3) {
              Navigator.pushNamed(context, '/more');
            }
          },
          backgroundColor: Colors.lightBlueAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'icons/home.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'icons/receipt.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'icons/user.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'icons/more.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}

class nCard extends StatelessWidget {
  final String title;
  final String? content;
  final void Function()? onTap;
  final bool haveContent;

  const nCard({
    Key? key,
    required this.title,
    this.content,
    this.onTap,
    this.haveContent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Add top padding of 10
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            if (haveContent) ...[
              Spacer(),
              Text(
                content!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
            ],
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}



