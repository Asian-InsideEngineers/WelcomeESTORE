import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:welcomestoreapp/Logic%20Builder/Category%20Logic/categorycubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Category%20Logic/categorystate.dart';
import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';

class CategoriesFeed extends StatefulWidget {
  const CategoriesFeed({super.key});

  @override
  State<CategoriesFeed> createState() => _CategoriesFeedState();
}

class _CategoriesFeedState extends State<CategoriesFeed> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
        builder: (context, State) {
      if (CategoryStates is CategoryLoadingState && State.categories.isEmpty) {
        return const CircularProgressIndicator();
      } else if (CategoryStates is CategoryErrorState) {
        Lottie.asset("assets/lottie/splash_Screen.json");
      }
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
          ),
          itemCount: State.categories.length,
          itemBuilder: (context, index) {
            final catetorytext = State.categories[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [AppColors.primary, AppColors.secondary]),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 17),
                        blurRadius: 23,
                        spreadRadius: -13,
                        color: Colors.black26),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Image(
                        image: AssetImage(
                          "assets/images/shopping.jpg",
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [AppColors.primary, AppColors.secondary]),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 23,
                                spreadRadius: -13,
                                color: Colors.black26),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 20,
                        child: Center(
                          child: Text(
                            ("${catetorytext.title}"),
                            style: GoogleFonts.montserrat(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              ),
            );
          });
    });
  }
}

// return GFListTile(
//               color: Colors.white,
//               shadow: BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 4,
//                 blurRadius: 7,
//                 offset: const Offset(2, 4), // changes position of shadow
//               ),
//               title: Text(
//                 ("${catetorytext.title}"),
//                 style: TextStyles.heading_medium,
//               ),
//               subTitle: Text(("${catetorytext.description}")),
//               icon: Icon(
//                 FontAwesomeIcons.angleRight,
//                 color: AppColors.primary,
//               ),
//               subTitleText: ("${catetorytext.description}"),
//             );