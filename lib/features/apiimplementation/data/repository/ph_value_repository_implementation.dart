import 'dart:convert';

import 'package:ecph_value/common/api_endpoints.dart';
import 'package:ecph_value/features/apiimplementation/domain/models/ph_value_model.dart';
import 'package:ecph_value/features/apiimplementation/domain/repository/ph_value_repository.dart';
import 'package:http/http.dart' as http;

class PhValueRepositoryImpl implements PhValueRepository {
  @override
  Future<PhValue>? phValue() async {
    var response = await http.get(Uri.parse(ApiData.url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      PhValue? phValue = PhValue.fromJson(data);
      return phValue;
    } else {
      throw Exception();
    }
  }
}
