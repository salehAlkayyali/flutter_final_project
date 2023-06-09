import 'package:flutter/material.dart';
import 'getting_started.dart';

class OrderDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GettingStarted()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Image.asset(
                  'images/img3.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 80),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'ORDER ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Done',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: '!',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The ORDER has been sent. A technician will',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                'contact you.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GettingStarted(),
                      ),
                    );
                  },
                  child: Text(
                    'GO TO HOME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
