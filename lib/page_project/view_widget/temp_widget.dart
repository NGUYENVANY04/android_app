import 'package:flutter/material.dart';
import 'package:android_app/page_project/view_mode/data_temp.dart';
import 'package:android_app/page_project/view_widget/infocard.dart';
import 'package:provider/provider.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoViewModel>(builder: (context, view, child) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              infoCard(
                  colorInfo: Colors.white,
                  context: context,
                  iconInfo: "assets/images/in_temp.jpg",
                  nameInfo: "Temprate Indoor",
                  contentInfo: view.roomTemp.toString()),
              const SizedBox(
                width: 8,
              ),
              infoCard(
                  colorInfo: Colors.white,
                  context: context,
                  iconInfo: "assets/images/out_temp.png",
                  nameInfo: "Temprate Outdoor",
                  contentInfo: view.temp.toString())
            ],
          ),
        ),
      );
    });
  }
}
