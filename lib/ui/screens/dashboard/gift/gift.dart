import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/dashboard/widget/gift_card.dart';
import 'package:hero_premier/ui/screens/leaderboard/widgets/reward_card.dart';

import '../../../shared/asset_paths.dart';

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        giftWidget(),
        rewardWidget(),
      ],
    );
  }

  Widget giftWidget() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        GiftCard(
          icon: AssetPaths.IC_GIFT,
          points: "5200",
          title: "Surprize Gifts",
          descripion: "Hello, you can have a great surprize here",
          buttonColor: Theme.of(context).accentColor,
          fontColor: Theme.of(context).primaryColor,
        ),
        GiftCard(
          icon: AssetPaths.IC_DISCOUNT,
          points: "8200",
          title: "Discount Coupon",
          descripion: "Hello, get 50% discount coupon on Daraz shoppong.",
          buttonColor: Theme.of(context).accentColor,
          fontColor: Theme.of(context).primaryColor,
        ),
        GiftCard(
          icon: AssetPaths.IC_TICKETS,
          points: "9000",
          title: "Flight Tickets",
          descripion:
              "Get round trip flight ticket from Kathmandu to Pokhara and return",
          buttonColor: Theme.of(context).accentColor,
          fontColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget rewardWidget() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        RewardCardWidget(
          position: "1st",
          backgroundColor: Color(0xFFFFDE46),
          backgroundImgUrl: AssetPaths.IC_BACKGROUND_REWARD,
          icon: AssetPaths.IC_FIRST_MEDAL,
          title: "50K Cash prize for the winner",
          descripion:
              "Hello, winner first of leaderboard get 50,000 cash in hand gift",
          fontColor: Color(0xFF121212),
          buttonColor: Color(0xFFCEB648),
        ),
        RewardCardWidget(
          position: "2nd",
          backgroundColor: Color(0xFF75C5F2),
          backgroundImgUrl: AssetPaths.IC_BACKGROUND_REWARD,
          icon: AssetPaths.IC_SECOND_MEDAL,
          title: "30K Cash prize for the winner",
          descripion:
              "Hello, winner first of leaderboard get 30,000 cash in hand gift",
          fontColor: Color(0xFF121212),
          buttonColor: Color(0xFFA7D2D7),
        ),
        RewardCardWidget(
          position: "3rd",
          backgroundColor: Color(0xFFAC862F),
          backgroundImgUrl: AssetPaths.IC_BACKGROUND_REWARD,
          icon: AssetPaths.IC_THIRD_MEDAL,
          title: "20K Cash prize for the winner",
          descripion:
              "Hello, winner first of leaderboard get 20,000 cash in hand gift",
          fontColor: Color(0xFFFFFFFF),
          buttonColor: Color(0xFFC9A85C),
        )
      ],
    );
  }
}
