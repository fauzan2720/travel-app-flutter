import 'package:http/http.dart' as http;
import 'package:travel_app/core/variables.dart';
import 'package:travel_app/models/booking_model.dart';
import 'package:travel_app/models/booking_request.dart';

class BookingService {
  Future<List<History>> getHistories() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/history'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final result = bookingModelFromJson(response.body);
      return result.data?.history ?? [];
    } else {
      throw response.body;
    }
  }

  Future<bool> create(BookingRequest request) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/pemesanan'),
      headers: headers,
      body: bookingRequestToJson(request),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw response.body;
    }
  }
}
