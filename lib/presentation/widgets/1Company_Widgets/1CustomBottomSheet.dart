// import 'package:acb/business_logic/Company_Cubit/Add_company_cubit.dart';
// import 'package:acb/business_logic/Company_Cubit/company_state.dart';
// import 'package:acb/models/1Company_Model/company_model.dart';
// import 'package:acb/presentation/screens/1Company_Screen/company_view.dart';
// import 'package:acb/shared/Tooles/4CustomshowToast.dart';
// import 'package:acb/shared/Tooles/CustomTextFormField.dart';
// import 'package:acb/shared/Tooles/routes.dart';
// import 'package:acb/shared/styles/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uuid/uuid.dart';

// void CustomBottomSheet({required BuildContext context}) {
//   TextEditingController CompanyName_Controller = TextEditingController();
//   TextEditingController CompanyAdress_Controller = TextEditingController();
//   TextEditingController CompanyNumber_Controller = TextEditingController();
//   TextEditingController CompanyManager_Controller = TextEditingController();

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     useRootNavigator: true,
//     builder: (BuildContext context) {
//       double screenHeight = MediaQuery.of(context).size.height;
//       // final formKey = GlobalKey<FormState>();

//       return Container(
//         height: screenHeight * 0.9,
//         color: secondaryColor,
//         child: Container(
//           child: Form(
//             // key: formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     width: 350,
//                     margin:
//                         EdgeInsets.only(top: 6, bottom: 6, left: 28, right: 28),
//                     child: CustomTextFormField(
//                       keyboardType: TextInputType.text,
//                       textEditingController: CompanyName_Controller,
//                       HintText: "اسم الشركه",
//                       icons: Icons.title,
//                       validatorFunctoion: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'اكتب اسم الشركه';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Container(
//                     width: 350,
//                     margin:
//                         EdgeInsets.only(top: 6, bottom: 6, left: 28, right: 28),
//                     child: CustomTextFormField(
//                       keyboardType: TextInputType.text,
//                       textEditingController: CompanyAdress_Controller,
//                       HintText: "عنوان الشركه",
//                       icons: Icons.location_city,
//                       validatorFunctoion: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'اكتب عنوان الشركه';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Container(
//                     width: 350,
//                     margin:
//                         EdgeInsets.only(top: 6, bottom: 6, left: 28, right: 28),
//                     child: CustomTextFormField(
//                       keyboardType: TextInputType.phone,
//                       textEditingController: CompanyNumber_Controller,
//                       HintText: 'رقم الشركه للتواصل',
//                       icons: Icons.numbers,
//                       validatorFunctoion: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return "اكتب رقم الشركه للتواصل";
//                         } else if (num.tryParse(value) == null) {
//                           return "اكتب رقم الشركه للتواصل";
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Container(
//                     width: 350,
//                     margin:
//                         EdgeInsets.only(top: 6, bottom: 6, left: 28, right: 28),
//                     child: CustomTextFormField(
//                       keyboardType: TextInputType.text,
//                       textEditingController: CompanyManager_Controller,
//                       HintText: "اسم مدير الشركه",
//                       icons: Icons.people,
//                       validatorFunctoion: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'اكتب اسم مدير الشركه';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Container(
//                     width: 350,
//                     margin:
//                         EdgeInsets.only(top: 6, bottom: 6, left: 28, right: 28),
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(32),
//                     ),
//                     child: BlocProvider(
//                       create: (context) => Add_CompanyCubit(),
//                       child: BlocConsumer<Add_CompanyCubit, CompanyStates>(
//                         listener: (context, state) {
//                           if (state is AddcompanySuccess) {
//                             Navigator.pop(context);
//                             navigateToAndReplacement(context, company_view());

//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('تمت العمليه بنجاح'),
//                                 duration: Duration(seconds: 3),
//                                 backgroundColor:
//                                     kPrimaryColor, // Set the background color of the snackbar here
//                               ),
//                             );
//                           } else if (state is AddcompanyIsFound) {
//                             showToast(
//                                 state: ToastStates.WARNING,
//                                 text: "تم اضافه هذه الشركه من قبل");
//                           }
//                         },
//                         builder: (context, state) {
//                           Add_CompanyCubit companyCubit =
//                               Add_CompanyCubit.get(context);

//                           return MaterialButton(
//                             // minWidth: 150,
//                             height: 60,
//                             onPressed: () {
//                               companyCubit.addCompany(
//                                 companyModel: Company_Model(
//                                     CompanyID: generateRandomId(),
//                                     CompanyName: CompanyName_Controller.text
//                                         .toUpperCase(),
//                                     CompanyAdress: CompanyAdress_Controller.text
//                                         .toUpperCase(),
//                                     CompanyNumber: CompanyNumber_Controller.text
//                                         .toUpperCase(),
//                                     CompanyManager: CompanyManager_Controller
//                                         .text
//                                         .toUpperCase()),
//                               );

//                               // if (formKey.currentState!.validate()) {
//                               //   companyCubit.addCompany(
//                               //     companyModel: Company_Model(
//                               //         CompanyID: generateRandomId(),
//                               //         CompanyName: CompanyName_Controller.text
//                               //             .toUpperCase(),
//                               //         CompanyAdress: CompanyAdress_Controller
//                               //             .text
//                               //             .toUpperCase(),
//                               //         CompanyNumber: CompanyNumber_Controller
//                               //             .text
//                               //             .toUpperCase(),
//                               //         CompanyManager: CompanyManager_Controller
//                               //             .text
//                               //             .toUpperCase()),
//                               //   );
//                               // }
//                             },
//                             child: Text(
//                               "اضافه شركه".toUpperCase(),
//                               style:
//                                   TextStyle(color: Colors.yellow, fontSize: 20),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// String generateRandomId() {
//   var uuid = const Uuid();
//   return uuid.v4();
// }
