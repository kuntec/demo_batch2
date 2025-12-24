import 'dart:convert';
import 'package:demo_batch2/api/APIResources.dart';
import 'package:demo_batch2/api/HttpCall.dart';
import 'package:demo_batch2/models/GetAllServicesData.dart';
import 'package:http/http.dart' as http;

class APICall {
  Future<GetAllServicesData> getAllServices() async {
    Uri uri = Uri.parse(APIResource.GET_ALL_SERVICES);
    HttpCall httpCall = HttpCall();

    var header = Map<String, String>();
    var params = Map<String, dynamic>();

    http.Response response = await httpCall.post(uri, header, params);
    print("Response ${response.body}");
    return GetAllServicesData.fromJson(jsonDecode(response.body));
  }
}
