// import 'dart:convert';
// import 'dart:io';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dash/flutter_dash.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:siddhapura/controller/assign_user_controller.dart';
// import 'package:siddhapura/controller/required_machine_controller.dart';
// import 'package:siddhapura/widgets/custom_dropDown.dart';
// import '../constant/app_fonts.dart';
// import '../controller/add_enquiry_controller.dart';
// import '../controller/enquiry_source.dart';
// import '../widgets/custom_check_box.dart';
// import '../widgets/custom_dialog.dart';
// import '../widgets/custom_textFormField.dart';
// import '../constant/app_colors.dart';
// import '../constant/app_images.dart';
// import '../constant/app_string.dart';
//
//
// class NewEnquiresScreen extends StatefulWidget {
//   final String user_id;
//   const NewEnquiresScreen({super.key, required this.user_id});
//
//   @override
//   State<NewEnquiresScreen> createState() => _NewEnquiresScreenState();
// }
//
// class _NewEnquiresScreenState extends State<NewEnquiresScreen> {
//
//   TextEditingController contactPerson = TextEditingController();
//   TextEditingController otherState = TextEditingController();
//   TextEditingController companyName = TextEditingController();
//   TextEditingController companyEmail = TextEditingController();
//   TextEditingController companyEmail2 = TextEditingController();
//   TextEditingController companyEmail3 = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController phoneNumberController2 = TextEditingController();
//   TextEditingController phoneNumberController3 = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController machineDescription = TextEditingController();
//   TextEditingController searchController = TextEditingController();
//
//
//   String? products_id;
//   String? importanceValue;
//   String? stateValue;
//   String? assignUserValue;
//   String? sourceValue;
//
//
//
//   List<File> _imageList = [];
//   File? selectedImage;
//   String imagePath = "";
//   List<String> base64ImagesList = [];
//
//   bool isPhoneSecond = false;
//   bool isPhoneThird = false;
//   bool isEmailSecond = false;
//   bool isEmailThird = false;
//
//   bool isPurchaseLead1 = false;
//   bool isPurchaseLead2 = false;
//   bool isPurchaseLead3 = false;
//
//   bool isRequired1 = false;
//   bool isRequired2 = false;
//
//   bool isSendEmail = false;
//
//   FocusNode myFocusNode = new FocusNode();
//   FocusNode phoneFocusNode = new FocusNode();
//   FocusNode phoneFocusNode2 = new FocusNode();
//   FocusNode phoneFocusNode3 = new FocusNode();
//   FocusNode emailFocusNode = new FocusNode();
//   FocusNode emailFocusNode2 = new FocusNode();
//   FocusNode emailFocusNode3 = new FocusNode();
//   FocusNode Contact_person_name_FocusNode = new FocusNode();
//   FocusNode cityFocusNode = new FocusNode();
//   FocusNode machineDescriptionFocusNode = new FocusNode();
//   FocusNode companyNameFocusNode = new FocusNode();
//   FocusNode otherStateFocusNode = new FocusNode();
//   FocusNode addressFocusNode = new FocusNode();
//
//   final assignUserController = Get.put(AssignUserController());
//   final enquirySourceController = Get.put(EnquirySourceController());
//   final requiredMachineController = Get.put(RequiredMachineController());
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               width: size.width,
//               height: size.width * 0.23,
//               color: primeColor,
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(width: 20,),
//                   IconButton(onPressed: (){
//                     Navigator.of(context).pop();
//                   }, icon: Icon(Icons.arrow_back_ios,size: 25,color: Colors.white,)),
//                   Text(ENQUIRY,style: GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w900)),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(height: size.width*0.05,),
//                     /// Assign User (from the list of existing CRM users) ///
//                     GetX<AssignUserController>(
//                       builder: (controller) {
//                         return CustomDropDown(
//                             labelText: "Assign User",
//                             dropdownValue: assignUserValue,
//                             hintText: selectPerson,
//                             labelStyle: AppFonts.mediumBoldW500.copyWith(color: myFocusNode.hasFocus ? grayColor:primeColor),
//                             onChanged:(String? newValue) {
//                           setState(() {
//                             assignUserValue = newValue!;
//                           });
//                         } , items: assignUserController.resultListData.map((e){
//                         return DropdownMenuItem(child: Text(e.name!),value: e.userId!,);
//                         }).toList());
//                       }
//                     ),
//
//                     /// Enquiry Source (same as CRM) ///
//                     GetX<EnquirySourceController>(
//                       builder: (controller) {
//                         return CustomDropDown(
//                             labelText: "Enquiry Source",
//                             dropdownValue: sourceValue,
//                             hintText: selectSource,
//                             labelStyle: AppFonts.mediumBoldW500.copyWith(color: myFocusNode.hasFocus ? grayColor:primeColor),
//                             onChanged:(String? newValue) {
//                               sourceValue = newValue!;
//                               // setState(() {
//                               //   sourceValue = newValue!;
//                               // });
//                             } , items: enquirySourceController.resultListData.map((value) {
//                           return DropdownMenuItem(value: value.esId, child: Text(value.esName!,style: AppFonts.mediumBoldW500,),);
//                         }).toList());
//                       }
//                     ),
//                     SizedBox(height:10,),
//                     CustomEnquiry(
//                       controller: contactPerson,
//                       focusNode: Contact_person_name_FocusNode,
//                       labelStyle: GoogleFonts.poppins(color: Contact_person_name_FocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                       labelText: "Contact person name",
//                     ),
//                     SizedBox(height:20,),
//                     CustomEnquiry(
//                       controller: companyName,
//                       labelText: "Company Name",
//                       focusNode: companyNameFocusNode,
//                       labelStyle: GoogleFonts.poppins(color: companyNameFocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                     ),
//                     SizedBox(height:20,),
//
//                     /// Phone Number Field ///
//                     isPhoneSecond == false? CustomEnquiry2(
//                       controller: phoneNumberController,
//                       labelText: "Phone Number 1",
//                       addNow: true,
//                       maxLength: 10,
//                       focusNode: phoneFocusNode,
//                       labelStyle: GoogleFonts.poppins(color: phoneFocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                       keyboardType: TextInputType.phone,
//                       onAdd: (){
//                         isPhoneSecond = true;
//                         setState(() {});
//                       },
//                     ):
//                     CustomEnquiry2(
//                      controller: phoneNumberController,
//                      labelText: "Phone Number 1",
//                      addNow: true,
//                       maxLength: 10,
//                      keyboardType: TextInputType.phone,
//                       focusNode: phoneFocusNode,
//                       labelStyle: GoogleFonts.poppins(color: phoneFocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//
//                       onAdd: (){
//                        isPhoneThird = true;
//                        setState(() {});
//                      },
//                    ),
//                     isPhoneSecond == true? SizedBox(height:10,):Container(),
//                     isPhoneSecond == true? CustomEnquiry2(
//                         controller: phoneNumberController2,
//                         labelText: "Phone Number2",
//                         keyboardType: TextInputType.phone,
//                         maxLength: 10,
//                         addNow: false,
//                         focusNode: phoneFocusNode2,
//                         labelStyle: GoogleFonts.poppins(color: phoneFocusNode2.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                         onRemove: (){
//                           setState(() {
//                             isPhoneSecond = false;
//                             phoneNumberController2.clear();
//                           });
//                         }
//                     ):Container(),
//                     isPhoneThird == true?SizedBox(height:10,):Container(),
//                     isPhoneThird == true? CustomEnquiry2(
//                         controller: phoneNumberController3,
//                         labelText: "Phone Number 3",
//                         addNow: false,
//                         maxLength: 10,
//                         focusNode: phoneFocusNode3,
//                         labelStyle: GoogleFonts.poppins(color: phoneFocusNode3.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                         keyboardType: TextInputType.phone,
//                         onRemove: (){
//                           setState(() {isPhoneThird = false; phoneNumberController3.clear();});
//                         }
//                     ):Container(),
//                     SizedBox(height:20,),
//
//                     /// Email Field ///
//                     isEmailSecond == false? CustomEnquiry2(
//                       controller: companyEmail,
//                       controller2: companyEmail2,
//                       controller3: companyEmail3,
//                       addNow: true,
//                       labelText: "Email 1",
//                       focusNode: emailFocusNode,
//                       labelStyle: GoogleFonts.poppins(color: emailFocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                       keyboardType: TextInputType.emailAddress,
//                         onAdd: (){
//                         isEmailSecond = true;
//                         setState(() {});
//                         },
//
//                     ):
//                     CustomEnquiry2(
//                         controller: companyEmail,
//                         controller2: companyEmail2,
//                         controller3: companyEmail3,
//                         labelText: "Email 1",
//                          focusNode: emailFocusNode,
//                         labelStyle: GoogleFonts.poppins(color: emailFocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                       keyboardType: TextInputType.emailAddress,
//                         onAdd: (){
//                           isEmailThird = true;
//                           setState(() {});
//                         },
//                     ),
//                     isEmailSecond == true? SizedBox(height:10,):Container(),
//                     isEmailSecond == true?CustomEnquiry2(
//                         controller2: companyEmail2,
//                         labelText: "Email 2",
//                         addNow: false,
//                         keyboardType: TextInputType.emailAddress,
//                         focusNode: emailFocusNode2,
//                         labelStyle: GoogleFonts.poppins(color: emailFocusNode2.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//
//                         onRemove: (){
//                           isEmailSecond = false;
//                           companyEmail2.clear();
//                           setState(() {});
//                         }
//                     ):Container(),
//                     isEmailThird == true? SizedBox(height:10,):Container(),
//                     isEmailThird == true?CustomEnquiry2(
//                         controller2: companyEmail3,
//                         labelText: "Email 3",
//                         addNow: false,
//                         keyboardType: TextInputType.emailAddress,
//                         focusNode: emailFocusNode3,
//                         labelStyle: GoogleFonts.poppins(color: emailFocusNode3.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                         onRemove: (){
//                           isEmailThird = false;
//                           companyEmail3.clear();
//                           setState(() {});
//                         }
//                     ):Container(),
//
//                     /// State Select DropDown Menu ///
//                     SizedBox(height:10,),
//                     CustomDropDown(
//                         labelText: "Select State",
//                         dropdownValue: stateValue,
//                         hintText: selectState,
//                         labelStyle: AppFonts.mediumBoldW500.copyWith(color: myFocusNode.hasFocus ? grayColor:primeColor),
//                         onChanged:(String? newValue) {
//                           setState(() {
//                             stateValue = newValue!;
//                           });
//                         } , items: statesList.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value,style: AppFonts.mediumBoldW500,
//                         ),
//                       );
//                     }).toList()),
//                     stateValue == "Other"?SizedBox(height:10,): SizedBox(height: 0,),
//                     stateValue == "Other"?CustomEnquiry(
//                       controller: otherState,
//                       focusNode: otherStateFocusNode,
//                       labelStyle: GoogleFonts.poppins(color: otherStateFocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                       labelText: "Country Name",
//                     ): SizedBox(height: 0,),
//                     stateValue == "Other"?SizedBox(height:20,): SizedBox(height: 0,),
//                     SizedBox(height:10,),
//                     CustomEnquiry(
//                       controller: cityController,
//                       labelText: "City",
//                       focusNode: cityFocusNode,
//                       labelStyle: GoogleFonts.poppins(color: cityFocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                     ),
//                     SizedBox(height:20,),
//                     CustomEnquiry(
//                         controller: addressController,
//                         labelText: "Address",
//                         focusNode: addressFocusNode,
//                         labelStyle: AppFonts.mediumBoldW500.copyWith(color: addressFocusNode.hasFocus ? primeColor:grayColor),
//                         radius: 20,
//                         maxLines: 4
//                     ),
//                     SizedBox(height:10,),
//
//                     /// Required Machine (Same as CRM data) ///
//
//                     Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//                   child: GetX<RequiredMachineController>(
//                     builder: (controller) {
//                       return DropdownButtonHideUnderline(
//                         child: DropdownButton2<String>(
//                           isExpanded: true,
//                           hint: Text(
//                             'Select Item',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Theme.of(context).hintColor,
//                             ),
//                           ),
//                           items: requiredMachineController.requiredMachineListData.map((item) => DropdownMenuItem(
//                             value: item.pId,
//                             child: Text(
//                               item.pName!,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                               ),
//                             ),
//                           )).toList(),
//                           value: products_id,
//                           onChanged: (value) {
//                             setState(() {
//                               products_id = value;
//                             });
//                           },
//                           buttonStyleData:  ButtonStyleData(
//                             padding: EdgeInsets.symmetric(horizontal: 16),
//                             height: 50,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(16),
//                                   border: Border.all(
//                                     color:primeColor,
//                                   ),
//                                 ),
//
//                           ),
//                           iconStyleData: IconStyleData(
//                             icon: Image.asset(split,width: 25,height: 25,),
//                           ),
//                           dropdownStyleData: DropdownStyleData(
//                             maxHeight: size.width*0.9,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                           ),
//                           menuItemStyleData: const MenuItemStyleData(
//                             height: 50,
//                           ),
//                           dropdownSearchData: DropdownSearchData(
//                             searchController: searchController,
//                             searchInnerWidgetHeight: 50,
//                             searchInnerWidget: Container(
//                               height: 80,
//                               padding: const EdgeInsets.only(
//                                 top: 8,
//                                 bottom: 4,
//                                 right: 8,
//                                 left: 8,
//                               ),
//                               child: TextFormField(
//                                 controller: searchController,
//                                  expands: true,
//                                  maxLines: null,
//                                 cursorColor: primeColor,
//                                 decoration: InputDecoration(
//                                   hintText: "Required Machine",
//                                   isDense:true,
//                                   hintStyle: AppFonts.mediumBoldW500.copyWith(color: grayColor,fontSize: 12),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6),
//                                     borderSide: const BorderSide(
//                                       color: primeColor,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6),
//                                     borderSide: const BorderSide(
//                                       color:primeColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             searchMatchFn: (item, searchValue) {
//                               return item.value.toString().contains(searchValue);
//                             },
//                           ),
//                           onMenuStateChange: (isOpen) {
//                             if (!isOpen) {
//                               searchController.clear();
//                             }
//                           },
//                         ),
//                       );
//                     }
//                   ),
//                 ),
//                     /// Machine description (Manually typing box) ///
//                     SizedBox(height:10,),
//                     CustomEnquiry(
//                         controller: machineDescription,
//                         labelText: "Machine Description",
//                       focusNode: machineDescriptionFocusNode,
//                       labelStyle: GoogleFonts.poppins(color: machineDescriptionFocusNode.hasFocus ? primeColor:grayColor,fontWeight: FontWeight.w500,),
//                       radius: 20,
//                         maxLines: 4,
//                     ),
//                     SizedBox(height:20,),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(width: 30,),
//                             Text(purchaseTime,style: AppFonts.mediumBoldW500,),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             SizedBox(width: 20,),
//                             Expanded(
//                               child: CustomCheckBox(
//                                 value: isPurchaseLead1,
//                                 onChanged: (value){
//                                   isPurchaseLead1 = value!;
//                                   isPurchaseLead2 = false;
//                                   isPurchaseLead3 = false;
//                                   setState(() {});
//                                   print("isPurchaseLead1 === : $isPurchaseLead1");
//                                 },
//                                 text:Week,
//                               ),
//                             ),
//                             Expanded(
//                               child: CustomCheckBox(
//                                 value: isPurchaseLead2,
//                                 onChanged: (value){
//                                   isPurchaseLead2 = value!;
//                                   isPurchaseLead1 = false;
//                                   isPurchaseLead3 = false;
//                                   print("isPurchaseLead2 === : $isPurchaseLead2");
//                                   setState(() {});
//                                 },
//                                 text: Month13,
//                               ),
//                             ),
//                             Expanded(
//                               child: CustomCheckBox(
//                                 value: isPurchaseLead3,
//                                 onChanged: (value){
//                                   isPurchaseLead3 = value!;
//                                   isPurchaseLead2 = false;
//                                   isPurchaseLead1 = false;
//                                   setState(() {});
//                                   print("isPurchaseLead3 === : $isPurchaseLead3");
//                                 },
//                                 text: Month36,
//                               ),
//                             ),
//                             SizedBox(width: 20,),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height:10,),
//                     CustomDropDown(
//                         labelText: "Enquiry Importance",
//                         dropdownValue: importanceValue,
//                         hintText: selectImportance,
//                         labelStyle: AppFonts.mediumBoldW500.copyWith(color: myFocusNode.hasFocus ? grayColor:primeColor),
//                         onChanged:(String? newValue) {
//                           setState(() {
//                             importanceValue = newValue!;
//                           });
//                         } , items: importanceList.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value,style: AppFonts.mediumBoldW500,
//                         ),
//                       );
//                     }).toList()),
//                     SizedBox(height:30,),
//                     InkWell(
//                       onTap: (){
//                         _pickImage();
//                       },
//                       child: Container(
//                         width: size.width,
//                         height: size.width*0.4,
//                         margin: EdgeInsets.symmetric(horizontal: 30),
//                         padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                         color: primeColor,
//                         child:Stack(
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Dash(
//                                     direction: Axis.horizontal,
//                                     length:size.width-100,
//                                     dashLength: 10,
//                                     dashColor: Colors.white
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Dash(
//                                       direction: Axis.vertical,
//                                         length:  size.width*0.28,
//                                         dashLength: 10,
//                                         dashColor: Colors.white
//                                     ),
//                                     Dash(
//                                         direction: Axis.vertical,
//                                         length:  size.width*0.28,
//                                         dashLength: 10,
//                                         dashColor: Colors.white
//                                     )
//                                   ],
//                                 ),
//                                 Dash(
//                                     direction: Axis.horizontal,
//                                     length:size.width-100,
//                                     dashLength: 10,
//                                     dashColor: Colors.white
//                                 ),
//                               ],
//                             ),
//                             Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   SvgPicture.asset(camera,color:Colors.white,width: 50,height: 50,),
//                                   Text(Visiting,style: AppFonts.regular.copyWith(color: Colors.white,fontSize: 16),)
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       ),
//                     ),
//                     _imageList.isNotEmpty?SizedBox(height: 15,):Container(),
//                     _imageList.isNotEmpty?Container(
//                       width: size.width,
//                       height: size.width*0.25,
//                       alignment: Alignment.topCenter,
//                       margin: EdgeInsets.symmetric(horizontal: 30),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         childAspectRatio: (1 / .3),
//                         shrinkWrap: true,
//                        padding: EdgeInsets.zero,
//                        children: List.generate(
//                           _imageList.length, (index) {
//                         return   Container(
//                           width: size.width * 0.4,
//                           height: 50,
//                           padding: EdgeInsets.zero,
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 35,
//                                 height: 35,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color: primeColor,
//                                   image: DecorationImage(image: FileImage(_imageList[index]),fit: BoxFit.cover),
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),),
//                               SizedBox(width: 10,),
//                               SizedBox(width: size.width*0.15,child: Text("${_imageList[index].path.split('/').last}",overflow: TextOverflow.clip,maxLines: 1,style: AppFonts.regular.copyWith(color: primeColor,fontSize: 14),)),
//                               IconButton(onPressed: (){
//                                 _removeImage(index);
//                               }, icon: Icon(Icons.delete,color:primeColor,size: 16,),)
//                             ],
//                           ),
//                         );
//                       }),),
//                     ):Container(),
//                     // base64ImagesList.isNotEmpty?Container(
//                     //   width: size.width,
//                     //   height: size.width*0.25,
//                     //   alignment: Alignment.topCenter,
//                     //   margin: EdgeInsets.symmetric(horizontal: 30),
//                     //   child: GridView.count(
//                     //     crossAxisCount: 2,
//                     //     childAspectRatio: (1 / .3),
//                     //     shrinkWrap: true,
//                     //    padding: EdgeInsets.zero,
//                     //    children: List.generate(
//                     //        base64ImagesList.length, (index) {
//                     //     return   Container(
//                     //       width: size.width * 0.4,
//                     //       height: 50,
//                     //       padding: EdgeInsets.zero,
//                     //       child: Row(
//                     //         children: [
//                     //           Container(
//                     //             width: 150,
//                     //             height: 35,
//                     //             alignment: Alignment.center,
//                     //             decoration: BoxDecoration(
//                     //               color: primeColor,
//                     //             ),
//                     //             child: Container(
//                     //                 width: 140,
//                     //                 height: 35,
//                     //                 alignment: Alignment.centerLeft,
//                     //                 child: Text(base64ImagesList[index].toString(),overflow: TextOverflow.ellipsis,maxLines: 1,)),
//                     //           ),
//                     //           // SizedBox(width: size.width*0.15,child: Text("${base64ImagesList[index].path.split('/').last}",overflow: TextOverflow.clip,maxLines: 1,style: AppFonts.regular.copyWith(color: primeColor,fontSize: 14),)),
//                     //           // IconButton(onPressed: (){
//                     //           //   _removeImage(index);
//                     //           // }, icon: Icon(Icons.delete,color:primeColor,size: 16,),)
//                     //         ],
//                     //       ),
//                     //     );
//                     //   }),),
//                     // ):Container(),
//                     SizedBox(height: 10,),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: CustomTextBox(
//                         value: isSendEmail,
//                         onChanged: (value){
//                           isSendEmail = value!;
//                           print("isSendEmail : ${isSendEmail}");
//                           setState(() {});
//                         },
//                         text:emailSms,
//                       ),
//                     ),
//                     SizedBox(height:20,),
//                     InkWell(
//                       onTap: (){
//                         checkDetailsFill();
//                       },
//                       child: Container(
//                         width: size.width,
//                         height: 50,
//                         color: primeColor,
//                         alignment: Alignment.center,
//                         child: Text("Submit",style: AppFonts.bold.copyWith(color: Colors.white,fontSize: 18),),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void checkDetailsFill(){
//     final addEnquiryController = Get.put(AddEnquiryController());
//     if(companyName.text.isEmpty && phoneNumberController.text.isEmpty && companyEmail.text.isEmpty && contactPerson.text.isEmpty && _imageList.isEmpty){
//       print("${companyName.text} === ${phoneNumberController.text} === ${companyEmail.text} === ${contactPerson.text} "
//             " === ${_imageList.length} === ${base64ImagesList}");
//
//       showError(context: context,text: "Please Fill All Details!");
//     }else{
//       print("${companyName.text} === ${phoneNumberController.text} === ${companyEmail.text} === ${contactPerson.text} "
//           " === ${_imageList.length} === ${base64ImagesList}");
//       print("dropdownValue == ${products_id.toString()}");
//       print("selectedImage == ${ selectedImage.toString()}");
//       print("selectedImage == ${ products_id.toString()}");
//       addEnquiryController.AddEnquirySource(
//         context: context,
//         user_id: widget.user_id,
//         assign_users: assignUserValue != ""?assignUserValue:"SALES1",
//         sourceValue: sourceValue != "" ?sourceValue:"IMTEX 2024",
//         contact_person: contactPerson.text,
//         company_name: companyName.text,
//         phone_no: phoneNumberController.text,
//         phone_no2: phoneNumberController2.text,
//         phone_no3: phoneNumberController3.text,
//         email: companyEmail.text,
//         email2: companyEmail2.text,
//         email3: companyEmail3.text,
//         state: stateValue,
//         otherCountry: otherState.text,
//         city: otherState.text,
//         address: addressController.text,
//         products_id:products_id,
//         machine_description: machineDescription.text,
//         purchase_lead_time: isPurchaseLead1 == true?0:isPurchaseLead2 == true?1:isPurchaseLead3 == true?2:null,
//         importanceValue: importanceValue,
//         sms_email: isSendEmail?1:0,
//         visit_card: base64ImagesList,
//         // extension: ".jpg"
//
//       );
//     }
//
//   }
//
//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
//
//
//     if (pickedFile != null){
//       imagePath = pickedFile.path;
//       print("imagePath :==> $imagePath");
//       //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg
//
//       File imageFile = File(imagePath); //convert Path to File
//       Uint8List imageBytes = await imageFile.readAsBytes(); //convert to bytes
//       String base64string = base64.encode(imageBytes); //convert bytes to base64 string
//       print("base64string :==> $base64string");
//
//       base64ImagesList.add(base64string);
//
//
//       Uint8List decodedbytes = base64.decode(base64string);
//       print("decodedbytes :==> $decodedbytes");
//       setState(() {
//         _imageList.add(File(pickedFile.path));
//       });
//     }
//   }
//
//
//
//   void _removeImage(int index) {
//     setState(() {
//       _imageList.removeAt(index);
//     });
//   }
// }
