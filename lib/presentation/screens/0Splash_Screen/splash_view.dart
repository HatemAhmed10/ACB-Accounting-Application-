import 'dart:async';
import 'package:acb/presentation/screens/1Company_Screen/company_view.dart';
import 'package:acb/presentation/widgets/0shared/background.dart';
import 'package:acb/shared/Tooles/routes.dart';
import 'package:acb/shared/styles/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

// ignore: must_be_immutable
class SplashView extends StatefulWidget {
  SplashView();

  // const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _SplashViewState();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    navigateAndFinish(context, company_view());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.defaultBlackColor3,
      body: Background(
        child: Center(
            child: Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage(ImageAssets.main_top), fit: BoxFit.fill),
          // ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeInDown(
                  child: Container(
                      // color: Colors.yellow,
                      height: 450,
                      width: 400,
                      child: Image(image: AssetImage(ImageAssets.Business))),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInLeft(
                        child: Container(
                          // color: Colors.red,
                          child: Text(
                            "A",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      FadeInDown(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            // color: Colors.green,
                            child: Text(
                              "C",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeInRight(
                        child: Container(
                          // color: Colors.blue,
                          child: Text(
                            "B",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
