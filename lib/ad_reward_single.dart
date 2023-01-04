// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'dart:io';

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   MobileAds.instance.initialize();
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(),
// //       //home: const MyHomePage(title: 'AdMob Demo'),
// //     );
// //   }
// // }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   static final AdRequest request = AdRequest();
//   int maxFailedLoadAttempts = 3;
//   RewardedAd? _rewardedAd;
//   int _numRewardedLoadAttempts = 0;

//   @override
//   void initState() {
//     super.initState();
//     _createRewardedAd();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _rewardedAd?.dispose();
//   }

//   String get rewardedAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-3940256099942544/8673189370';
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-3940256099942544/7552160883';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }

//   void _createRewardedAd() {
//     RewardedAd.load(
//         adUnitId: rewardedAdUnitId,
//         request: request,
//         rewardedAdLoadCallback: RewardedAdLoadCallback(
//           onAdLoaded: (RewardedAd ad) {
//             debugPrint('$ad loaded.');
//             _rewardedAd = ad;
//             _numRewardedLoadAttempts = 0;
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             debugPrint('RewardedAd failed to load: $error');
//             _rewardedAd = null;
//             _numRewardedLoadAttempts += 1;
//             if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
//               _createRewardedAd();
//             }
//           },
//         ));
//   }

//   void _showRewardedAd() {
//     if (_rewardedAd == null) {
//       debugPrint('Warning: attempt to show rewarded before loaded.');
//       return;
//     }
//     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd ad) =>
//           debugPrint('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedAd ad) {
//         debugPrint('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         _createRewardedAd();
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//         debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         _createRewardedAd();
//       },
//     );

//     _rewardedAd!.setImmersiveMode(true);
//     _rewardedAd!
//         .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
//     _rewardedAd = null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AdMob Demo'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     _showRewardedAd();
//                   },
//                   child: const Text(
//                     ' RewardedAd',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
