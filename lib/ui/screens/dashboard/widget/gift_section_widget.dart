import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hero_premier/ui/shared/asset_paths.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';

import 'gift_card.dart';

class GiftSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPaths.IC_BCK_GIFTREWARD),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(55, 0, 61, 0.85),
              Color.fromRGBO(55, 0, 61, 0.46),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Gift & Rewards",
                style: TextStyles.Heading4.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: "You can\nwin a",
                          style: TextStyles.Heading2.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            height: 2.0,
                          ),
                          children: [
                            TextSpan(
                              text: " gift\n",
                              style: TextStyles.Heading1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),

                            TextSpan(
                              text: "hamper\n",
                              style: TextStyles.Heading1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                            TextSpan(
                              text: "weekly",
                              style: TextStyles.Heading2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GiftCard(
                    isFull: false,
                    icon: AssetPaths.IC_GIFT,
                    points: "5200",
                    title: "Surprize Gifts",
                    descripion: "Hello, you can have a great surprize here",
                    buttonColor: Theme.of(context).accentColor,
                    fontColor: Theme.of(context).primaryColor,
                  ),
                  GiftCard(
                    isFull: false,
                    icon: AssetPaths.IC_DISCOUNT,
                    points: "8200",
                    title: "Discount Coupon",
                    descripion:
                        "Hello, get 50% discount coupon on Daraz shoppong.",
                    buttonColor: Theme.of(context).accentColor,
                    fontColor: Theme.of(context).primaryColor,
                  ),
                  GiftCard(
                    isFull: false,
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
            Center(
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "MORE",
                        style: TextStyles.Subtitle1.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
