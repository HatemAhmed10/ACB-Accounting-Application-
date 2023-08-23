import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/Add_Process.dart';
import 'package:acb/shared/Tooles/routes.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Process_View extends StatelessWidget {
  Process_View({super.key, required this.company_model});

  final Company_Model company_model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get_Process_Cubit()
        ..fetchAllProcess(
            CompanyID: company_model.CompanyID, model: company_model)
        ..fetchProcessBySaleOrPay(
          CompanyID: company_model.CompanyID,
        )
        ..GetInFormationAboutCompany(CompanyID: company_model.CompanyID)
        ..getDataAboutOneYear(
          CompanyID: company_model.CompanyID.toString(),
          EYear: DateTime.now().year.toString(),
        )
        ..fetchProcessByLateMOeny(CompanyID: company_model.CompanyID),
      child: BlocConsumer<Get_Process_Cubit, ProcessStates>(
        listener: (context, state) {},
        builder: (context, state) {
          Get_Process_Cubit cubit = Get_Process_Cubit.get(context);

          return Scaffold(
            // backgroundColor: secondaryColor,

            // appBar: AppBar(
            //   title: Text(company_model.CompanyName.toString()),
            // ),
            // body: Process_Body(company_model: company_model),
            body: cubit.screens[cubit.currentIndex],

            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                navigateTo(
                    context,
                    Add_Process_View(
                      company_model: company_model,
                    ));

                // CustomProcessBottomSheet(
                //     context: context, company_model: company_model);
              },
              child: Icon(
                size: 30,
                Icons.add,
                color: Color(0xFFFFC727),
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              color: secondaryColor,
              buttonBackgroundColor: Colors.blue,
              backgroundColor: Colors.white, // Customize the background color
              items: [
                Icon(
                  Icons.list,
                  size: 30,
                  color: Color(0xFFFFC727),
                ),
                Icon(
                  Icons.analytics,
                  size: 30,
                  color: Color(0xFFFFC727),
                ),
                Icon(
                  Icons.table_view,
                  size: 30,
                  color: Color(0xFFFFC727),
                ),
                // Icon(
                //   Icons.table_restaurant,
                //   size: 30,
                //   color: Color(0xFFFFC727),
                // ),
              ],
              index: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
