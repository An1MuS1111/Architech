import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RazorPayPage extends StatefulWidget {
  const RazorPayPage({Key? key}) : super(key: key);

  @override
  _RazorPayPageState createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  late Razorpay _razorpay;

  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async {
    amount = amount * 100;

    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': "Geeks for geeks",
      'prefill': {'contact': '123455678', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void handlePaymentSucess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: " Payment Sucessful " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: " Payment Fail " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: " External Wallet " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.network(
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Frazorpay.com%2Fnewsroom%2Frazorpay-launches-indias-first-moneysaver-export-account-set-to-save-indian-exporters-more-than-50-in-bank-transfers%2F&psig=AOvVaw1YXzWzlPT552C7EAvLkwcB&ust=1718880354396000&source=images&cd=vfe&opi=89978449&ved=0CA8QjRxqFwoTCOjjpLm-54YDFQAAAAAdAAAAABAE',
              height: 100,
              width: 300,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Welcome to Razor Payment Gateway",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Enter amount to pay',
                      labelStyle:
                          TextStyle(fontSize: 15.0, color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      )),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15)),
                  controller: amtController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the amount to be paid';
                    }
                    return null;
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (amtController.text.toString().isNotEmpty) {
                  setState(() {
                    int amount = int.parse(amtController.text.toString());
                    openCheckout(amount);
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Make Payment'),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}

