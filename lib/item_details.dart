import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testpro/profile.dart';
import 'getting_started.dart';
import 'more.dart';


class ItemDetails extends StatefulWidget {
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Card(
              child: _buildListItem('Order #${index + 1}', 'Order type: Carpenter', '2023-06-${index + 1}'),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.0);
          },
          itemCount: 6,
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
            setState(() {
              _selectedIndex = index;
            });
            if (index == 0) {
              Navigator.pushNamed(context, '/gettingstarted');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/profile');
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

  Widget _buildListItem(String orderNumber, String orderDate, String orderType) {
    return ListTile(
      title: Text(orderNumber),
      subtitle: Text(orderDate),
      trailing: Text(orderType),
    );
  }
}



