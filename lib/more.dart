import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testpro/profile.dart';
import 'getting_started.dart';
import 'item_details.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  final String text = 'More';
  String phoneNumber = '';
  int _selectedIndex = 3; // Set the initial selected index to 3 (More)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.blue,
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 60),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            OptionItem(
              text: 'Change Password',
              icon: Icons.lock,
            ),
            OptionItem(
              text: "FAQ's",
              icon: Icons.question_answer,
            ),
            OptionItem(
              text: 'About the Application',
              icon: Icons.info,
            ),
            OptionItem(
              text: 'Terms & Conditions',
              icon: Icons.description,
            ),
            OptionItem(
              text: 'Change the Password',
              icon: Icons.lock,
            ),
            OptionItem(
              text: 'Rate App',
              icon: Icons.star,
            ),
            OptionItem(
              text: 'Delete Account',
              icon: Icons.delete,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomPaint(
        painter: LinePainter(
          selectedIndex: _selectedIndex,
          iconCount: 4, // Replace with the actual number of icons in the BottomNavigationBar
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GettingStarted(),
                ),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetails(),
                ),
              );
            }
            else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
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

class OptionItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const OptionItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: Icon(Icons.navigate_next),
      onTap: () {
        // Handle option tap
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
