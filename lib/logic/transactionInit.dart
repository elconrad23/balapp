// dynamic transactionInitialisation;
// //Wrap it with a try-catch
// try {
// //Run it
// transactionInitialisation =
//         await MpesaFlutterPlugin.initializeMpesaSTKPush(
//                 businessShortCode: <your_code>,//use your store number if the transaction type is CustomerBuyGoodsOnline
//                 transactionType: TransactionType.CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
//                 amount: <amount_in_string_format>,
//                 partyA: <users_phone_to_request_payment>,
//                 partyB: <your_code>,
//                 callBackURL: <uri_to_receive_payment_results>,
//                 accountReference: <could_be_order_number>,
//                 phoneNumber: <users_phone_to-request_payment>,
//                 baseUri: <live_or_sandbox_base_uri>,
//                 transactionDesc: <short_description>,
//                 passKey: <your_passkey>);
                
// } catch (e) {
// //you can implement your exception handling here.
// //Network un-reachability is a sure exception.

//   /*
//   Other 'throws':
//   1. Amount being less than 1.0
//   2. Consumer Secret/Key not set
//   3. Phone number is less than 9 characters
//   4. Phone number not in international format(should start with 254 for KE)
//    */

// print(e.getMessage());
// }