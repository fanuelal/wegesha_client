import 'package:http/http.dart' as http;
import 'dart:convert';

class Payment {
//   var headers = {

// };
  void paymentChapa() async {
    try {
      final response = await http
          .post(Uri.parse('https://api.chapa.co/v1/transaction/initialize'),
              body: jsonEncode({
                "amount": "100",
                "currency": "ETB",
                "email": "abebech_bekele@gmail.com",
                "first_name": "Bilen",
                "last_name": "Gizachew",
                "phone_number": "0912345678",
                "tx_ref": "chewatatest-6669",
                "callback_url":
                    "https://webhook.site/077164d6-29cb-40df-ba29-8a00e59a7e60",
                "return_url": "https://www.google.com/",
                "customization[title]": "Payment for my favourite merchant",
                "customization[description]": "I love online payments"
              }),
              headers: {
            'Authorization':
                'Bearer CHAPUBK_TEST-ZZM3EScW9m7M6EF1UXLPwCzKiAoPpwTT',
            'Content-Type': 'application/json'
          });

      if (response.statusCode == 200) {
        print(response);
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print(error);
    }
  }
}
