import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'history/History.view.dart';
import 'devices/Devices.view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? const Color.fromRGBO(18, 18, 18, 1.0)
                  : const Color.fromRGBO(228, 37, 44, 1.0),
          elevation: 10,
          flexibleSpace: SafeArea(
            child: TabBar(
              labelColor:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white
                      : const Color.fromRGBO(228, 37, 44, 1.0),
              unselectedLabelColor:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? const Color.fromRGBO(228, 37, 44, 1.0)
                      : Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? const Color.fromRGBO(228, 37, 44, 1.0)
                        : Colors.white,
              ),
              controller: controller,
              tabs: const [
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.chartSimple,
                    size: 17,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("ALERTAS"),
                  ),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.towerBroadcast,
                    size: 17,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("DISPOSITIVOS"),
                  ),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [const History(), Devices()],
        ),
      );
}
