import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppConstants().lightPurple,
            ),
            child: Icon(
              Icons.sentiment_dissatisfied,
              color: AppConstants().purple,
              size: 80,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/5,),
            child: Text(
              "Aucun résultat trouvé",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/5,),
            child: Text(
              "Veuillez essayer un autre mot-clé",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 14,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
