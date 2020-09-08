import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/dashboard/widget/gift_card.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
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
        ),
      ),
    );
  }
}
