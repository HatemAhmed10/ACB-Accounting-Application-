import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/shared/Tooles/NumberFormat.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableOfSales extends StatelessWidget {
  const TableOfSales({super.key});

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
                    "جدول المصروفات",
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
                              for (var item in get_process_cubit.Sale_process)
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
                                    //           item.ProductPrice.toString())),
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
              ],
            ),
          ),
        );

        // return Container(
        //   color: Colors.blue,
        //   height: 400,
        //   width: double.infinity,
        //   child: Column(
        //     children: [
        //       Center(
        //         child: Text("جدول ال Sale"),
        //       ),
        //       Table(
        //         border: TableBorder.all(),
        //         defaultColumnWidth: FixedColumnWidth(120.0),
        //         children: [
        //           TableRow(
        //             children: [
        //               TableCell(
        //                 child: Container(
        //                   alignment: Alignment.center,
        //                   color: Colors.yellow,
        //                   child: Text('Process Name'),
        //                 ),
        //               ),
        //               TableCell(
        //                 child: Center(
        //                   child: Text('Process Price'),
        //                 ),
        //               ),
        //               TableCell(
        //                 child: Center(
        //                   child: Text('Process Date'),
        //                 ),
        //               ),
        //               TableCell(
        //                 child: Center(
        //                   child: Text('Company Owner'),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           for (var item in get_process_cubit.Sale_process)
        //             TableRow(
        //               children: [
        //                 TableCell(
        //                   child: Center(
        //                     child: Text(item.ProductName),
        //                   ),
        //                 ),
        //                 TableCell(
        //                   child: Center(
        //                     child: Text(item.ProductPrice.toString()),
        //                   ),
        //                 ),
        //                 TableCell(
        //                   child: Center(
        //                     child: Text(item.DateProcess.toString()),
        //                   ),
        //                 ),
        //                 TableCell(
        //                   child: Center(
        //                     child: Text(item.CompanyOwner.toString()),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //         ],
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
