class RewardsSummary {
  final User user;
  final RewardsSummaryDetails rewardsSummary;

  RewardsSummary({
    required this.user,
    required this.rewardsSummary,
  });

  // copyWith method
  RewardsSummary copyWith({
    User? user,
    RewardsSummaryDetails? rewardsSummary,
  }) {
    return RewardsSummary(
      user: user ?? this.user,
      rewardsSummary: rewardsSummary ?? this.rewardsSummary,
    );
  }

  factory RewardsSummary.fromJson(Map<String, dynamic> json) {
    return RewardsSummary(
      user: User.fromJson(json['user']),
      rewardsSummary: RewardsSummaryDetails.fromJson(json['rewardsSummary']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'rewardsSummary': rewardsSummary.toJson(),
    };
  }
}

class User {
  final String name;
  final String profileImage;

  User({required this.name, required this.profileImage});

  // copyWith method
  User copyWith({
    String? name,
    String? profileImage,
  }) {
    return User(
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profileImage': profileImage,
    };
  }
}

class RewardsSummaryDetails {
  final int totalRewards;
  final int rewardPoints;
  final int currentBalance;
  final List<Transaction> recentTransactions;

  RewardsSummaryDetails({
    required this.currentBalance,
    required this.totalRewards,
    required this.rewardPoints,
    required this.recentTransactions,
  });

  // copyWith method
  RewardsSummaryDetails copyWith({
    int? totalRewards,
    int? rewardPoints,
    int? currentBalance,
    List<Transaction>? recentTransactions,
  }) {
    return RewardsSummaryDetails(
      totalRewards: totalRewards ?? this.totalRewards,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      currentBalance: currentBalance ?? this.currentBalance,
      recentTransactions: recentTransactions ?? this.recentTransactions,
    );
  }

  factory RewardsSummaryDetails.fromJson(Map<String, dynamic> json) {
    var list = json['recentTransactions'] as List;
    List<Transaction> transactionsList =
        list.map((i) => Transaction.fromJson(i)).toList();

    return RewardsSummaryDetails(
      currentBalance: json['currentBalance'],
      totalRewards: json['totalRewards'],
      rewardPoints: json['rewardPoints'],
      recentTransactions: transactionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalRewards': totalRewards,
      'rewardPoints': rewardPoints,
      'currentBalance': currentBalance,
      'recentTransactions': recentTransactions.map((i) => i.toJson()).toList(),
    };
  }
}

class Transaction {
  final String date;
  final String description;
  final int amount;

  Transaction({
    required this.date,
    required this.description,
    required this.amount,
  });

  // copyWith method
  Transaction copyWith({
    String? date,
    String? description,
    int? amount,
  }) {
    return Transaction(
      date: date ?? this.date,
      description: description ?? this.description,
      amount: amount ?? this.amount,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      date: json['date'],
      description: json['description'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'description': description,
      'amount': amount,
    };
  }
}

class Booking {
  final String date;
  final String description;
  final double price;
  final String currency;

  Booking({
    required this.date,
    required this.description,
    required this.price,
    required this.currency,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      date: json['date'],
      description: json['description'],
      price: json['price'].toDouble(),
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'description': description,
      'price': price,
      'currency': currency,
    };
  }
}

// Method to convert a list of bookings from JSON
List<Booking> bookingsFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => Booking.fromJson(json)).toList();
}

// Method to convert a list of bookings to JSON
List<Map<String, dynamic>> bookingsToJson(List<Booking> bookings) {
  return bookings.map((booking) => booking.toJson()).toList();
}
