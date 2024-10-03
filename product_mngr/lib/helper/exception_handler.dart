import 'dart:async';
import 'dart:io';

String handleExceptionWithMessage(dynamic error) {
  if (error is SocketException) {
    return "No Internet. Check Your Internet Connection...!";
  } else if (error is TimeoutException) {
    return "The Request Time Out...!";
  } else {
    print(error.toString());
    return "An Error Ocured, Please Try Again...!";
  }
}
