import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(children: [Text('HELLO WORLD')]),
        bottomNavigationBar: TabBar(tabs: [
          Tab(icon: Icon(Icons.list)),
          Tab(icon: Icon(Icons.devices)),
          Tab(icon: Icon(Icons.engineering)),
        ]),
      ),
    );
  }
}
