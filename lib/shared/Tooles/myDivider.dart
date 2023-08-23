import 'package:flutter/material.dart';

// Widget myDivider({required Color color, required double height}) => Padding(
//       padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20),
//       child: Container(
//         width: double.infinity,
//         height: height,
//         color: color,
//       ),
//     );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.white,
      ),
    );
