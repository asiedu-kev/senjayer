import 'package:flutter/material.dart';
import 'package:senjayer/data/models/pricing.dart';
import 'package:senjayer/presentation/screens/event_detail/widgets/pricing_item.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 0,
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 360,
                child: Image.asset(
                  "assets/images/vano_description.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppConstants().purple,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Concert",
                  style: TextStyle(
                    color: AppConstants().purple,
                    fontSize: 10,
                    fontWeight: FontWeight.values[4],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Concert Test App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppConstants().lightPurple,
                                ),
                                child: Icon(
                                  Icons.event_available,
                                  size: 20,
                                  color: AppConstants().purple,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "10 Avril 2022",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "16:00 - 20:00",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
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
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppConstants().lightPurple,
                                ),
                                child: Icon(
                                  Icons.location_on,
                                  size: 20,
                                  color: AppConstants().purple,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Stade ABCDEFG",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Cotonou, BENIN",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
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
                                fontSize: 12,
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam neque pulvinar urna lacinia. Eleifend mauris, sit sed augue proin placerat morbi. Posuere dolor accumsan faucibus sed lobortis donec gravida a, volutpat. Convallis elementum quam interdum amet, tincidunt neque ultricies. Porta non condimentum dictum et, nullam lorem ut scelerisque risus. Turpis erat rhoncus diam non congue sed.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppConstants().purple,
                      ),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage("assets/images/empire.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Groupe Empire",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Organisateur",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Pricing",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...demoPricing
                  .map(
                    (pricing) => PricingItem(
                      pricing: pricing,
                    ),
                  )
                  .toList(),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                onPressed: () {},
                label: 'Poser une question',
                color: AppConstants().lightPurple,
              ),
              const SizedBox(
                height: 100,
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
        height: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstants().lightPurple,
              ),
              child: Icon(
                Icons.share,
                size: 25,
                color: AppConstants().purple,
              ),
            ),
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstants().lightPurple,
              ),
              child: Icon(
                Icons.turned_in_not,
                size: 25,
                color: AppConstants().purple,
              ),
            ),
            SizedBox(
              width: 220,
              child: RoundedButton(
                label: "Acheter Ticket",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
