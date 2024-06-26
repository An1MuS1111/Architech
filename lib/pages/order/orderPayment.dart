// import 'package:architech/components/form.dart';
// import 'package:architech/components/logos.dart';
// import 'package:architech/config/theme.dart';
// import 'package:architech/controllers/providers/orderConfimProvider.dart';
// import 'package:architech/controllers/providers/orderPlaceProvider.dart';
// import 'package:architech/models/orderModelTest.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class RazorPayPage extends StatefulWidget {
//   const RazorPayPage({super.key, required this.order});

//   final OrderModelTest order;
  
//   @override
//   _RazorPayPageState createState() => _RazorPayPageState();
// }

// class _RazorPayPageState extends State<RazorPayPage> {
//   late Razorpay _razorpay;

//   TextEditingController amtController = TextEditingController();

//   void openCheckout(amount) async {
//     amount = amount * 100;

//     var options = {
//       'key': 'rzp_test_1DP5mmOlF5G5ag',
//       'amount': amount,
//       'name': "Geeks for geeks",
//       'prefill': {'contact': '123455678', 'email': 'test@gmail.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: $e');
//     }
//   }

//   void handlePaymentSucess(PaymentSuccessResponse response) {
//     // Fluttertoast.showToast(
//     //     msg: " Payment Sucessful " + response.paymentId!,
//     //     toastLength: Toast.LENGTH_SHORT);
//   }

//   void handlePaymentError(PaymentFailureResponse response) {
//     // Fluttertoast.showToast(
//     //     msg: " Payment Fail " + response.message!,
//     //     toastLength: Toast.LENGTH_SHORT);
//   }

//   void handleExternalWallet(ExternalWalletResponse response) {
//     // Fluttertoast.showToast(
//     //     msg: " External Wallet " + response.walletName!,
//     //     toastLength: Toast.LENGTH_SHORT);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSucess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: SingleChildScrollView(
//           child: Container(
//             child: Consumer2<OrderPlaceProvider, OrderConfirmProvider>(
//             builder: (context, orderPlaceProvider, orderConfirmProvider, _) {
//               return Column(
//                 children: [
//                   const SizedBox(
//                     height: 100,
//                   ),
//                   appLogo("assets/razorpay_logo.png", 200),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Text(
//                     "Welcome to Razor Payment Gateway",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 80),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Total to be paid",
//                           style: TextStyle(fontSize: mainTitle),
//                         ),
//                         const SizedBox(width: 50),
//                         Text(
//                           "RM  ${(double.parse(orderConfirmProvider.calculatedPriceCriteriaList(orderPlaceProvider.parcelsMain)) + (orderPlaceProvider.parcelsMain.length * 1) + (orderPlaceProvider.parcelsMain.length * 1)).toString()}",
//                           style: TextStyle(
//                               fontSize: mainTitle,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(8.0),
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     child: TextFormField(
//                         cursorColor: Colors.white,
//                         autofocus: false,
//                         decoration: const InputDecoration(
//                             labelText: 'Enter amount to pay',
//                             labelStyle:
//                                 TextStyle(fontSize: 15.0),
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.white,
//                               width: 1.0,
//                             )),
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               width: 1.0,
//                             )),
//                             errorStyle:
//                                 TextStyle(color: Colors.redAccent, fontSize: 15)),
//                         controller: amtController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the amount to be paid';
//                           }
//                           return null;
//                         }),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     if (amtController.text.toString().isNotEmpty) {
//                   //       setState(() {
//                   //         int amount = int.parse(amtController.text.toString());
//                   //         openCheckout(amount);
//                   //       });
//                   //     }
//                   //   },
//                   //   child: Padding(
//                   //     padding: EdgeInsets.all(8.0),
//                   //     child: Text(
//                   //       'Make Payment'
//                   //     ),
//                   //   ),
//                   //   style: ElevatedButton.styleFrom(backgroundColor: primaryColour),
//                   // )
//                   mainBtn(context, "Make Payment", false, (){
//                     if (amtController.text.toString().isNotEmpty) {
//                       setState(() {
//                         int amount = int.parse(amtController.text.toString());
//                         openCheckout(amount);
//                       });
//                     }
//                   }),
//                   InkWell(
//                     onTap: (){},
//                     child: Container(
//                       margin: EdgeInsets.symmetric(vertical: 15),
//                       child: Text(
//                         "Cancel Process"
//                       ),
//                     )
//                   )
//                 ],
//               );
//             }
//           )
//         )
//         ),
//       )  
//     );
//   }
// }

