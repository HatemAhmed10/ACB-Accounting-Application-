import 'package:acb/models/1Company_Model/company_model.dart';
import 'package:acb/models/2Process_Model/process_model.dart';
import 'package:acb/presentation/screens/0Splash_Screen/splash_view.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CompanyModelAdapter());
  await Hive.openBox<Company_Model>(kCompanyBox);

  Hive.registerAdapter(ProcessModelAdapter());
  await Hive.openBox<Process_Model>(kProcessBox);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashView(),
    );
  }
}
