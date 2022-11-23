import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:senjayer/business_logic/bloc/onboarding_bloc/onboarding_state.dart';
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
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) async {
        if (state is HasAlreadySeenOnboarding) {
          await Future.delayed(const Duration(seconds: 5)).then(
            (value) async {
              Navigator.of(context).pushReplacementNamed("/start");
            },
          );
        }else{
          await Future.delayed(const Duration(seconds: 5)).then(
            (value) async {
              Navigator.of(context).pushReplacementNamed("/onboarding");
            },
          );
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
