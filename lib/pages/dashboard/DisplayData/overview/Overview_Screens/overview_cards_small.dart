import 'package:flutter/material.dart';
import 'package:library_management/widgets/CardsforDashboard/smallScreen/info_card_small.dart';

class OverViewCardsSmallScreen extends StatelessWidget {
  const OverViewCardsSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Books Issued",
            value: "9",
            onTap: () {},
            isActive: true,
          ),
          SizedBox(
            width: _width / 64,
          ),
          InfoCardSmall(
            title: "Packages delivered",
            value: "17",
            onTap: () {},
            isActive: false,
          ),
          SizedBox(
            width: _width / 64,
          ),
          InfoCardSmall(
            title: "Cancelled delivery",
            value: "3",
            onTap: () {},
            isActive: false,
          ),
          SizedBox(
            width: _width / 64,
          ),
          InfoCardSmall(
            title: "Scheduled deliveries",
            value: "3",
            onTap: () {},
            isActive: false,
          ),
        ],
      ),
    );
  }
}
