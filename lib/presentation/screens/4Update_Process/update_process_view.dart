import 'package:acb/business_logic/Company_Cubit/Add_company_cubit.dart';
import 'package:acb/business_logic/Company_Cubit/company_state.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/business_logic/Process_Cubit/Update_Process_Cubit.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/models/2Process_Model/process_model.dart';
import 'package:acb/presentation/screens/1Company_Screen/company_view.dart';
import 'package:acb/presentation/screens/2Process_Screen/Process_View.dart';
import 'package:acb/presentation/widgets/4Update_Process_View/1CustomTextFormField.dart';
import 'package:acb/presentation/widgets/4Update_Process_View/2DateTimePickerWidgetToUpdate.dart';
import 'package:acb/shared/Tooles/4CustomshowToast.dart';
import 'package:acb/shared/Tooles/CustomTextFormField.dart';
import 'package:acb/shared/Tooles/CustomshowDialog.dart';
import 'package:acb/shared/Tooles/routes.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class Update_Process_View extends StatelessWidget {
  Update_Process_View(
      {super.key, required this.company_model, required this.process_model});
  final Company_Model company_model;
  final Process_Model process_model;
  TextEditingController ProductName_Controller = TextEditingController();
  TextEditingController ProductPrice_Controller = TextEditingController();
  TextEditingController CompanyOwner_Controller = TextEditingController();
  TextEditingController LateMoeny_Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProductName_Controller.text = process_model.ProductName;
    ProductPrice_Controller.text = process_model.ProductPrice;
    CompanyOwner_Controller.text = process_model.CompanyOwner;
    LateMoeny_Controller.text = process_model.LateMoney;

    final formKey = GlobalKey<FormState>();
    double resultOfNewPay = 0;
    return Scaffold(
      body: Container(
        height: double.infinity,
        // height: screenHeight,
        // width: screenWidth,
        color: secondaryColor,
        child: BlocProvider(
          create: (context) => Update_Process_Cubit(),
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      child: CustomTextFormFieldByinitialValue(
                        keyboardType: TextInputType.text,
                        textEditingController: ProductName_Controller,
                        HintText: ProductName_Controller.text,
                        icons: Icons.title,
                        validatorFunctoion: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'اكتب اسم المنتح';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      child: CustomTextFormFieldByinitialValue(
                        keyboardType: TextInputType.phone,
                        textEditingController: ProductPrice_Controller,
                        HintText: ProductPrice_Controller.text,
                        icons: Icons.price_change_rounded,
                        validatorFunctoion: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل مبلغ الذي تم دفعه';
                          } else if (num.tryParse(value) == null) {
                            return 'ادخل مبلغ الذي تم دفعه';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      child: CustomTextFormFieldByinitialValue(
                        onChangedFunctoion: (String value) {
                          if (value == "") {
                            value = "0";
                          }

                          if (double.parse(process_model.LateMoney) <
                              double.parse(value)) {
                            ProductPrice_Controller.text =
                                process_model.ProductPrice;
                            showToast(
                                state: ToastStates.WARNING,
                                text: 'يجب ان يكون المبلغ الداخل اقل من الاصل');
                          } else {
                            ProductPrice_Controller.text =
                                process_model.ProductPrice;
                            resultOfNewPay =
                                double.parse(process_model.LateMoney) -
                                    double.parse(value);
                            ProductPrice_Controller.text =
                                (double.parse(ProductPrice_Controller.text) +
                                        resultOfNewPay)
                                    .toString();
                          }
                        },
                        keyboardType: TextInputType.phone,
                        textEditingController: LateMoeny_Controller,
                        HintText: LateMoeny_Controller.text,
                        icons: Icons.price_change_rounded,
                        validatorFunctoion: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل المبلغ الماجل ';
                          } else if (num.tryParse(value) == null) {
                            return 'ادخل المبلغ الماجل';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      child: CustomTextFormFieldByinitialValue(
                        keyboardType: TextInputType.text,
                        textEditingController: CompanyOwner_Controller,
                        HintText: CompanyOwner_Controller.text,
                        icons: Icons.location_city_sharp,
                        validatorFunctoion: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'اسم المشتري';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        DateTimePickerWidgetToUpdate(),
                        Spacer(),
                        Container(
                          child:
                              BlocBuilder<Update_Process_Cubit, ProcessStates>(
                            builder: (context, state) {
                              Update_Process_Cubit update_process_cubit =
                                  Update_Process_Cubit.get(context);
                              return Container(
                                // color: Colors.white,
                                width: 110,
                                height: 60,
                                child: DropdownButton<String>(
                                  dropdownColor: secondaryColor,
                                  value: update_process_cubit.selectedValue,
                                  onChanged: (newValue) {
                                    update_process_cubit.updateSelectedValue(
                                        newValue.toString());
                                  },
                                  items: <String>["Pay", "Sela"]
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value == "Pay" ? "ايرادات" : "مصروفات",
                                        style: TextStyle(
                                          color: Color(0xFFFFC727),
                                          fontSize: 20,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: BlocConsumer<Update_Process_Cubit, ProcessStates>(
                        listener: (context, state) {
                          if (state is UpdateProcessstate) {
                            Navigator.pop(context);
                            navigateToAndReplacement(
                                context,
                                Process_View(
                                  company_model: company_model,
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('تمت التحديث بنجاح'),
                                duration: Duration(seconds: 3),
                                backgroundColor:
                                    kPrimaryColor, // Set the background color of the snackbar here
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          Update_Process_Cubit update_process_cubit =
                              Update_Process_Cubit.get(context);

                          return MaterialButton(
                            // minWidth: 150,
                            height: 60,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                update_process_cubit.UpdateProcess(
                                  CompanyID: company_model.CompanyID,
                                  process_model: Process_Model(
                                      ProcessID: process_model.ProcessID,
                                      CompanyID: process_model.CompanyID,
                                      ProductName: ProductName_Controller.text
                                          .toUpperCase(),
                                      DateProcess:
                                          update_process_cubit.selectedDate3,
                                      ProductPrice: ProductPrice_Controller.text
                                          .toUpperCase(),
                                      CompanyOwner: CompanyOwner_Controller.text
                                          .toUpperCase(),
                                      TypeProcess: update_process_cubit
                                          .selectedValue
                                          .toUpperCase(),
                                      LateMoney: LateMoeny_Controller.text
                                          .toUpperCase()),
                                );

                                // add_process_cubit.addProcess(
                                //   process_model: Process_Model(
                                //     ProcessID: generateRandomId(),
                                //     CompanyID:
                                //         company_model.CompanyID.toString(),
                                //     DateProcess: add_process_cubit.selectedDate,
                                //     ProductName: ProductName_Controller.text
                                //         .toUpperCase(),
                                //     ProductPrice: ProductPrice_Controller.text
                                //         .toUpperCase(),
                                //     CompanyOwner: CompanyOwner_Controller.text
                                //         .toUpperCase(),
                                //     TypeProcess: add_process_cubit.selectedValue
                                //         .toUpperCase(),
                                //     LateMoney:
                                //         LateMoeny_Controller.text.toUpperCase(),
                                //   ),
                                // );
                              }
                            },
                            child: Text(
                              "تحديث عمليه".toUpperCase(),
                              style:
                                  TextStyle(color: Colors.yellow, fontSize: 20),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    BlocConsumer<Update_Process_Cubit, ProcessStates>(
                      listener: (context, state) {
                        if (state is DelateProcessSuccess) {
                          Navigator.pop(context);
                          navigateToAndReplacement(
                              context,
                              Process_View(
                                company_model: company_model,
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('تمت الحذف بنجاح'),
                              duration: Duration(seconds: 3),
                              backgroundColor:
                                  kPrimaryColor, // Set the background color of the snackbar here
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        Update_Process_Cubit update_process_cubit =
                            Update_Process_Cubit.get(context);

                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomshowDialog(
                                  message:
                                      "هل تريد مسح ${process_model.ProductName.toString()}",
                                  onPressedOK: () {
                                    // navigateToAndReplacement(context, SplashView());

                                    update_process_cubit.DeleteProcess(
                                      ProcessID: process_model.ProcessID,
                                      // CompanyID: product!.CompanyID,
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
                            size: 34,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String generateRandomId() {
  var uuid = const Uuid();
  return uuid.v4();
}









// import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
// import 'package:acb/business_logic/Process_Cubit/Update_Process_Cubit.dart';
// import 'package:acb/models/1Company_Model/company_model.dart';
// import 'package:acb/models/2Process_Model/process_model.dart';
// import 'package:acb/presentation/screens/2Process_Screen/Process_View.dart';
// import 'package:acb/presentation/widgets/4Update_Process_View/1CustomTextFormField.dart';
// import 'package:acb/presentation/widgets/4Update_Process_View/2DateTimePickerWidgetToUpdate.dart';
// import 'package:acb/shared/Tooles/4CustomshowToast.dart';
// import 'package:acb/shared/Tooles/routes.dart';
// import 'package:acb/shared/styles/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uuid/uuid.dart';

// class Update_Process_View extends StatelessWidget {
//   Update_Process_View(
//       {super.key, required this.company_model, required this.process_model});
//   final Company_Model company_model;
//   final Process_Model process_model;
//   TextEditingController ProductName_Controller = TextEditingController();
//   TextEditingController ProductPrice_Controller = TextEditingController();
//   TextEditingController CompanyOwner_Controller = TextEditingController();
//   TextEditingController LateMoeny_Controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     // double screenHeight = MediaQuery.of(context).size.height;
//     // double screenWidth = MediaQuery.of(context).size.width;
//     ProductName_Controller.text = process_model.ProductName;
//     ProductPrice_Controller.text = process_model.ProductPrice;
//     CompanyOwner_Controller.text = process_model.CompanyOwner;
//     LateMoeny_Controller.text = process_model.LateMoney;

//     double resultOfNewPay = 0;

//     final formKey = GlobalKey<FormState>();

//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => Update_Process_Cubit()
//           ..addDateTime(dateTime: process_model.DateProcess),
//         child: Container(
//           // height: screenHeight,
//           // width: screenWidth,
//           color: secondaryColor,
//           child: Container(
//             child: SingleChildScrollView(
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                       width: 350,
//                       margin: EdgeInsets.only(
//                           top: 6, bottom: 6, left: 28, right: 28),
//                       child: CustomTextFormFieldByinitialValue(
//                         keyboardType: TextInputType.text,
//                         textEditingController: ProductName_Controller,
//                         HintText: ProductName_Controller.text,
//                         icons: Icons.title,
//                         validatorFunctoion: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'اكتب اسم المنتح';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     Container(
//                       width: 350,
//                       margin: EdgeInsets.only(
//                           top: 6, bottom: 6, left: 28, right: 28),
//                       child: CustomTextFormFieldByinitialValue(
//                         keyboardType: TextInputType.phone,
//                         textEditingController: ProductPrice_Controller,
//                         HintText: ProductPrice_Controller.text,
//                         icons: Icons.price_change_rounded,
//                         validatorFunctoion: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'ادخل مبلغ الذي تم دفعه';
//                           } else if (num.tryParse(value) == null) {
//                             return 'ادخل مبلغ الذي تم دفعه';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     Container(
//                       width: 350,
//                       margin: EdgeInsets.only(
//                           top: 6, bottom: 6, left: 28, right: 28),
//                       child: CustomTextFormFieldByinitialValue(
//                         onChangedFunctoion: (String value) {
//                           if (value == "") {
//                             value = "0";
//                           }

//                           if (double.parse(process_model.LateMoney) <
//                               double.parse(value)) {
//                             ProductPrice_Controller.text =
//                                 process_model.ProductPrice;
//                             showToast(
//                                 state: ToastStates.WARNING,
//                                 text: 'يجب ان يكون المبلغ الداخل اقل من الاصل');
//                           } else {
//                             ProductPrice_Controller.text =
//                                 process_model.ProductPrice;
//                             resultOfNewPay =
//                                 double.parse(process_model.LateMoney) -
//                                     double.parse(value);
//                             ProductPrice_Controller.text =
//                                 (double.parse(ProductPrice_Controller.text) +
//                                         resultOfNewPay)
//                                     .toString();
//                           }
//                         },
//                         keyboardType: TextInputType.phone,
//                         textEditingController: LateMoeny_Controller,
//                         HintText: LateMoeny_Controller.text,
//                         icons: Icons.price_change_rounded,
//                         validatorFunctoion: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'ادخل المبلغ الماجل ';
//                           } else if (num.tryParse(value) == null) {
//                             return 'ادخل المبلغ الماجل';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     Container(
//                       width: 350,
//                       margin: EdgeInsets.only(
//                           top: 6, bottom: 6, left: 28, right: 28),
//                       child: CustomTextFormFieldByinitialValue(
//                         keyboardType: TextInputType.text,
//                         textEditingController: CompanyOwner_Controller,
//                         HintText: CompanyOwner_Controller.text,
//                         icons: Icons.location_city_sharp,
//                         validatorFunctoion: (String? value) {
//                           if (value == null || value.isEmpty) {
//                             return 'اسم المشتري';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Spacer(),
//                         DateTimePickerWidgetToUpdate(),
//                         Spacer(),
//                         Container(
//                           child:
//                               BlocBuilder<Update_Process_Cubit, ProcessStates>(
//                             builder: (context, state) {
//                               Update_Process_Cubit update_process_cubit =
//                                   Update_Process_Cubit.get(context);
//                               return Container(
//                                 // color: Colors.white,
//                                 width: 110,
//                                 height: 60,
//                                 child: DropdownButton<String>(
//                                   dropdownColor: secondaryColor,
//                                   value: update_process_cubit.selectedValue,
//                                   onChanged: (newValue) {
//                                     update_process_cubit.updateSelectedValue(
//                                         newValue.toString());
//                                   },
//                                   items: <String>["Pay", "Sela"]
//                                       .map<DropdownMenuItem<String>>(
//                                           (String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(
//                                         value == "Pay" ? "ايرادات" : "مصروفات",
//                                         style: TextStyle(
//                                           color: Color(0xFFFFC727),
//                                           fontSize: 20,
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Spacer(),
//                       ],
//                     ),
//                     Container(
//                       width: 350,
//                       margin: EdgeInsets.only(
//                           top: 6, bottom: 6, left: 28, right: 28),
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(32),
//                       ),
//                       child: BlocConsumer<Update_Process_Cubit, ProcessStates>(
//                         listener: (context, state) {
//                           if (state is UpdateProcessstate) {
//                             // Navigator.pop(context);
//                             navigateToAndReplacement(
//                                 context,
//                                 Process_View(
//                                   company_model: company_model,
//                                 ));
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('تمت التحديث بنجاح'),
//                                 duration: Duration(seconds: 3),
//                                 backgroundColor:
//                                     kPrimaryColor, // Set the background color of the snackbar here
//                               ),
//                             );
//                           }
//                         },
//                         builder: (context, state) {
//                           Update_Process_Cubit update_process_cubit =
//                               Update_Process_Cubit.get(context);

//                           return MaterialButton(
//                             // minWidth: 150,
//                             height: 60,
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 update_process_cubit.UpdateProcess(
//                                   CompanyID: company_model.CompanyID,
//                                   process_model: Process_Model(
//                                       ProcessID: process_model.ProcessID,
//                                       CompanyID: process_model.CompanyID,
//                                       ProductName: ProductName_Controller.text
//                                           .toUpperCase(),
//                                       DateProcess:
//                                           update_process_cubit.selectedDate3,
//                                       ProductPrice: ProductPrice_Controller.text
//                                           .toUpperCase(),
//                                       CompanyOwner: CompanyOwner_Controller.text
//                                           .toUpperCase(),
//                                       TypeProcess: update_process_cubit
//                                           .selectedValue
//                                           .toUpperCase(),
//                                       LateMoney: LateMoeny_Controller.text
//                                           .toUpperCase()),
//                                 );

//                                 // add_process_cubit.addProcess(
//                                 //   process_model: Process_Model(
//                                 //     ProcessID: generateRandomId(),
//                                 //     CompanyID:
//                                 //         company_model.CompanyID.toString(),
//                                 //     DateProcess: add_process_cubit.selectedDate,
//                                 //     ProductName: ProductName_Controller.text
//                                 //         .toUpperCase(),
//                                 //     ProductPrice: ProductPrice_Controller.text
//                                 //         .toUpperCase(),
//                                 //     CompanyOwner: CompanyOwner_Controller.text
//                                 //         .toUpperCase(),
//                                 //     TypeProcess: add_process_cubit.selectedValue
//                                 //         .toUpperCase(),
//                                 //     LateMoney:
//                                 //         LateMoeny_Controller.text.toUpperCase(),
//                                 //   ),
//                                 // );
//                               }
//                             },
//                             child: Text(
//                               "تحديث عمليه".toUpperCase(),
//                               style:
//                                   TextStyle(color: Colors.yellow, fontSize: 20),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
              
              
              
              
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// String generateRandomId() {
//   var uuid = const Uuid();
//   return uuid.v4();
// }
