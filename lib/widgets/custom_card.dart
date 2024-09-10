import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String text1;
  final String text2;

  CustomCard({required this.text1, required this.text2});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjusted duration to fit your progress
    );

    _animation = Tween<double>(begin: 0, end: 0.66).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff387F39), // Card background color
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 80,
              width: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      value: _animation.value,
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff387F39)),
                      strokeWidth: 8.0,
                    ),
                  ),
                  Text(
                    "${(_animation.value * 100).toInt()}%",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text1,
                  style: TextStyle(
                      fontSize: 32,
                      color: Color(0xffF6E96B),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  widget.text2,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffBEDC74),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
