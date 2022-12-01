import 'package:flutter/material.dart';
import 'package:senjayer/data/models/actor.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ActorItem extends StatelessWidget {
  final Actor actor;
  const ActorItem({
    Key? key, required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 30.w,
      child: Column(
        children: [
          Container(
            height: 27.w,
            width: 27.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppConstants().purple,
              ),
              //ToDo : Add networkImage when available
              /* image: DecorationImage(
                image: AssetImage(
                    actor.profilePath),
                fit: BoxFit.fill,
              ), */
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                actor.name,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              SizedBox(
                height: 3.w,
                width: 3.w,
                child:
                    Image.asset("assets/icons/certified.png"),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 27.w,
            child: RoundedButton(
              onPressed: () {
                if(actor.isOrganizer){
                  Navigator.of(context).pushNamed('/organizerDetail');
                }else{
                  Navigator.of(context).pushNamed('/actorDetail');
                }
              },
              label: "Consulter",
              height: 5.h,
            ),
          ),
        ],
      ),
    );
  }
}
