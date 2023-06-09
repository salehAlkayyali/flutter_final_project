import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testpro/profile.dart';
import 'choice_card.dart';
import 'item_details.dart';
import 'more.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - (size.height * 0.2));
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - (size.height * 0.2));
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LinePainter extends CustomPainter {
  final int selectedIndex;
  final int iconCount;

  LinePainter({required this.selectedIndex, required this.iconCount});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;

    final iconWidth = size.width / iconCount;
    final lineStart = Offset(iconWidth * selectedIndex, 0);
    final lineEnd = Offset(iconWidth * (selectedIndex + 1), 0);

    canvas.drawLine(lineStart, lineEnd, paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}

class GettingStarted extends StatefulWidget {
  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  int _selectedIndex = 0;

  final List<String> serviceIcons = [
    'icons/ac.svg',
    'icons/lights.svg',
    'icons/water.svg',
    'icons/bugs.svg',
    'icons/cleans.svg',
    'icons/saw.svg',
    'icons/settingsLarge.svg',
    'icons/cleans.svg',
    'icons/saw.svg',
    'icons/ac.svg',
    'icons/lights.svg',
    'icons/water.svg',
  ];

  final List<String> serviceNames = [
    'AC',
    'Lights',
    'Water',
    'Bugs',
    'Cleans',
    'Saw',
    'Settings',
    'Cleans',
    'Saw',
    'AC',
    'Lights',
    'Water',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.blue,
              height: 270,
            ),
          ),
          Positioned(
            top: screenHeight * 0.06,
            right: screenHeight * 0.02,
            child: SvgPicture.asset(
              'icons/bell.svg',
              color: Colors.white,
              width: screenHeight * 0.04,
              height: screenHeight * 0.04,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
              left: MediaQuery.of(context).size.width * 0.4,
              right: MediaQuery.of(context).size.width * 0.2,
            ),
            child: Image(
              image: AssetImage('images/home.png'),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          Positioned(
            top: 110,
            left: screenHeight * 0.04,
            right: screenHeight * 0.04,
            child: Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 255),
            padding: EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.27),
                  child: Container(
                    width: 200, // Adjust the width as needed
                    child: Text(
                      'Select Service',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 15.0,
                        children: List.generate(serviceIcons.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChoiceCard(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 90,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Colors.pink[200]!,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 12),
                                      SvgPicture.asset(
                                        serviceIcons[index],
                                        width: 40.0,
                                        height: 40.0,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        serviceNames[index],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xE20130D2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomPaint(
        painter: LinePainter(
          selectedIndex: _selectedIndex,
          iconCount:
              4, // Replace with the actual number of icons in the BottomNavigationBar
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetails(),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => More(),
                ),
              );
            }
          },
          backgroundColor: Colors.lightBlueAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
