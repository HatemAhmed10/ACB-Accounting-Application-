import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/shared/Tooles/DateTimePickerWidget2.dart';
import 'package:acb/shared/Tooles/NumberFormat.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableOFMonthProcess extends StatelessWidget {
  const TableOFMonthProcess({super.key});

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
                    "تحليل شهر واحد فقط",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                            defaultColumnWidth: FixedColumnWidth(80.0),
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'اسم المنتج',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'تم دفع',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'الاجل',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'التاريخ',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'المشتري',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              for (var item
                                  in get_process_cubit.One_Month_All_process)
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          item.ProductName,
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          // numberFormat.format(
                                          //     item.ProductPrice.toString()),
                                          customFormat.format(double.parse(
                                              item.ProductPrice.toString())),

                                          // item.ProductPrice.toString(),

                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          // numberFormat.format(
                                          //     item.ProductPrice.toString()),
                                          customFormat.format(double.parse(
                                              item.LateMoney.toString())),

                                          // item.ProductPrice.toString(),

                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // TableCell(
                                    //   child: Center(
                                    //     child: Text(
                                    //       customFormat.format(double.parse(
                                    //         item.ProductPrice.toString(),
                                    //       )),
                                    //       // item.ProductPrice.toString(),
                                    //       style: TextStyle(
                                    //         color: Colors.blue,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),

                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          "${item.DateProcess.year.toString()}/${item.DateProcess.month.toString()}/${item.DateProcess.day.toString()}",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Center(
                                        child: Text(
                                          item.CompanyOwner.toString(),
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

                // SingleChildScrollView(
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Container(
                //       color: Color(0xFFFFC727),
                //       child: SingleChildScrollView(
                //         scrollDirection: Axis.horizontal,
                //         child: Directionality(
                //           textDirection: TextDirection.rtl,
                //           child: Table(
                //             border: TableBorder.all(),
                //             defaultColumnWidth: FixedColumnWidth(100.0),
                //             children: [
                //               TableRow(
                //                 children: [
                //                   TableCell(
                //                     child: Container(
                //                       alignment: Alignment.center,
                //                       child: Text(
                //                         "اسم الشركه",
                //                         style: TextStyle(
                //                           color: Colors.red,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   TableCell(
                //                     child: Center(
                //                       child: Text(
                //                         "رقم عمليات ",
                //                         style: TextStyle(
                //                           color: Colors.red,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   TableCell(
                //                     child: Center(
                //                       child: Text(
                //                         "تم شراء منهم ب ",
                //                         style: TextStyle(
                //                           color: Colors.red,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   TableCell(
                //                     child: Center(
                //                       child: Text(
                //                         "تم بيع ليهم ب",
                //                         style: TextStyle(
                //                           color: Colors.red,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   TableCell(
                //                     child: Center(
                //                       child: Text(
                //                         "الربح",
                //                         style: TextStyle(
                //                           color: Colors.red,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               for (int index = 0;
                //                   index <
                //                       get_process_cubit
                //                           .One_Month_All_process.length;
                //                   index++)
                //                 TableRow(
                //                   children: [
                //                     TableCell(
                //                       child: Center(
                //                         child: Text(
                //                           get_process_cubit.MapOfProcess[index]
                //                                   ["CompanyName"]
                //                               .toString(),
                //                           style: TextStyle(
                //                             color: Colors.blue,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     TableCell(
                //                       child: Center(
                //                         child: Text(
                //                           get_process_cubit.MapOfProcess[index]
                //                                   ["NumberOfProcess"]
                //                               .toString(),
                //                           style: TextStyle(
                //                             color: Colors.blue,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     TableCell(
                //                       child: Center(
                //                         child: Text(
                //                           get_process_cubit.MapOfProcess[index]
                //                                   ["Pay"]
                //                               .toString(),
                //                           style: TextStyle(
                //                             color: Colors.blue,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     TableCell(
                //                       child: Center(
                //                         child: Text(
                //                           get_process_cubit.MapOfProcess[index]
                //                                   ["Sale"]
                //                               .toString(),
                //                           style: TextStyle(
                //                             color: Colors.blue,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     TableCell(
                //                       child: Center(
                //                         child: Text(
                //                           (double.parse(get_process_cubit
                //                                       .MapOfProcess[index]
                //                                           ["Sale"]
                //                                       .toString()) -
                //                                   double.parse(get_process_cubit
                //                                           .MapOfProcess[index]
                //                                       ["Pay"]))
                //                               .toString(),
                //                           style: TextStyle(
                //                             color: Colors.blue,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
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
