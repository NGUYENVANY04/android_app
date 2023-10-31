import 'package:flutter/material.dart';

Expanded infoCard({
  required BuildContext context,
  required String nameInfo,
  required String contentInfo,
  required String iconInfo,
  required Color colorInfo,
}) {
  return Expanded(
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 19),
        // width: MediaQuery.of(context).size.width*0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorInfo,
        ),
        // constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nameInfo,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Image.asset(
                  iconInfo,
                  height: 30,
                ),
                const SizedBox(width: 8),
                Text(
                  "$contentInfo °C",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        )),
  );
}
