import 'package:flutter/material.dart';
import 'package:testpro/start_three.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.9, // Adjust the scale value as needed
                    child: Image.asset(
                      'images/img2.png',
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Fast reservation with technicians',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'and craftsmen',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: Container(

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/screen3'); // Use route name instead of MaterialPageRoute
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            // Added spacing for button
          ],
        ),
      ),
    );
  }
}
