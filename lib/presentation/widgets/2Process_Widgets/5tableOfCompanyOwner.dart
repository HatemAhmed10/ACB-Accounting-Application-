import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/shared/Tooles/NumberFormat.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableOFCompanyOwner extends StatelessWidget {
  const TableOFCompanyOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Get_Process_Cubit, ProcessStates>(
      builder: (context, state) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;

        Get_Process_Cubit get_process_cubit = Get_Process_Cubit.get(context);

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: secondaryColor,
            height: screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "تحليل العملاء",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: Color(0xFFFFC727),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Table(
                            border: TableBorder.all(),
                            defaultColumnWidth: FixedColumnWidth(100.0),
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "اسم الشركه",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        "عدد العمليات",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        "الايرادات",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        "المصروفات",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        "الربح",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              for (int index = 0;
                                  index < get_process_cubit.MapOfProcess.length;
                                  index++)
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          get_process_cubit.MapOfProcess[index]
                                                  ["CompanyName"]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          customFormat.format(double.parse(
                                              get_process_cubit
                                                  .MapOfProcess[index]
                                                      ["NumberOfProcess"]
                                                  .toString())),
                                          // get_process_cubit.MapOfProcess[index]
                                          //         ["NumberOfProcess"]
                                          //     .toString(),
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          customFormat.format(double.parse(
                                              get_process_cubit
                                                  .MapOfProcess[index]["Pay"]
                                                  .toString())),
                                          // get_process_cubit.MapOfProcess[index]
                                          //         ["Pay"]
                                          //     .toString(),
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          customFormat.format(double.parse(
                                              get_process_cubit
                                                  .MapOfProcess[index]["Sale"]
                                                  .toString())),
                                          // get_process_cubit.MapOfProcess[index]
                                          //         ["Sale"]
                                          //     .toString(),
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          customFormat.format(double.parse(
                                              (double.parse(get_process_cubit
                                                          .MapOfProcess[index]
                                                              ["Pay"]
                                                          .toString()) -
                                                      double.parse(
                                                          get_process_cubit
                                                                  .MapOfProcess[
                                                              index]["Sale"]))
                                                  .toString())),
                                          // (double.parse(get_process_cubit
                                          //             .MapOfProcess[index]
                                          //                 ["Pay"]
                                          //             .toString()) -
                                          //         double.parse(get_process_cubit
                                          //                 .MapOfProcess[index]
                                          //             ["Sale"]))
                                          //     .toString(),
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        // return Container(
        //   color: Colors.black,
        //   height: 300,
        //   child: Column(
        //     children: [
        //       // MaterialButton(
        //       //   // minWidth: 150,
        //       //   height: 60,
        //       //   onPressed: () {
        //       //     get_process_cubit.GetInFormationAboutCompany(
        //       //         CompanyID: get_process_cubit.company_model!.CompanyID);
        //       //   },
        //       //   child: Text(
        //       //     "Add Process".toUpperCase(),
        //       //     style: TextStyle(color: Colors.white),
        //       //   ),
        //       // ),

        //       Container(
        //         color: Colors.yellow,
        //         height: 300,
        //         child: ListView.builder(
        //           itemCount: get_process_cubit.MapOfProcess.length,
        //           itemBuilder: (context, index) => Container(
        //             child: Row(
        //               children: [
        //                 Text(
        //                   "اسم الشركه" +
        //                       get_process_cubit.MapOfProcess[index]
        //                               ["CompanyName"]
        //                           .toString(),
        //                 ),
        //                 SizedBox(
        //                   width: 10,
        //                 ),
        //                 Text(
        //                   "رقم عمليات الشراء او البيع" +
        //                       get_process_cubit.MapOfProcess[index]
        //                               ["NumberOfProcess"]
        //                           .toString(),
        //                 ),
        //                 SizedBox(
        //                   width: 10,
        //                 ),
        //                 Text(
        //                   "تم شراء منهم ب " +
        //                       get_process_cubit.MapOfProcess[index]["Pay"]
        //                           .toString(),
        //                 ),
        //                 SizedBox(
        //                   width: 10,
        //                 ),
        //                 Text(
        //                   "تم بيع ليهم ب" +
        //                       get_process_cubit.MapOfProcess[index]["Sale"]
        //                           .toString(),
        //                 ),
        //                 SizedBox(
        //                   width: 10,
        //                 ),
        //                 Text("الربح" +
        //                     (double.parse(get_process_cubit.MapOfProcess[index]
        //                                     ["Sale"]
        //                                 .toString()) -
        //                             double.parse(get_process_cubit
        //                                 .MapOfProcess[index]["Pay"]))
        //                         .toString()),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }

  Map<int, TableColumnWidth> _getColumnWidths() {
    return {
      0: FixedColumnWidth(100.0), // Customize the width of column 0
      1: FixedColumnWidth(150.0), // Customize the width of column 1
      2: FixedColumnWidth(120.0), // Customize the width of column 2
      // Add more entries for additional columns
    };
  }
}
