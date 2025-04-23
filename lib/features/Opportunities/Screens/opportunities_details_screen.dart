// import 'package:flutter/material.dart';
// import 'package:y2y/core/styling/app_colors.dart';
// import 'package:y2y/core/widges/app_bar_widget.dart';
// import 'package:y2y/core/widges/elvated_button_widget.dart';
// import 'package:y2y/features/Bottom%20Navigation%20Bar/Screens/home_screen.dart';
// import 'package:y2y/features/Opportunities/model/get_all_opportunties_model.dart';

// class Opportunitiesdetils extends StatefulWidget {
//   final GetAllOpportunties opportunity;
//   const Opportunitiesdetils({super.key, required this.opportunity});

//   @override
//   State<Opportunitiesdetils> createState() => _OpportunitiesdetilsState();
// }

// class _OpportunitiesdetilsState extends State<Opportunitiesdetils> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(kToolbarHeight),
//           child: AppBarWidget()),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 15,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(
//                             Icons.cancel_outlined,
//                             color: cornflowerblue,
//                           )),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CircleAvatar(
//                         backgroundImage:
//                             MemoryImage(widget.opportunity.image ?? ''),
//                         radius: 45,
//                       ),
//                       Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.opportunity.title ?? '',
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   color: cornflowerblue,
//                                   fontWeight: FontWeight.w700,
//                                   fontFamily: "Montserrat"),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "at ${widget.opportunity.companymodeldetils}",
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       color: cornflowerblue,
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: "Roboto"),
//                                 ),
//                                 SizedBox(
//                                   width: 20,
//                                 ),
//                                 Chip(
//                                   side: BorderSide(color: white),
//                                   padding: EdgeInsets.all(0),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50)),
//                                   label: Text(
//                                     widget.opportunity.caregory,
//                                     style: TextStyle(
//                                       fontFamily: "Roboto",
//                                       fontWeight: FontWeight.w800,
//                                     ),
//                                   ),
//                                   labelStyle: TextStyle(color: white),
//                                   color: WidgetStatePropertyAll(cornflowerblue),
//                                 ),
//                               ],
//                             ),
//                           ]),
//                       SizedBox(
//                         width: 10,
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     color: purple,
//                     thickness: 0.8,
//                   ),
//                   Text(
//                     "Posted at : 03:40am Tue 21/01/2025",
//                     style: TextStyle(
//                         fontSize: 10,
//                         color: cornflowerblue,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: "Roboto"),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Company:",
//                         style: TextStyle(
//                             fontSize: 14,
//                             color: cornflowerblue,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "Roboto"),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         widget.opportunity.companymodeldetils,
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: cornflowerblue,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: "Roboto"),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     "Description:",
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: cornflowerblue,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: "Roboto"),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     widget.opportunity.descriptionmodeldetils,
//                     style: TextStyle(
//                         fontSize: 13,
//                         color: cornflowerblue,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: "Roboto"),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     "Responsibilities::",
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: cornflowerblue,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: "Roboto"),
//                   ),
//                   Text(
//                     widget.opportunity.responsibilitiesmodeldetils,
//                     style: TextStyle(
//                         fontSize: 13,
//                         color: cornflowerblue,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: "Roboto"),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     "Requirements:",
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: cornflowerblue,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: "Roboto"),
//                   ),
//                   Text(
//                     widget.opportunity.requirementsmodeldetils,
//                     style: TextStyle(
//                         fontSize: 13,
//                         color: cornflowerblue,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: "Roboto"),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Duration:",
//                         style: TextStyle(
//                             fontSize: 14,
//                             color: cornflowerblue,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "Roboto"),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         widget.opportunity.durationmodeldetils,
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: cornflowerblue,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: "Roboto"),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Application Deadline:",
//                         style: TextStyle(
//                             fontSize: 14,
//                             color: cornflowerblue,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: "Roboto"),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         widget.opportunity.applicationdeadlinemodeldetils,
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: cornflowerblue,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: "Roboto"),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                       width: double.infinity,
//                       child: ElvatedButtonWidget(
//                         text: 'Apply',
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const Homepage(),
//                               ));
//                         },
//                         color: white,
//                         backgroundColor: WidgetStatePropertyAll(green),
//                       )),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
