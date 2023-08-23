// ignore_for_file: must_be_immutable

import 'package:acb/business_logic/Company_Cubit/Get_company_cubit.dart';
import 'package:acb/business_logic/Company_Cubit/company_state.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/presentation/screens/1Company_Screen/company_view.dart';
import 'package:acb/shared/Tooles/CustomshowDialog.dart';
import 'package:acb/shared/Tooles/routes.dart';
import 'package:acb/shared/styles/assets_manager.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    this.itemIndex,
    this.product,
    required this.press,
  }) : super(key: key);

  final int? itemIndex;
  final Company_Model? product;
  final Function()? press;

  List<String> imagehelpPaths = [
    ImageAssets.help2,
    ImageAssets.help4,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => Get_CompanyCubit(),
      child: BlocConsumer<Get_CompanyCubit, CompanyStates>(
        listener: (context, state) {
          if (state is DelateCompanySuccess) {
            navigateToAndReplacement(context, company_view());
          }
        },
        builder: (context, state) {
          Get_CompanyCubit get_companyCubit = Get_CompanyCubit.get(context);

          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            // color: Colors.blueAccent,
            height: 160,
            child: InkWell(
              onTap: press,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  // Those are our background
                  Container(
                    height: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color:
                          itemIndex!.isEven ? Color(0xFFFFC727) : Colors.blue,
                      boxShadow: [kDefaultShadow],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                  // our product image

                  Positioned(
                    top: 0,
                    right: 0,
                    child: Hero(
                      tag: '${product!.CompanyID}',
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        height: 160,
                        width: 150,
                        child: itemIndex!.isEven
                            ? Image.asset(
                                imagehelpPaths[0],
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                imagehelpPaths[1],
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),

                  // our product Icons
                  Positioned(
                    top: 30,
                    left: 15,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomshowDialog(
                              message:
                                  "هل تريد مسح ${product!.CompanyName.toString()}",
                              onPressedOK: () {
                                // navigateToAndReplacement(context, SplashView());

                                get_companyCubit.DeleteCompany(
                                  CompanyID: product!.CompanyID,
                                );
                              },
                              onPressedOKCancel: () {},
                              title: "Attention",
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                  ),

                  // Product title and price
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                      height: 136,
                      width: size.width - 200,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Container(
                                // color: Colors.red,
                                alignment: Alignment.center,
                                height: 70,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        maxLines: 2,
                                        product!.CompanyName,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        textDirection: TextDirection.rtl,
                                        maxLines: 1,
                                        "${product!.CompanyAdress}",
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        textDirection: TextDirection.rtl,
                                        maxLines: 1,
                                        "${product!.CompanyNumber}",
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // child: Row(
                                //   children: [
                                //     Expanded(
                                //       child: Column(
                                //         children: [
                                //           Expanded(
                                //             child: Text(
                                //               product!.CompanyName,
                                //               textDirection: TextDirection.rtl,
                                //               maxLines: 1,
                                //               style: TextStyle(
                                //                   fontSize: 18,
                                //                   color: Colors.black),
                                //             ),
                                //           ),
                                //           Expanded(
                                //             child: Text(
                                //               "${product!.CompanyNumber} / ${product!.CompanyAdress}",
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .button,
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     // Expanded(
                                //     //   child: CircleAvatar(
                                //     //     backgroundColor: Colors.red.withOpacity(0.2),
                                //     //     child: IconButton(
                                //     //       onPressed: () {
                                //     //         showDialog(
                                //     //           context: context,
                                //     //           builder: (BuildContext context) {
                                //     //             return CustomshowDialog(
                                //     //               message:
                                //     //                   "هل تريد مسح ${product!.teacherName}",
                                //     //               onPressedOK: () {
                                //     //                 cubit.DeleteTeacher(
                                //     //                     TeacherID: product!.teacherID);

                                //     //                 cubit.fetchAllTeachers();
                                //     //               },
                                //     //               onPressedOKCancel: () {},
                                //     //               title: "Attention",
                                //     //             );
                                //     //           },
                                //     //         );
                                //     //       },
                                //     //       icon: const Icon(
                                //     //         Icons.delete,
                                //     //         color: kColorPrimrywite,
                                //     //       ),
                                //     //     ),
                                //     //   ),
                                //     // ),
                                //   ],
                                // ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 130,
                              padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 1.5, // 30 padding
                                vertical:
                                    kDefaultPadding / 4, // 5 top and bottom
                              ),
                              decoration: BoxDecoration(
                                // color: kSecondaryColor,
                                color: itemIndex!.isEven
                                    ? Color(0xFFFFC727)
                                    : Colors.blue,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22),
                                  topRight: Radius.circular(22),
                                ),
                              ),
                              child: Text(
                                textDirection: TextDirection.rtl,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                "${product!.CompanyManager}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
