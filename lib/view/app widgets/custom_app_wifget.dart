// import 'package:downloader/constant/app_theme.dart';
// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton(
//       {Key? key,
//       required this.title,
//       this.color,
//       this.onClick,
//       this.alignment,
//       this.padding,
//       this.width = 0.32,
//       this.heigth = 0.055,
//       this.textSize = 0.039})
//       : super(key: key);
//   final title;
//   final color;
//   final onClick;
//   final double width;
//   final double heigth;
//   final double textSize;
//   final AlignmentGeometry? alignment;
//   final EdgeInsetsGeometry? padding;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onClick,
//       child: Padding(
//         padding: padding ?? const EdgeInsets.only(),
//         child: Align(
//           alignment: alignment ?? Alignment.center,
//           child: Container(
//             width: MediaQuery.of(context).size.width * width,
//             height: MediaQuery.of(context).size.height * heigth,
//             decoration: BoxDecoration(
//                 border: Border.all(color: AppTheme.buttonColor, width: 2),
//                 borderRadius: BorderRadius.circular(6.0),
//                 color: color),
//             child: Center(
//               child: Text(
//                 "$title",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: AppTheme.myTextColor,
//                     fontWeight: FontWeight.w500,
//                     fontSize: MediaQuery.of(context).size.width * textSize),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
