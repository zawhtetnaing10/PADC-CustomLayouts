import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_components/utils/colors.dart';
import 'package:flutter_custom_components/utils/constants.dart';
import 'package:flutter_custom_components/utils/dimens.dart';
import 'package:flutter_custom_components/utils/images.dart';

class CustomLayout extends StatefulWidget {
  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  Formations formation = Formations.FOUR_FOUR_TWO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FootballPitchBackgroundView(),
          FormationView(formation: this.formation),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            formation =
                Formations.values[Random().nextInt(Formations.values.length)];
          });
        },
      ),
    );
  }
}

class FormationView extends StatelessWidget {
  final Formations formation;

  FormationView({required this.formation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _generateFormation(formation),
    );
  }

  Widget _generateFormation(Formations formation) {
    switch (formation) {
      case Formations.FOUR_FOUR_TWO:
        return FormationViewFourFourTwo();
      case Formations.FOUR_TWO_THREE_ONE:
        return FormationViewFourTwoThreeOne();
      case Formations.FOUR_THREE_THREE:
        return FormationFourThreeThree();
      case Formations.THREE_FOUR_THREE:
        return FormationThreeFourThree();
    }
  }
}

class FormationViewFourFourTwo extends StatelessWidget {
  const FormationViewFourFourTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          PlayerView(
            isGoalKeeper: true,
          ),
        ],
      ),
    );
  }
}

class FormationViewFourTwoThreeOne extends StatelessWidget {
  const FormationViewFourTwoThreeOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          PlayerView(
            isGoalKeeper: false,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          PlayerView(
            isGoalKeeper: true,
          ),
        ],
      ),
    );
  }
}

class FormationFourThreeThree extends StatelessWidget {
  const FormationFourThreeThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          PlayerView(
            isGoalKeeper: true,
          ),
        ],
      ),
    );
  }
}

class FormationThreeFourThree extends StatelessWidget {
  const FormationThreeFourThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          PlayerView(
            isGoalKeeper: true,
          ),
        ],
      ),
    );
  }
}

class PlayerView extends StatelessWidget {
  final bool isGoalKeeper;

  PlayerView({this.isGoalKeeper = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: MARGIN_XLARGE,
          height: MARGIN_XLARGE,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              MARGIN_MEDIUM_2,
            ),
            color: (isGoalKeeper) ? Colors.yellow : CHELSEA_BLUE_COLOR,
          ),
        ),
      ),
    );
  }
}

class FootballPitchBackgroundView extends StatelessWidget {
  const FootballPitchBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        IMG_FOOTBALL_PITCH,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
