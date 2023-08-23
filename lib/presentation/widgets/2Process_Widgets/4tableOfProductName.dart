import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/shared/Tooles/CustomTextFormField.dart';
import 'package:acb/shared/Tooles/NumberFormat.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableOfProductName extends StatelessWidget {
  TableOfProductName({super.key, required this.company_model});
  final Company_Model company_model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Get_Process_Cubit, ProcessStates>(
      builder: (context, state) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;

        Get_Process_Cubit get_process_cubit = Get_Process_Cubit.get(context);
        TextEditingController ProductName_Controller = TextEditingController();

        return Container(
          color: secondaryColor,
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              width: 250,
                              margin: EdgeInsets.only(
                                  top: 6, bottom: 6, left: 28, right: 28),
                              child: CustomTextFormField(
                                keyboardType: TextInputType.text,
                                textEditingController: ProductName_Controller,
                                HintText: "اسم المنتج",
                                icons: Icons.title,
                                validatorFunctoion: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              child: IconButton(
                                onPressed: () {
                                  get_process_cubit.fetchDataUsingProductName(
                                    CompanyID: company_model.CompanyID,
                                    ProductName: ProductName_Controller.text
                                        .toUpperCase()
                                        .toString(),
                                  );
                                  print(ProductName_Controller.text.toString());
                                },
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      get_process_cubit.ProductName_process.isEmpty
                          ? Text("لا يوجد")
                          : Directionality(
                              textDirection: TextDirection.rtl,
                              child: SingleChildScrollView(
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
                                          defaultColumnWidth:
                                              FixedColumnWidth(80.0),
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
                                            for (var item in get_process_cubit
                                                .ProductName_process)
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
                                                        customFormat.format(
                                                            double.parse(item
                                                                    .ProductPrice
                                                                .toString())),

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
                                                        customFormat.format(
                                                            double.parse(item
                                                                    .LateMoney
                                                                .toString())),

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
                                                  //       customFormat.format(
                                                  //           double.parse(
                                                  //               item.ProductPrice
                                                  //                   .toString())),
                                                  //       // item.ProductPrice
                                                  //       //     .toString(),
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
                                                        item.CompanyOwner
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            TableRow(
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      get_process_cubit
                                                          .ProductName_process
                                                          .length
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Center(
                                                    child: Text(
                                                      get_process_cubit
                                                              .ProductNameResult
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Center(
                                                    child: Text(
                                                      get_process_cubit
                                                              .ProductLateMoeny
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Center(
                                                    child: Text(''),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: Center(
                                                    child: Text(''),
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
                            ),

                      // : Container(
                      //     color: Colors.blue,
                      //     height: 200,
                      //     width: double.infinity,
                      //     child: Column(
                      //       children: [
                      //         Table(
                      //           border: TableBorder.all(),
                      //           defaultColumnWidth: FixedColumnWidth(80.0),
                      //           children: [
                      //             TableRow(
                      //               children: [
                      //                 TableCell(
                      //                   child: Container(
                      //                     alignment: Alignment.center,
                      //                     color: Colors.yellow,
                      //                     child: Text('Process Name'),
                      //                   ),
                      //                 ),
                      //                 TableCell(
                      //                   child: Center(
                      //                     child: Text('Process Price'),
                      //                   ),
                      //                 ),
                      //                 TableCell(
                      //                   child: Center(
                      //                     child: Text('Process Date'),
                      //                   ),
                      //                 ),
                      //                 TableCell(
                      //                   child: Center(
                      //                     child: Text('Company Owner'),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             for (var item in get_process_cubit
                      //                 .ProductName_process)
                      //               TableRow(
                      //                 children: [
                      //                   TableCell(
                      //                     child: Center(
                      //                       child: Text(item.ProductName),
                      //                     ),
                      //                   ),
                      //                   TableCell(
                      //                     child: Center(
                      //                       child: Text(
                      //                           item.ProductPrice.toString()),
                      //                     ),
                      //                   ),
                      //                   TableCell(
                      //                     child: Center(
                      //                       child: Text(
                      //                           item.DateProcess.toString()),
                      //                     ),
                      //                   ),
                      //                   TableCell(
                      //                     child: Center(
                      //                       child: Text(
                      //                           item.CompanyOwner.toString()),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             TableRow(
                      //               children: [
                      //                 TableCell(
                      //                   child: Container(
                      //                     alignment: Alignment.center,
                      //                     color: Colors.yellow,
                      //                     child: Text(get_process_cubit
                      //                         .ProductName_process.length
                      //                         .toString()),
                      //                   ),
                      //                 ),
                      //                 TableCell(
                      //                   child: Center(
                      //                     child: Text(get_process_cubit
                      //                         .ProductNameResult.toString()),
                      //                   ),
                      //                 ),
                      //                 TableCell(
                      //                   child: Center(
                      //                     child: Text(''),
                      //                   ),
                      //                 ),
                      //                 TableCell(
                      //                   child: Center(
                      //                     child: Text(''),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
