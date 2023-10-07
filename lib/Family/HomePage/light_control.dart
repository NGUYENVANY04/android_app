import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:/pages/control_panel/light_control/light_control_view_model.dart';
import 'package:provider/provider.dart';
import 'light_control_view_model.dart';

class LightControl extends StatefulWidget {
  const LightControl({Key? key}) : super(key: key);

  @override
  State<LightControl> createState() => _LightControlState();
}

class _LightControlState extends State<LightControl> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text(
            "Light",
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0,
        ),
        body: Consumer<LightControlViewModel>(
          builder: (context, view, child) {
            return Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "P-Smart home",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Living room light",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Power",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Transform.scale(
                                  alignment: Alignment.center,
                                  scaleY: 0.8,
                                  scaleX: 0.85,
                                  child: CupertinoSwitch(
                                    thumbColor: Colors.orange,
                                    onChanged: (value) {
                                      view.turnLight(value);
                                    },
                                    value: view.isActice,
                                    activeColor: view.isActice
                                        ? const Color.fromARGB(
                                                255, 243, 171, 171)
                                            .withOpacity(0.4)
                                        : Colors.black,
                                    trackColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 180,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage(
                                    view.isActice
                                        ? "assets/images/light_on.jpg"
                                        : "assets/images/light_off.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Schedule",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      // text("hello world"),
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "From ",
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20),
                                ),
                                Text(
                                  " ${view.hourFrom}:${view.minuteFrom}  pm",
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text(
                                  "To      ",
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20),
                                ),
                                Text(
                                  "5:00  am",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 2, color: Colors.black45)),
                          height: 60,
                          width: 40,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  showPicker(
                                    context: context,
                                    value: view.time,
                                    sunrise: const TimeOfDay(
                                        hour: 6, minute: 0), // optional
                                    sunset: const TimeOfDay(
                                        hour: 18, minute: 0), // optional
                                    duskSpanInMinutes: 120, // optional
                                    onChange: view.onTimeChanged,
                                    onChangeDateTime: (p0) {
                                      view.setSchedule(p0);
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit_outlined)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(182, 210, 210, 208),
                          ),
                          height: 60,
                          width: 40,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete_outline_rounded)),
                        )
                      ],
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
