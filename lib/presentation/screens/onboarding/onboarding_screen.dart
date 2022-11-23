import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:senjayer/business_logic/bloc/onboarding_bloc/onboarding_event.dart';
import 'package:senjayer/business_logic/cubit/onboarding_cubit.dart';
import 'package:senjayer/data/repositories/auth_repository.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/auth_method_button.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          state.items[state.index].imagePath,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.5.h),
                  child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          const Spacer(
                            flex: 2,
                          ),
                          Text(
                            state.items[state.index].title,
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            state.items[state.index].subtitle,
                            style: TextStyle(
                              fontSize: 11.5.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.values[4],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: state.items
                                .map((onBoardingItem) => Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 0.5.h,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: state.index ==
                                                state.items
                                                    .indexOf(onBoardingItem)
                                            ? AppConstants().purple
                                            : AppConstants().grey,
                                        radius: 4,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<OnboardingBloc>(context)
                                  .add(SeenOnboarding());
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: Text(
                              "Passer",
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                color: AppConstants().purple,
                                fontWeight: FontWeight.values[5],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          RoundedButton(
                            onPressed: () async {
                              if (state.index == state.items.length - 1) {
                                BlocProvider.of<OnboardingBloc>(context)
                                    .add(SeenOnboarding());
                                Navigator.of(context).pushNamed('/login');
                              } else {
                                BlocProvider.of<OnBoardingCubit>(context)
                                    .goToNextItem();
                              }
                              /*  await AuthRepository().login(
                                "DJIKPE Orphée",
                                "66613755",
                                "djikpeo@gmail.com",
                                "MotDePasse",
                                "MotDePasse",
                              ); */
                            },
                            label: "Suivant",
                          ),
                          const Spacer(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
