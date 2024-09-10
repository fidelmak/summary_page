import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {
  final String text1;
  final String text2;
  final String name;
  final VoidCallback press;

  CustomCard2({
    required this.text1,
    required this.text2,
    required this.press,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Card background color
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  height: 50,
                  width: 50,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/money.jpeg',
                      fit: BoxFit.cover, // Ensure the image fits the container
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff387F39),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      text2,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff387F39),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Color(0xff387F39),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff387F39),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: press,
                child: Center(
                  child: Text(
                    "Claim",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
