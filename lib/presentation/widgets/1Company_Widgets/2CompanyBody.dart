import 'package:acb/business_logic/Company_Cubit/Get_company_cubit.dart';
import 'package:acb/business_logic/Company_Cubit/company_state.dart';
import 'package:acb/presentation/screens/2Process_Screen/Process_View.dart';
import 'package:acb/presentation/widgets/1Company_Widgets/3ProductCard.dart';
import 'package:acb/presentation/widgets/1Company_Widgets/4SearchBox.dart';
import 'package:acb/shared/Tooles/myDivider.dart';
import 'package:acb/shared/Tooles/routes.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Company_Body extends StatefulWidget {
  const Company_Body({super.key});

  @override
  State<Company_Body> createState() => _Company_BodyState();
}

class _Company_BodyState extends State<Company_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get_CompanyCubit()..fetchAllCompany(),
      child: BlocBuilder<Get_CompanyCubit, CompanyStates>(
        builder: (context, state) {
          Get_CompanyCubit get_companyCubit = Get_CompanyCubit.get(context);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SearchBox(),
                myDivider(),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 70),
                        decoration: BoxDecoration(
                          color: kBackGrounBlackdAny.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      Container(
                        height: 480,
                        child: ListView.builder(
                          itemCount: get_companyCubit.Companys.length,
                          itemBuilder: (context, index) => ProductCard(
                            itemIndex: index,
                            product: get_companyCubit.Companys[index],
                            press: () {
                              navigateTo(
                                  context,
                                  Process_View(
                                    company_model:
                                        get_companyCubit.Companys[index],
                                  ));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );

          // return Container(
          //   child: ListView.builder(
          //     itemCount: get_companyCubit.Companys.length,
          //     itemBuilder: (context, index) => Container(
          //       child: Center(
          //         child: InkWell(
          //           onTap: () {
          //             navigateTo(
          //                 context,
          //                 Process_View(
          //                   company_model: get_companyCubit.Companys[index],
          //                 ));
          //           },
          //           child: Text(get_companyCubit.Companys[index].CompanyName
          //               .toString()),
          //         ),
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
