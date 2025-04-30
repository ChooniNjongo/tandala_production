import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../features/booking/models/notification/notification.dart';
import '../../../../utils/constants/api_constants.dart';

class NotificationRepository extends GetxController {
  static NotificationRepository get instance => Get.find();

  /// Variables
  /// Functions
  Future<TandalaNotification?> getOldestUnDeliveredUserNotification(
      String userId) async {
    final response = await http.get(Uri.parse(
        '${APIConstants.baseUrl}/notification/get-oldest-user-notifications/$userId'));
    if (response.statusCode == 200) {
      // Check if the response body is empty
      if (response.body.isEmpty) {
        return null; // Return null if the response body is empty
      } else {
        return TandalaNotification.fromJson(jsonDecode(response.body));
      }
    } else {
      throw Exception('Failed to load notification');
    }
  }


  Future<List<TandalaNotification>> getUserNotifications(String userId) async {
    final url = Uri.parse(
        '${APIConstants.baseUrl}/notification/get-user-notifications/$userId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a successful response, parse the JSON
        List<dynamic> jsonResponse = json.decode(response.body);

        return jsonResponse
            .map((creditJson) => TandalaNotification.fromJson(creditJson))
            .toList();
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to load credits');
      }
    } catch (error) {
      // If the request throws an error (e.g. network error), throw an exception
      throw Exception('Failed to connect to the server');
    }
  }
}
