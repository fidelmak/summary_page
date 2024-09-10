

# Summary App

The **Summary App** is a rewards tracking application where users can manage unclaimed rewards, view transaction history, and monitor their total rewards in real-time. Built using Flutter and Riverpod for state management, this app allows users to claim rewards and view them in their reward history.

## Features

- **Claim Rewards**: Users can claim unclaimed rewards, which updates their total rewards and adds the claimed reward to the transaction history.
- **Rewards Summary**: A display of the user's current balance and total rewards earned.
- **Reward History**: Users can view a list of recent transactions, showing all rewards they’ve claimed.
- **Responsive Design**: Optimized for mobile devices using Flutter's `ScreenUtil` for responsive layouts.
- **Snackbars**: Instant feedback is provided when users successfully claim rewards using Snackbars.


## Download App (APK) version here 
[Download APK](https://drive.google.com/file/d/1HmpWq4Uy8FpVb6uOp7beMd7rn84S7keL/view?usp=sharing)

## Installation

To run this app locally, follow these steps:

### Prerequisites

- Flutter SDK (v3.0 or later)
- Dart (v2.18 or later)
- IDE (VS Code, Android Studio, etc.)
- Android/iOS emulator or a physical device

### Steps

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/summary-app.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd summary-app
   ```

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Run the app**:

    - On an Android or iOS emulator:

      ```bash
      flutter run
      ```

    - On a connected physical device:

      ```bash
      flutter run --release
      ```

## Project Structure

```
lib/
│
├── models/           # Data models (Booking, RewardsSummary, etc.)
├── provider/         # Riverpod providers for state management
├── views/            # UI screens (Home, Reward History, etc.)
├── widgets/          # Reusable widgets (CustomCard, CustomCard2, etc.)
└── main.dart         # Main entry point of the app
```

## Key Features

### 1. Home Screen

The home screen shows the user's name, current reward balance, and a list of unclaimed rewards. Users can claim rewards by tapping on them.

### 2. Reward History

This screen displays a detailed list of claimed rewards (transactions), including the description, price, and date.

### 3. Providers

The app uses Riverpod for state management, which keeps the application data flow reactive and optimized. Key providers include:

- **RewardsSummaryProvider**: Manages the total rewards and current balance.
- **UnclaimedBookingProvider**: Stores unclaimed rewards for users to interact with.
- **BookingProvider**: Tracks the history of all claimed rewards.

## Dependencies

- **Flutter Riverpod**: State management library.
- **ScreenUtil**: For responsive layout design.
- **Google Fonts**: Custom fonts.
- **Flushbar**: For custom snackbars.

## Custom Widgets

- **CustomCard**: Displays reward balance and unclaimed rewards.
- **CustomCard2**: Interactive card widget used for showing unclaimed rewards.

## How It Works

1. **Claim Rewards**: Users tap on unclaimed rewards, and the app updates the state, increasing the total rewards, and moving the claimed reward to the history section.
2. **Snackbar Feedback**: A snackbar provides immediate feedback to the user upon successful reward claim.
3. **Persisting Data**: The app stores reward transactions in the `RewardHistory` widget, ensuring that claimed rewards are displayed accurately.

## Future Improvements

- **User Authentication**: Implement Firebase authentication for secure login and personalized rewards.
- **Push Notifications**: Notify users when new rewards become available.
- **Enhanced Transaction History**: Add filters for users to sort or search their claimed rewards.

## Contributions

Contributions are welcome! Feel free to submit a pull request or file an issue if you find any bugs or want to suggest an improvement.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

