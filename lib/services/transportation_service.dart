import 'package:http/http.dart' as http;
import 'package:travel_app/core/variables.dart';
import 'package:travel_app/models/transportation_model.dart';

class TransportationService {
  Future<List<Transportasi>> getTransportationTrains() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/transportasi?tipe=kereta'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final result = transportationModelFromJson(response.body);
      return result.data?.transportasi ?? [];
    } else {
      throw response.body;
    }
  }

  Future<List<Transportasi>> getTransportationFlights() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/transportasi?tipe=pesawat'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final result = transportationModelFromJson(response.body);
      return result.data?.transportasi ?? [];
    } else {
      throw response.body;
    }
  }
}
