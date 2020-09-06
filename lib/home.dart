import 'package:flutter/material.dart';
import 'package:miocardio_app/tabs/analisis.dart';
import 'package:miocardio_app/tabs/display.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analisis ECG-Miocardio'),
        bottom: getTabBar(),
      ),
      body: getTabBarView(),
    );
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(text: 'Elegir Señal', icon: Icon(Icons.favorite),),
        Tab(text: 'Analizar Señal', icon: Icon(Icons.graphic_eq),)
      ],
      controller: _tabController,
    );
  }

  TabBarView getTabBarView() {
    return TabBarView(
      children: [
        Display(),
        TabAnalisis()
      ],
      controller: _tabController,
    );
  }
}
