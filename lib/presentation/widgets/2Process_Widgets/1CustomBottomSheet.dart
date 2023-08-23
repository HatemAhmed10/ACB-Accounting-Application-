// ignore_for_file: unused_local_variable

import 'package:acb/business_logic/Process_Cubit/Add_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/models/2Process_Model/process_model.dart';
import 'package:acb/presentation/screens/2Process_Screen/Process_View.dart';
import 'package:acb/shared/Tooles/CustomTextFormField.dart';
import 'package:acb/shared/Tooles/DateTimePickerWidget%20.dart';
import 'package:acb/shared/Tooles/routes.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

void CustomProcessBottomSheet(
    {required BuildContext context, required Company_Model company_model}) {
  TextEditingController ProductName_Controller = TextEditingController();
  TextEditingController ProductPrice_Controller = TextEditingController();
  TextEditingController CompanyOwner_Controller = TextEditingController();
  TextEditingController LateMoeny_Controller = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (BuildContext context) {
      double screenHeight = MediaQuery.of(context).size.height;
      final formKey = GlobalKey<FormState>();
      return BlocProvider(
        create: (context) => Add_Process_Cubit(),
        child: Container(
          height: screenHeight * 0.8,
          color: secondaryColor,
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                // key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.text,
                        textEditingController: ProductName_Controller,
                        HintText: "اسم المنتج",
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
                      child: CustomTextFormField(
                        keyboardType: TextInputType.phone,
                        textEditingController: ProductPrice_Controller,
                        HintText: "سعر المنتج",
                        icons: Icons.price_change_rounded,
                        validatorFunctoion: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل سعر المنتج';
                          } else if (num.tryParse(value) == null) {
                            return 'ادخل سعر المنتج';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.phone,
                        textEditingController: LateMoeny_Controller,
                        HintText: "مبلغ اجل",
                        icons: Icons.price_change_rounded,
                        validatorFunctoion: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل سعر المنتج';
                          } else if (num.tryParse(value) == null) {
                            return 'ادخل سعر المنتج';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.text,
                        textEditingController: CompanyOwner_Controller,
                        HintText: "اسم المشتري",
                        icons: Icons.location_city_sharp,
                        validatorFunctoion: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'اسم المشتري';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        DateTimePickerWidget(),
                        Spacer(),
                        Container(
                          child: BlocBuilder<Add_Process_Cubit, ProcessStates>(
                            builder: (context, state) {
                              Add_Process_Cubit add_process_cubit =
                                  Add_Process_Cubit.get(context);
                              return Container(
                                // color: Colors.white,
                                width: 110,
                                height: 60,
                                child: DropdownButton<String>(
                                  dropdownColor: secondaryColor,
                                  value: add_process_cubit.selectedValue,
                                  onChanged: (newValue) {
                                    add_process_cubit.updateSelectedValue(
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
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(
                          top: 6, bottom: 6, left: 28, right: 28),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: BlocConsumer<Add_Process_Cubit, ProcessStates>(
                        listener: (context, state) {
                          if (state is AddProcessSuccess) {
                            Navigator.pop(context);
                            navigateToAndReplacement(
                                context,
                                Process_View(
                                  company_model: company_model,
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('تمت العمليه بنجاح'),
                                duration: Duration(seconds: 3),
                                backgroundColor:
                                    kPrimaryColor, // Set the background color of the snackbar here
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          Add_Process_Cubit add_process_cubit =
                              Add_Process_Cubit.get(context);

                          return MaterialButton(
                            // minWidth: 150,
                            height: 60,
                            onPressed: () {
                              add_process_cubit.addProcess(
                                process_model: Process_Model(
                                  ProcessID: generateRandomId(),
                                  CompanyID: company_model.CompanyID.toString(),
                                  DateProcess: add_process_cubit.selectedDate,
                                  ProductName:
                                      ProductName_Controller.text.toUpperCase(),
                                  ProductPrice: ProductPrice_Controller.text
                                      .toUpperCase(),
                                  CompanyOwner: CompanyOwner_Controller.text
                                      .toUpperCase(),
                                  TypeProcess: add_process_cubit.selectedValue
                                      .toUpperCase(),
                                  LateMoney:
                                      LateMoeny_Controller.text.toUpperCase(),
                                ),
                              );

                              // if (formKey.currentState!.validate()) {
                              //   add_process_cubit.addProcess(
                              //     process_model: Process_Model(
                              //       ProcessID: generateRandomId(),
                              //       CompanyID:
                              //           company_model.CompanyID.toString(),
                              //       DateProcess: add_process_cubit.selectedDate,
                              //       ProductName: ProductName_Controller.text
                              //           .toUpperCase(),
                              //       ProductPrice: ProductPrice_Controller.text
                              //           .toUpperCase(),
                              //       CompanyOwner: CompanyOwner_Controller.text
                              //           .toUpperCase(),
                              //       TypeProcess: add_process_cubit.selectedValue
                              //           .toUpperCase(),
                              //     ),
                              //   );
                              // }
                            },
                            child: Text(
                              "اضافه عمليه".toUpperCase(),
                              style:
                                  TextStyle(color: Colors.yellow, fontSize: 20),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

String generateRandomId() {
  var uuid = const Uuid();
  return uuid.v4();
}
