import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class ApplicantsX extends StatelessWidget {
  const ApplicantsX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomCard(
            height: 50,
            width: 100,
            elevation: 6,
            childPadding: 10,
            color: Colors.green,
            onTap: () {},
            child: Center(
              child: Text(
                'Flutter',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
