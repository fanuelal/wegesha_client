import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uuid/uuid.dart';
import '../model/user.dart';

var uuid = Uuid();

class Payment {
//   var headers = {

// };
  Future<String> paymentChapa(UserModel userModel) async {
    try {
      String tx_ref = uuid.v4();
      final response = await http
          .post(Uri.parse('https://api.chapa.co/v1/transaction/initialize'),
              body: jsonEncode({
                "amount": "250",
                "currency": "ETB",
                "email": userModel.email,
                "first_name": userModel.firstName,
                "last_name": userModel.lastName,
                "phone_number": userModel.phoneNumber,
                "tx_ref": "WegeshaTest-${tx_ref}",
                "callback_url":
                    "https://webhook.site/077164d6-29cb-40df-ba29-8a00e59a7e60",
                "return_url": "https://www.google.com/",
                "customization[title]": "Payment for my favourite Doctor",
                "customization[description]": "I love online payments"
              }),
              headers: {
            'Authorization':
                'Bearer CHASECK_TEST-aMjRDZOcTUmdrzdcut0ysjWZMRIMLn7H',
            'Content-Type': 'application/json'
          });
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return decodedData['data']['checkout_url'];
      } else {
        print(decodedData);
        return 'Failed To pay by chapa!';
      }
    } catch (error) {
      print(error);
      return "Error durring payment connection!";
    }
  }
}
