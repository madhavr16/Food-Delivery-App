import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  //user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog if form is valid
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text('Confirm Payment',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number: $cardNumber',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary
                  ),
                ),
                Text('Expiry Date: $expiryDate',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary
                  ),
                ),
                Text('Card Holder Name: $cardHolderName',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary
                  ),
                ),
                Text('CVV Code: $cvvCode',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary
                  ),
                ),
              ],
            ),
          ),
          actions: [
            //cancel button
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancel')
            ),
            //yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryProgressPage()));
              },
              child: const Text('Yes'),
            )
          ]
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Payment',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          )
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //credit card
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: showBackView, 
            onCreditCardWidgetChange: ((p0) {
              
            })
          ),
          //credit card form
          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: ((data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
                showBackView = data.isCvvFocused;
              });
            }), 
            formKey: formKey
          ),
          const Spacer(),
          //pay button
          MyButton(
            onTap: () {
              userTappedPay();
            }, 
            text: 'Pay now',
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}