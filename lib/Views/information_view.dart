import 'package:covid19_virus_tracker/Theme/colors.dart';
import 'package:covid19_virus_tracker/ViewModels/information_view_model.dart';
import 'package:covid19_virus_tracker/Views/Widgets/information_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:stacked/stacked.dart';

class InformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    // final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return ViewModelBuilder<InformationViewModel>.reactive(
      viewModelBuilder: () => InformationViewModel(),
      builder: (BuildContext context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: <Widget>[
                  InformationTitleCard(
                    url: model.url1,
                    icon: LineIcons.share_alt,
                    iconColor: CardColors.blue,
                    subTitle: 'Learn how Covid-19 spread',
                    title: 'How it Spreads?',
                  ),
                  SizedBox(height: hp(3)),
                  InformationTitleCard(
                    url: model.url2,
                    icon: LineIcons.warning,
                    iconColor: CardColors.cyan,
                    subTitle: 'Learn Covid-19 symptoms',
                    title: 'Symptoms',
                  ),
                  SizedBox(height: hp(3)),
                  InformationTitleCard(
                    url: model.url3,
                    icon: LineIcons.heartbeat,
                    iconColor: CardColors.red,
                    subTitle: 'Learn Covid-19 treatments',
                    title: 'Prevention & treatment',
                  ),
                  SizedBox(height: hp(3)),
                  InformationTitleCard(
                    url: model.url4,
                    icon: LineIcons.question_circle,
                    iconColor: CardColors.green,
                    subTitle: 'What to do if you get the virus',
                    title: 'What to do',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
