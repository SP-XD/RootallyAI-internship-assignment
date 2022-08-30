import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rootllyai/controllers/user_controller.dart';
import 'package:rootllyai/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    var progress = (userController.user.value.sessionsCompletedToday /
            userController.user.value.sessionsTargetToday *
            100)
        .toInt();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
  Widget progressBanner() {
    var progress = (userController.user.value.sessionsCompletedToday /
            userController.user.value.sessionsTargetToday *
            100)
        .toInt();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Good Morning\n${userController.user.value.name}',
            style: const TextStyle(
                height: 1.3, fontSize: 40, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: Get.width,
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Today's Progress",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 28,
                              fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Text(
                        "${progress}%",
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LinearPercentIndicator(
                    padding: const EdgeInsets.all(0),
                    barRadius: const Radius.circular(5),
                    lineHeight: 10,
                    percent: progress / 100,
                    backgroundColor: Colors.grey.shade300,
                    progressColor: Colors.blue[700],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/icons/checked.png',
                    scale: 1.6,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Completed'),
                      Text(
                          '${userController.user.value.sessionsCompletedToday} Sessions',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/icons/next-button.png', scale: 1.6),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pending'),
                      Text(
                          '${userController.user.value.sessionsTargetToday - userController.user.value.sessionsCompletedToday} Sessions',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
