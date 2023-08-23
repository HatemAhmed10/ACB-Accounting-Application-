// ignore_for_file: unused_local_variable

import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/DataAnalysi/1show_Result_Moeny.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/DataAnalysi/2chart_Of_Years.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/DataAnalysi/3LateMoenyOFPay.dart';
import 'package:acb/presentation/widgets/2Process_Widgets/DataAnalysi/5LateOFMoenyTableOfSale.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class showTotaleOfMoney extends StatelessWidget {
  const showTotaleOfMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Get_Process_Cubit, ProcessStates>(
      listener: (context, state) {},
      builder: (context, state) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;

        Get_Process_Cubit get_process_cubit = Get_Process_Cubit.get(context);

        return Scaffold(
          backgroundColor: secondaryColor,
          // appBar: AppBar(
          //   title: Text("الربح"),
          // ),

          body: PageView(
            children: <Widget>[
              Container(
                color: Colors.yellow,
                child: ShowResultOfMoeny(),
              ),
              Container(
                color: Colors.yellow,
                child: LateOFMoenyTableOfPay(),
              ),
              Container(
                color: Colors.yellow,
                child: LateOFMoenyTableOfSale(),
              ),
              Container(
                color: Colors.yellow,
                child: Chart_Of_Years(),
              ),
            ],
          ),

          // body: Container(
          //   color: secondaryColor,
          //   height: screenHeight,
          //   width: screenWidth,
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: 50,
          //       ),
          //       Center(
          //         child: Text(
          //           "تحليل البيانات",
          //           style: TextStyle(
          //             color: Colors.yellow,
          //             fontSize: 20,
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20,
          //       ),
          //       Container(
          //         color: Colors.yellow,
          //         height: 100,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Expanded(
          //               flex: 1,
          //               child: Container(
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Text("ايرادات"),
          //                     Expanded(
          //                       child: CircleAvatar(
          //                         radius: 30,
          //                         backgroundColor: Colors.white,
          //                         child: Text(
          //                           NumberFormat.compact().format(
          //                             double.parse(get_process_cubit.TotalPay
          //                                 .toString()),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               flex: 2,
          //               child: Container(
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Text("الربح"),
          //                     CircleAvatar(
          //                       radius: 30,
          //                       backgroundColor: Colors.white,
          //                       child: Text(
          //                         NumberFormat.compact().format(
          //                           double.parse(get_process_cubit
          //                               .ResultOfPayAndSale.toString()),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               flex: 1,
          //               child: Container(
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Text("مصروفات"),
          //                     CircleAvatar(
          //                       radius: 30,
          //                       backgroundColor: Colors.white,
          //                       child: Text(
          //                         NumberFormat.compact().format(
          //                           double.parse(
          //                               get_process_cubit.TotalSale.toString()),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
