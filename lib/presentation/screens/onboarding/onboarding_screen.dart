import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:senjayer/business_logic/cubit/onboarding_cubit.dart';
import 'package:senjayer/utils/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

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
                  child: BlocBuilder<OnboardingCubit, OnboardingState>(
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
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: BlocBuilder<OnboardingCubit, OnboardingState>(
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
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            state.items[state.index].subtitle,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.values[4],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,/* 
                            mainAxisAlignment: MainAxisAlignment.center, */
                            children: 
                              state.items.map((onboardingItem) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5,),
                                child: CircleAvatar(
                                  backgroundColor: state.index == state.items.indexOf(onboardingItem)
                                      ? AppConstants().purple
                                      : AppConstants().grey,
                                  radius: 4,
                                ),
                              )).toList()
                            ,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Passer",
                              style: TextStyle(
                                fontSize: 18,
                                color: AppConstants().purple,
                                fontWeight: FontWeight.values[5],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (state.index == state.items.length - 1) {
                                Navigator.of(context).pushNamed('/login');
                              } else {
                                BlocProvider.of<OnboardingCubit>(context)
                                    .goToNextItem();
                              }
                            },
                            elevation: 0,
                            height: 48,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            color: AppConstants().purple,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Suivant",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.values[5],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
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
