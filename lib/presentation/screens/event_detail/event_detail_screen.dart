import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/event_detail/event_detail_cubit.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/screens/event_detail/widgets/ticket_item.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:senjayer/utils/util_functions.dart';
import 'package:sizer/sizer.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  const EventDetailScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 0,
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 40.h,
                  child: Image.network(
                    event.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              BlocBuilder<EventDetailCubit, EventDetailState>(
                builder: (context, state) {
                  if (state is EventDetailFetched) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppConstants().purple,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        state.category.name,
                        style: TextStyle(
                          color: AppConstants().purple,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.values[4],
                        ),
                      ),
                    );
                  } else if (state is EventDetailFetching) {
                    return Shimmer(
                      linearGradient: AppConstants().shimmerGradient,
                      child: ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          height: 4.5.h,
                          width: 15.w,
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.w,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                event.name,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 9.w,
                                width: 9.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppConstants().lightPurple,
                                ),
                                child: Icon(
                                  Icons.event_available,
                                  size: 15.sp,
                                  color: AppConstants().purple,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formatEventDate(
                                      event.startDate,
                                    ),
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${getHourFromDate(event.startDate)} - ${getHourFromDate(event.endDate)}",
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                  ),
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40.w,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: AppConstants().lightPurple,
                                        ),
                                        child: Icon(
                                          Icons.event_available,
                                          color: AppConstants().purple,
                                          size: 50.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                        ),
                                        child: Text(
                                          "Ajouté avec succès au calendrier",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 18.5.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                                vertical: 1.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppConstants().purple,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Ajouter au calendrier",
                                style: TextStyle(
                                  color: AppConstants().purple,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 9.w,
                                width: 9.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppConstants().lightPurple,
                                ),
                                child: Icon(
                                  Icons.location_on,
                                  size: 15.sp,
                                  color: AppConstants().purple,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Text(
                                  event.eventAddress,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11.5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 1.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppConstants().purple,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Voir sur la carte",
                              style: TextStyle(
                                color: AppConstants().purple,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.5.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                event.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 9.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              BlocBuilder<EventDetailCubit, EventDetailState>(
                builder: (context, state) {
                  if (state is EventDetailFetched) {
                    return GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed("/organizerDetail"),
                      child: Row(
                        children: [
                          Container(
                            height: 14.w,
                            width: 14.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppConstants().purple,
                              ),
                              shape: BoxShape.circle,
                              /* image: const DecorationImage(
                                image: AssetImage("assets/images/empire.png"),
                              ), */
                              //TODO: Show userProfile if available
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.actor.fullName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Organisateur",
                                style: TextStyle(
                                  fontSize: 11.5.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else if(state is EventDetailFetching){
                    return Shimmer(
                      linearGradient: AppConstants().shimmerGradient,
                      child: ShimmerLoading(
                        isLoading: true,
                        child: Row(
                        children: [
                          Container(
                            height: 14.w,
                            width: 14.w,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 3.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 0.5.h,),
                              Container(
                                height: 3.h,
                                width: 10.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ),
                    ); 
                  }else{
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              if(event.tickets.isNotEmpty)Text(
                "Pricing",
                style: TextStyle(
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ...event.tickets
                  .map(
                    (ticket) => TicketItem(
                      ticket: ticket,
                    ),
                  )
                  .toList(),
              SizedBox(
                height: 2.h,
              ),
              RoundedButton(
                onPressed: () {},
                label: 'Poser une question',
                color: AppConstants().lightPurple,
              ),
              SizedBox(
                height: 13.h,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              blurRadius: 4,
              color: Colors.grey.withOpacity(0.5),
            )
          ],
        ),
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 11.6.w,
              width: 11.6.w,
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstants().lightPurple,
              ),
              child: Icon(
                Icons.share,
                size: 20.sp,
                color: AppConstants().purple,
              ),
            ),
            Container(
              height: 11.6.w,
              width: 11.6.w,
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstants().lightPurple,
              ),
              child: Icon(
                Icons.turned_in_not,
                size: 20.sp,
                color: AppConstants().purple,
              ),
            ),
            SizedBox(
              width: 50.w,
              child: RoundedButton(
                label: "Acheter Ticket",
                onPressed: () => Navigator.of(context).pushNamed("/buyTicket"),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
