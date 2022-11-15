import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';

class LogoBox extends StatelessWidget {
  const LogoBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 339,
      width: 358,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  "assets/icons/app_icon.png",
                ),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.white,
                width: 6,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 139.44,
            left: 0,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/onboarding_1.png",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 6,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      8,
                      8,
                    ),
                    blurRadius: 10,
                    color: AppConstants().shadowColor,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 33.4,
            left: 68.19,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/onboarding_2.png",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 6,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      8,
                      8,
                    ),
                    blurRadius: 10,
                    color: AppConstants().shadowColor,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 220,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/onboarding_3.png",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 6,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      8,
                      8,
                    ),
                    blurRadius: 10,
                    color: AppConstants().shadowColor,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 112.72,
            right: 0,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/onboarding_1.png",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 6,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      8,
                      8,
                    ),
                    blurRadius: 10,
                    color: AppConstants().shadowColor,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 182.41,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/onboarding_2.png",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 6,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      8,
                      8,
                    ),
                    blurRadius: 10,
                    color: AppConstants().shadowColor,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 14.19,
            left: 69.04,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/onboarding_3.png",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 6,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      8,
                      8,
                    ),
                    blurRadius: 10,
                    color: AppConstants().shadowColor,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 86,
            left: 274.47,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/onboarding_3.png",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 6,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      8,
                      8,
                    ),
                    blurRadius: 10,
                    color: AppConstants().shadowColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
