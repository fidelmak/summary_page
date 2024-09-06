import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/provider.dart';
import '../widgets/custom_card2.dart';

class RewardScreen extends ConsumerStatefulWidget {
  const RewardScreen({super.key});

  @override
  ConsumerState<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends ConsumerState<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    final unC =
        ref.watch(UnclaimedBookingProvider); // Fetch bookings from provider
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView.builder(
        itemCount: unC.length, // Number of bookings
        itemBuilder: (context, index) {
          return ActiveRewards(
            screenSize: screenSize,
            booking: unC[index], // Pass each booking dynamically
          );
        },
      ),
    );
  }
}

class ActiveRewards extends StatelessWidget {
  const ActiveRewards({
    super.key,
    required this.screenSize,
    required this.booking, // Pass the booking data
  });

  final Size screenSize;
  final Map booking; // Define booking as a Map to access each booking's details

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: screenSize.height / 4,
              width: screenSize.width / 2,
              child: CustomCard2(
                text1: "Days",
                text2: "Remaining",
                press: () {}, // Define action for button press
                name: booking["description"], // Access booking description
              ),
            ),
          ),
        ],
      ),
    );
  }
}
