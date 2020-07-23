import 'dart:math';

import 'package:arklevelcalculator/screens/input_page.dart';
import 'package:arklevelcalculator/screens/recruit_page.dart';
import 'package:flutter/material.dart';
import 'package:arklevelcalculator/constants.dart';
import 'package:arklevelcalculator/components/reusabke_square_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:arklevelcalculator/components/icon_content.dart';
import 'package:firebase_admob/firebase_admob.dart';

enum Category {
  male,
  female,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Category selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  BannerAd myBanner;

  @override
  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    myBanner = buildBannerAd()..load();
    //myBanner = buildLargeBannerAd()..load();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARKNIGHTS CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableSquareCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Category.male;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InputPage(),
                          ),
                        );
                      });
                    },
                    colour: selectedGender == Category.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.bitcoin,
                      label: 'LEVEL UP COST',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableSquareCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Category.female;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecruitPage(),
                          ),
                        );
                      });
                    },
                    colour: selectedGender == Category.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.drupal,
                      label: 'RECRUITMENT',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-3011015245125336/7942810951',
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner..show();
          }
        });
  }

  BannerAd buildLargeBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-3011015245125336/7942810951',
        //BannerAd.testAdUnitId,
        size: AdSize.largeBanner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner
              ..show(
                  anchorType: AnchorType.top,
                  anchorOffset: MediaQuery.of(context).size.height * 0.15);
          }
        });
  }
}
