import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/model.dart'; // Import your RewardsSummary model

// Define a RewardsSummaryNotifier to handle state changes
class RewardsSummaryNotifier extends StateNotifier<RewardsSummary> {
  RewardsSummaryNotifier() : super(_initialRewardsSummary());

  // Function to initialize RewardsSummary from JSON
  static RewardsSummary _initialRewardsSummary() {
    const jsonData = """
    {
      "user": {
        "name": "Ade Ngozi A.",
        "profileImage": "https://example.com/profile.jpg"
      },
      "rewardsSummary": {
        "totalRewards": 1500,
        "currentBalance": 5000,
        "rewardPoints": 300,
        "recentTransactions": [
          {
            "date": "2024-09-01",
            "description": "Reward earned from purchase",
            "amount": 100
          },
          {
            "date": "2024-08-30",
            "description": "Reward redemption",
            "amount": -50
          }
        ]
      },
      "bookings": [
        {
          "date": "2024-09-10",
          "description": "Hotel booking",
          "price": 250,
          "currency": "USD"
        },
        {
          "date": "2024-09-15",
          "description": "Flight booking",
          "price": 450,
          "currency": "USD"
        },
        {
          "date": "2024-09-20",
          "description": "Car rental",
          "price": 100,
          "currency": "USD"
        }
      ]
    }""";

    final parsedJson = jsonDecode(jsonData);
    return RewardsSummary.fromJson(parsedJson);
  }

  // Function to claim a reward
  void claimReward(int amount, Map<String, dynamic> booking) {
    state = state.copyWith(
      rewardsSummary: state.rewardsSummary.copyWith(
        totalRewards: state.rewardsSummary.totalRewards + amount,
        currentBalance: state.rewardsSummary.currentBalance + amount,
        recentTransactions: [
          ...state.rewardsSummary.recentTransactions,
          Transaction(
            date: booking["date"],
            description: booking["description"],
            amount: amount,
          ),
        ],
      ),
    );
  }
}

// RewardsSummaryProvider as a StateNotifierProvider
final rewardsSummaryProvider =
    StateNotifierProvider<RewardsSummaryNotifier, RewardsSummary>((ref) {
  return RewardsSummaryNotifier();
});

// Create BookingNotifier for regular bookings
class BookingNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  BookingNotifier()
      : super([
          {
            "date": "2024-09-10",
            "description": "Hotel booking",
            "price": "250",
            "currency": "USD"
          },
          {
            "date": "2024-09-15",
            "description": "Flight booking",
            "price": "450",
            "currency": "USD"
          },
          {
            "date": "2024-09-20",
            "description": "Car rental",
            "price": "100",
            "currency": "USD"
          }
        ]);

  // Function to add a booking
  void addBooking(Map<String, dynamic> booking) {
    state = [...state, booking];
  }
}

// Provide BookingNotifier as a StateNotifierProvider
final bookingProvider =
    StateNotifierProvider<BookingNotifier, List<Map<String, dynamic>>>((ref) {
  return BookingNotifier();
});

// Create UnclaimedBookingNotifier for unclaimed bookings
class UnclaimedBookingNotifier
    extends StateNotifier<List<Map<String, dynamic>>> {
  UnclaimedBookingNotifier()
      : super([
          {
            "date": "2024-09-10",
            "description": "Hotel booking",
            "price": "250",
            "currency": "USD"
          },
          {
            "date": "2024-09-15",
            "description": "Flight booking",
            "price": "450",
            "currency": "USD"
          },
          {
            "date": "2024-09-20",
            "description": "Car rental",
            "price": "100",
            "currency": "USD"
          },
          {
            "date": "2024-09-22",
            "description": "Restaurant reservation",
            "price": "75",
            "currency": "USD"
          },
          {
            "date": "2024-09-25",
            "description": "Spa appointment",
            "price": "120",
            "currency": "USD"
          },
          {
            "date": "2024-09-30",
            "description": "Theater tickets",
            "price": "60",
            "currency": "USD"
          },
          {
            "date": "2024-10-02",
            "description": "Museum entrance fee",
            "price": "40",
            "currency": "USD"
          },
          {
            "date": "2024-10-05",
            "description": "Concert tickets",
            "price": "150",
            "currency": "USD"
          },
          {
            "date": "2024-10-07",
            "description": "Guided tour",
            "price": "200",
            "currency": "USD"
          },
          {
            "date": "2024-10-10",
            "description": "Cooking class",
            "price": "85",
            "currency": "USD"
          },
          {
            "date": "2024-10-12",
            "description": "Bike rental",
            "price": "25",
            "currency": "USD"
          },
          {
            "date": "2024-10-15",
            "description": "Cruise booking",
            "price": "600",
            "currency": "USD"
          },
          {
            "date": "2024-10-18",
            "description": "Golf course booking",
            "price": "90",
            "currency": "USD"
          },
          {
            "date": "2024-10-20",
            "description": "Scuba diving lesson",
            "price": "130",
            "currency": "USD"
          },
          {
            "date": "2024-10-22",
            "description": "Zip-lining adventure",
            "price": "110",
            "currency": "USD"
          },
          {
            "date": "2024-10-25",
            "description": "Wine tasting tour",
            "price": "160",
            "currency": "USD"
          },
          {
            "date": "2024-10-27",
            "description": "Hot air balloon ride",
            "price": "250",
            "currency": "USD"
          },
          {
            "date": "2024-10-30",
            "description": "Horseback riding",
            "price": "80",
            "currency": "USD"
          },
          {
            "date": "2024-11-02",
            "description": "Fishing trip",
            "price": "70",
            "currency": "USD"
          },
          {
            "date": "2024-11-05",
            "description": "Ski pass",
            "price": "300",
            "currency": "USD"
          },
          {
            "date": "2024-11-07",
            "description": "Paragliding experience",
            "price": "180",
            "currency": "USD"
          }
        ]);

  // Function to remove a booking after it's claimed
  void removeBooking(String description) {
    state = state
        .where((booking) => booking['description'] != description)
        .toList();
  }
}

// Provide UnclaimedBookingNotifier as a StateNotifierProvider
final UnclaimedBookingProvider =
    StateNotifierProvider<UnclaimedBookingNotifier, List<Map<String, dynamic>>>(
        (ref) {
  return UnclaimedBookingNotifier();
});
