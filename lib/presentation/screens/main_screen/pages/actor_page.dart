import 'package:flutter/material.dart';
import 'package:senjayer/data/models/actor.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/actor_item.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/home_action_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ActorsPage extends StatelessWidget {
  const ActorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
            child: Form(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: AppConstants().purple,
                      decoration: InputDecoration(
                        fillColor: AppConstants().lightPurple,
                        filled: true,
                        hintText: "Rechercher",
                        suffixIcon: const Icon(
                          Icons.search,
                          size: 17.5,
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "Erreur";
                        }
                        if (value.isEmpty) {
                          return "Numéro invalide";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  HomeActionButton(
                    icon: Icons.filter_list_sharp,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "voir plus",
                  style: TextStyle(
                    fontSize: 8.5.sp,
                    fontWeight: FontWeight.values[5],
                    color: AppConstants().mediumPurple,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return ActorItem(
                  actor: demoActors[index % 4],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
