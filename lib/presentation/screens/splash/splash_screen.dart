import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/logo_box.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(const Duration(seconds: 5)).then(
      (value) => Navigator.of(context).pushReplacementNamed("/passwordRecup"),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              Spacer(),
              LogoBox(),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            "Senjayer",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 18.5.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
