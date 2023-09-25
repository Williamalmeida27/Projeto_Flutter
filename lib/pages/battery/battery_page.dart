import 'dart:async';
import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  var battery = Battery();
  var statusBateria = 0;
  var bateria = "";
  late StreamSubscription subscription;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print(result);
    });
    initPage();
  }

  initPage() async {
    statusBateria = await battery.batteryLevel;
    battery.onBatteryStateChanged.listen((BatteryState state) {
      // Do something with new state

      bateria = state.toString();
    });
    setState(() {});
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(bateria),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 50,
            animation: true,
            lineHeight: 20.0,
            animationDuration: 2500,
            percent: double.parse(statusBateria.toString()) / 100,
            center: Text("$statusBateria%"),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.green,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () async {
                    var _url = Uri.parse("https://dio.me");
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                  child: FaIcon(FontAwesomeIcons.internetExplorer)),
              TextButton(
                  onPressed: () {
                    Share.share('check out my website https://dio.me',
                        subject: "Obrigado!");
                  },
                  child: FaIcon(FontAwesomeIcons.share)),
              Expanded(
                child: TextButton(
                    onPressed: () async {
                      var tempDir = await pathProvider.getTemporaryDirectory();
                      print(tempDir);
                      var appDocumentsDir =
                          await pathProvider.getApplicationDocumentsDirectory();
                      print(appDocumentsDir);
                      var downloadsDir =
                          await pathProvider.getDownloadsDirectory();
                      print(downloadsDir);
                    },
                    child: Text("Caminho das pastas do SO")),
              ),
              Expanded(
                  child: TextButton(
                      onPressed: () async {
                        PackageInfo packageInfo =
                            await PackageInfo.fromPlatform();
                        String appName = packageInfo.appName;
                        print(appName);
                        String packageName = packageInfo.packageName;
                        print(packageName);
                        String version = packageInfo.version;
                        print(version);
                        String buildNumber = packageInfo.buildNumber;
                        print(buildNumber);
                        print(Platform.operatingSystem);
                      },
                      child: Text("Sobre o App"))),
              Expanded(
                  child: TextButton(
                      onPressed: () async {
                        var deviceInfoPlugin = DeviceInfoPlugin();

                        var deviceInfo = await deviceInfoPlugin.androidInfo;
                        if (Platform.isAndroid) {
                          print(await deviceInfo.model);
                        }
                      },
                      child: Text("Sobre o Dispositivo"))),
              Expanded(
                  child: TextButton(
                      onPressed: () async {
                        var connectivityResult =
                            await (Connectivity().checkConnectivity());

                        if (connectivityResult == ConnectivityResult.mobile) {
                          print(connectivityResult.name);
                        } else if (connectivityResult ==
                            ConnectivityResult.wifi) {
                          print(connectivityResult.name);
                        } else if (connectivityResult ==
                            ConnectivityResult.ethernet) {
                          print(connectivityResult.name);
                        } else if (connectivityResult ==
                            ConnectivityResult.vpn) {
                          print(connectivityResult.name);
                          // Note for iOS and macOS:
                          // There is no separate network interface type for [vpn].
                          // It returns [other] on any device (also simulator)
                        } else if (connectivityResult ==
                            ConnectivityResult.bluetooth) {
                          print(connectivityResult.name);
                        } else if (connectivityResult ==
                            ConnectivityResult.other) {
                          // I am connected to a network which is not in the above mentioned networks.
                          print(connectivityResult.name);
                        } else if (connectivityResult ==
                            ConnectivityResult.none) {
                          // I am not connected to any network.
                          print(connectivityResult.name);
                        }
                      },
                      child: FaIcon(FontAwesomeIcons.wifi))),
            ],
          )
        ],
      ),
    ));
  }
}
