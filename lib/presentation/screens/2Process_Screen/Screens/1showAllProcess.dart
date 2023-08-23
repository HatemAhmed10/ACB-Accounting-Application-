import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/presentation/screens/4Update_Process/update_process_view.dart';
import 'package:acb/shared/Tooles/NumberFormat.dart';
import 'package:acb/shared/Tooles/routes.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class showAllProcess extends StatelessWidget {
  const showAllProcess({super.key});

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
          body: Container(
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
                    "جدول العمليات",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: get_process_cubit.process.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: secondaryColor,
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  get_process_cubit.process[index].LateMoney ==
                                          "0"
                                      ? kBackGrounBlackdAny
                                      : Colors.red.withOpacity(0.2),
                              // color: kBackGrounBlackdAny,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: ListTile(
                              onTap: () {
                                navigateTo(
                                    context,
                                    Update_Process_View(
                                      company_model:
                                          get_process_cubit.company_model!,
                                      process_model:
                                          get_process_cubit.process[index],
                                    ));
                              },
                              leading: Container(
                                width: 70,
                                child: get_process_cubit
                                        .process[index].TypeProcess
                                        .contains("PAY")
                                    ? Text(
                                        "ايرادات",
                                        style: TextStyle(
                                          color: Color(0xFFFFC727),
                                        ),
                                      )
                                    : Text(
                                        "مصروفات",
                                        style: TextStyle(
                                          color: Color(0xFFFFC727),
                                        ),
                                      ),
                              ),
                              trailing: Container(
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color: Color(0xFFFFC727),
                                  ),
                                ),
                              ),
                              subtitle: Container(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          textDirection: TextDirection.rtl,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          "الي ${get_process_cubit.process[index].CompanyOwner.toString()}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFFFC727),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          textDirection: TextDirection.rtl,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          "${get_process_cubit.process[index].DateProcess.year} / ${get_process_cubit.process[index].DateProcess.month} / ${get_process_cubit.process[index].DateProcess.day}",
                                          style: TextStyle(
                                            color: Color(0xFFFFC727),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              title: Container(
                                // color: Colors.red,
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        textDirection: TextDirection.rtl,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        "${get_process_cubit.process[index].ProductName.toString()}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFFFFC727),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "${customFormat.format(double.parse(get_process_cubit.process[index].ProductPrice.toString()))} / ",
                                              // "${get_process_cubit.process[index].ProductPrice.toString()} / ",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFFFFC727),
                                              ),
                                            ),
                                            Text(
                                              "${customFormat.format(double.parse(get_process_cubit.process[index].LateMoney.toString()))}",
                                              // "${get_process_cubit.process[index].LateMoney.toString()}",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // child: Container(
                        //   color: Colors.yellow,
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         flex: 2,
                        //         child: Text(get_process_cubit
                        //             .process[index].CompanyOwner
                        //             .toString()),
                        //       ),
                        //       Expanded(
                        //         flex: 1,
                        //         child: Text(get_process_cubit.process[index].TypeProcess
                        //             .toString()),
                        //       ),
                        //       Expanded(
                        //         flex: 1,
                        //         child: Text(get_process_cubit
                        //             .process[index].ProductPrice
                        //             .toString()),
                        //       ),
                        //       Expanded(
                        //         flex: 2,
                        //         child: Text(
                        //             "${get_process_cubit.process[index].DateProcess.year} / ${get_process_cubit.process[index].DateProcess.month} / ${get_process_cubit.process[index].DateProcess.day}"),
                        //       ),
                        //       Expanded(
                        //         flex: 2,
                        //         child: Text(get_process_cubit.process[index].ProductName
                        //             .toString()),
                        //       ),
                        //       CircleAvatar(
                        //         child: Text((index + 1).toString()),
                        //       ),
                        //     ],
                        //   ),
                        //   // child: Center(
                        //   //   child: InkWell(
                        //   //     onTap: () {},
                        //   //     child: Container(
                        //   //       color: Colors.red,
                        //   //       child: Row(
                        //   //         children: [
                        //   //           Text(
                        //   //             get_process_cubit.process[index].ProductName
                        //   //                 .toString(),
                        //   //           ),
                        //   //           SizedBox(
                        //   //             width: 20,
                        //   //           ),
                        //   //           Text(
                        //   //             get_process_cubit.process[index].DateProcess
                        //   //                 .toString(),
                        //   //           ),
                        //   //           SizedBox(
                        //   //             width: 20,
                        //   //           ),
                        //   //           Text(
                        //   //             get_process_cubit
                        //   //                 .process[index].ProductPrice
                        //   //                 .toString(),
                        //   //           ),
                        //   //           SizedBox(
                        //   //             width: 20,
                        //   //           ),
                        //   //           Text(
                        //   //             get_process_cubit.process[index].TypeProcess
                        //   //                 .toString(),
                        //   //           ),
                        //   //           SizedBox(
                        //   //             width: 20,
                        //   //           ),
                        //   //           Text(
                        //   //             get_process_cubit
                        //   //                 .process[index].CompanyOwner
                        //   //                 .toString(),
                        //   //           ),
                        //   //         ],
                        //   //       ),
                        //   //     ),
                        //   //   ),
                        //   // ),
                        // ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
