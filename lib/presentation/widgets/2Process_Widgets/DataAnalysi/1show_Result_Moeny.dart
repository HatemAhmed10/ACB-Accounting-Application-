import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/shared/Tooles/DateTimePickerWidget2.dart';
import 'package:acb/shared/Tooles/NumberFormat.dart';
import 'package:acb/shared/Tooles/myDivider.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowResultOfMoeny extends StatelessWidget {
  const ShowResultOfMoeny({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<Get_Process_Cubit, ProcessStates>(
      builder: (context, state) {
        Get_Process_Cubit get_process_cubit = Get_Process_Cubit.get(context);

        return Container(
          color: secondaryColor,
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        "تحليل كل البيانات",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ايرادات",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFFFC727),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    customFormat.format(double.parse(
                                        get_process_cubit.TotalPay.toString())),
                                    // NumberFormat.compact().format(
                                    //   double.parse(get_process_cubit.TotalPay
                                    //       .toString()),
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Text(
                            customFormat.format(double.parse(get_process_cubit
                                .ResultOfPayAndSale.toString())),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "مصروفات",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFFFC727),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    customFormat.format(double.parse(
                                        get_process_cubit.TotalSale
                                            .toString())),
                                    // NumberFormat.compact().format(
                                    //   double.parse(get_process_cubit.TotalSale
                                    //       .toString()),
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      // color: Colors.yellow,
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "اجل الايرادات",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFFFC727),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      customFormat.format(double.parse(
                                          get_process_cubit.LateMoenyOfPay
                                              .toString())),
                                      // NumberFormat.compact().format(
                                      //   double.parse(get_process_cubit
                                      //       .ResultOfPayAndSale.toString()),
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "اجل المصروفات",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFFFC727),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      customFormat.format(double.parse(
                                          get_process_cubit.LateMoenyOfSale
                                              .toString())),
                                      // NumberFormat.compact().format(
                                      //   double.parse(get_process_cubit
                                      //       .ResultOfPayAndSale.toString()),
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    myDivider(),
                    SizedBox(
                      height: 2,
                    ),
                    myDivider(),
                    SizedBox(
                      height: 2,
                    ),
                    myDivider(),
                    SizedBox(
                      height: 20,
                    ),

                    Center(
                      child: Text(
                        "تحليل البيانات لشهر واحد فقط",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: DateTimePickerWidget2()),
                        Expanded(
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                get_process_cubit.getDataAboutOneMonth(
                                  CompanyID: get_process_cubit
                                      .company_model!.CompanyID
                                      .toString(),
                                  EYear: get_process_cubit.selectedDate2.year
                                      .toString(),
                                  EMonth: get_process_cubit.selectedDate2.month
                                      .toString(),
                                );
                                get_process_cubit
                                    .fetchProcessByLateMOenyByMonth(
                                  CompanyID: get_process_cubit
                                      .company_model!.CompanyID
                                      .toString(),
                                  EYear: get_process_cubit.selectedDate2.year
                                      .toString(),
                                  EMonth: get_process_cubit.selectedDate2.month
                                      .toString(),
                                );
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ايرادات",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFFFC727),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    customFormat.format(double.parse(
                                        get_process_cubit.Total_One_Month_Pay
                                            .toString())),
                                    // NumberFormat.compact().format(
                                    //   double.parse(get_process_cubit
                                    //       .Total_One_Month_Pay.toString()),
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Text(
                            customFormat.format(double.parse(get_process_cubit
                                .Result_One_Month_OfPayAndSale.toString())),
                          ),
                        ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Container(
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           "الربح",
                        //           style: TextStyle(
                        //             fontSize: 20,
                        //             color: Color(0xFFFFC727),
                        //           ),
                        //         ),
                        //         CircleAvatar(
                        //           radius: 30,
                        //           backgroundColor: Colors.white,
                        //           child: Text(
                        //             customFormat.format(double.parse(
                        //                 get_process_cubit
                        //                         .Result_One_Month_OfPayAndSale
                        //                     .toString())),
                        //             // NumberFormat.compact().format(
                        //             //   double.parse(get_process_cubit
                        //             //           .Result_One_Month_OfPayAndSale
                        //             //       .toString()),
                        //             // ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "مصروفات",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFFFC727),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    customFormat.format(double.parse(
                                        get_process_cubit.Total_One_Month_Sale
                                            .toString())),
                                    // NumberFormat.compact().format(
                                    //   double.parse(get_process_cubit
                                    //       .Total_One_Month_Sale.toString()),
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // color: Colors.yellow,
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "اجل الايرادات",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFFFC727),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      customFormat.format(double.parse(
                                          get_process_cubit.LateMoenyOfPay2
                                              .toString())),
                                      // NumberFormat.compact().format(
                                      //   double.parse(get_process_cubit
                                      //       .ResultOfPayAndSale.toString()),
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "اجل المصروفات",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFFFC727),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      customFormat.format(double.parse(
                                          get_process_cubit.LateMoenyOfSale2
                                              .toString())),
                                      // NumberFormat.compact().format(
                                      //   double.parse(get_process_cubit
                                      //       .ResultOfPayAndSale.toString()),
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Container(
                    //   height: 300,
                    //   color: Colors.white,
                    //   child: Column(
                    //     children: [
                    //       DateTimePickerWidget2(),
                    //       MaterialButton(
                    //         onPressed: () {
                    //           get_process_cubit.getDataAboutOneMonth(
                    //             CompanyID: get_process_cubit.company_model!.CompanyID
                    //                 .toString(),
                    //             EYear:
                    //                 get_process_cubit.selectedDate2.year.toString(),
                    //             EMonth:
                    //                 get_process_cubit.selectedDate2.month.toString(),
                    //           );
                    //         },
                    //         child: Text("Get Month Data"),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
