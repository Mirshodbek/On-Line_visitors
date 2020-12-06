import 'package:flutter/material.dart';
import 'package:online_visitors/provider/provider.dart';
import 'package:online_visitors/widget.dart';
import 'package:provider/provider.dart';

class ListVisitsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BrainProvider>(
      builder: (context, brain, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BrainProvider.result ? ListOfBooked() : Container(),
            );
          },
          itemCount: 1,
        );
      },
    );
  }
}
