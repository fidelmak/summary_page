import 'package:flutter/material.dart';

class RewardHistory extends StatelessWidget {
  final String name;
  final String currency;
  final String amount;
  final String date;
  const RewardHistory({
    super.key,
    required this.name,
    required this.amount,
    required this.date,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(18),
            ),
            height: 50,
            width: 50,
            child: ClipRect(
              child: Image.asset(
                'assets/images/cash.jpeg',
                fit: BoxFit.cover, // To ensure the image fits the container
              ),
            ),
          ),
          title: Text(name),
          subtitle: Text(amount),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(date,
                  style: TextStyle(fontSize: 16, color: Color(0xff387F39))),
              SizedBox(height: 4), // Space between the texts
              Text(currency,
                  style: TextStyle(color: Color(0xffA2CA71), fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
