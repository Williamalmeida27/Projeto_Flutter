import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/battery/battery_page.dart';
import 'package:my_app/pages/brasil_fields/brasil_fields_page.dart';
import 'package:my_app/pages/geolocate/geolocate_page.dart';

class BottomBarCustomizadoPage extends StatefulWidget {
  const BottomBarCustomizadoPage({super.key});

  @override
  State<BottomBarCustomizadoPage> createState() =>
      _BottomBarCustomizadoPageState();
}

class _BottomBarCustomizadoPageState extends State<BottomBarCustomizadoPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Bar"),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [GeolocatePage(), BatteryPage(), BrasilFieldsPage()],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.list, title: "Home"),
          TabItem(icon: Icons.calendar_today, title: "Hoje"),
          TabItem(icon: Icons.assessment, title: "Mais"),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    ));
  }
}
