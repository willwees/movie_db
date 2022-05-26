import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviedb/src/constants/asset_names.dart';
import 'package:moviedb/src/constants/device_properties.dart';
import 'package:moviedb/src/constants/route_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to home after 2 seconds
    Future<void>.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, RoutePaths.root);
    });
  }

  void _setupDevicePropertiesVariable(BuildContext context) {
    kDeviceSize = MediaQuery.of(context).size;
    kDeviceLogicalWidth = MediaQuery.of(context).size.width;
    kDeviceLogicalHeight = MediaQuery.of(context).size.height;
    kDevicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    kDevicePhysicalWidth = kDeviceLogicalWidth * kDevicePixelRatio;
    kDevicePhysicalHeight = kDeviceLogicalHeight * kDevicePixelRatio;
  }

  @override
  Widget build(BuildContext context) {
    // called in build because of MediaQuery
    _setupDevicePropertiesVariable(context);

    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
      child: Center(
        child: SvgPicture.asset(
          GeneralAssetNames.movieDbLogoSvg,
          width: 180,
          height: 180,
        ),
      ),
    );
  }
}
