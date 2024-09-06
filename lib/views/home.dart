import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:summary_page/views/reward_screen.dart';

import '../provider/provider.dart';
import '../widgets/bottom_nav.dart'; // Custom Bottom Navigation Bar
import '../widgets/custom_card.dart';
import '../widgets/custom_card2.dart';
import '../widgets/reward_history.dart';
import 'history_screen.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = index; // Update TabController index
    });
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  // Function to claim reward and update providers
  void claimReward(String bookingName) {
    final rewardsSummaryNotifier = ref.read(rewardsSummaryProvider.notifier);
    final unclaimedBookings = ref.read(UnclaimedBookingProvider);
    final bookingHistoryNotifier = ref.read(bookingProvider.notifier);

    // Find the unclaimed booking by name
    final unclaimedBooking = unclaimedBookings.firstWhere(
      (booking) => booking["description"] == bookingName,
      orElse: () {
        // Show SnackBar if no booking is found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Booking not found for $bookingName'),
            duration: Duration(seconds: 2), // Duration of the SnackBar
          ),
        );
        return {}; // Return an empty map if not found
      },
    );

    if (unclaimedBooking.isNotEmpty) {
      // Parse the price to an integer
      final int price = int.parse(unclaimedBooking["price"]);

      // Update total rewards in the rewardsSummaryProvider
      // Update rewardsSummaryNotifier state
      rewardsSummaryNotifier.state = rewardsSummaryNotifier.state.copyWith(
        rewardsSummary: rewardsSummaryNotifier.state.rewardsSummary.copyWith(
          totalRewards:
              rewardsSummaryNotifier.state.rewardsSummary.totalRewards + price,
          currentBalance:
              rewardsSummaryNotifier.state.rewardsSummary.currentBalance +
                  price,
          // Add the booking to recent transactions
          recentTransactions: [
            ...rewardsSummaryNotifier.state.rewardsSummary.recentTransactions,
          ],
        ),
      );

// Show SnackBar after the state is updated
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully claimed $bookingName'),
          duration: Duration(seconds: 2), // Duration of the SnackBar
        ),
      );

      // Remove the claimed booking from UnclaimedBookingProvider
      // Implement a method to remove booking if necessary
      // Example: unclaimedBookingNotifier.removeBooking(bookingName);

      // Add the claimed booking to RewardHistory
      final formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      bookingHistoryNotifier.state = [
        ...bookingHistoryNotifier.state,
        {
          "description": unclaimedBooking["description"],
          "price": price,
          "date": formattedDate.toString(),
          "currency": unclaimedBooking["currency"],
        }
      ];
    }
  }

  final fixed = 5000;
  @override
  Widget build(BuildContext context) {
    final rewardsSummary = ref.watch(rewardsSummaryProvider);
    final bookings = ref.watch(bookingProvider);
    final unclaimedBookings = ref.watch(UnclaimedBookingProvider);
    var currentReward = rewardsSummary.rewardsSummary.totalRewards;

    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.black,
          title: Text(
            getGreeting(),
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "\$${fixed}",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    " Current Balance",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            // Home Page Content
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            rewardsSummary.user.name,
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: 150,
                        child: CustomCard(
                            text1: "\$${currentReward}",
                            text2: "Reward Balance")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            " Unclaimed Rewards ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: screenSize.height /
                          4, // Set the height for the slider
                      child: PageView.builder(
                        itemCount: unclaimedBookings.length,
                        controller: PageController(
                            viewportFraction: 0.8), // Adjust slider width
                        itemBuilder: (context, index) {
                          final booking = unclaimedBookings[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal:
                                    8.0), // Add padding between the items
                            child: CustomCard2(
                              text1: "\$${booking["price"]}",
                              text2: booking["date"],
                              press: () => claimReward(booking["description"]),
                              name: booking["description"],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Recent Transactions",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: screenSize.height / 4,
                      child: ListView.builder(
                          itemCount: bookings.length,
                          itemBuilder: (context, index) {
                            final booking = bookings[index];
                            return RewardHistory(
                              name: booking["description"],
                              amount: "\$${booking["price"]}",
                              date: booking["date"],
                              currency: booking["currency"],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            // Rewards Page Content
            RewardScreen(),
            // Profile Page Content
            Center(
                child: Text('Profile Page',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
            // History Page Content
            HistoryScreen(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: (int value) {},
        ),
      ),
    );
  }
}
