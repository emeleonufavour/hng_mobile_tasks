import 'package:dio/dio.dart';
import 'package:hng_2_task/core/core.dart';
import 'package:hng_2_task/features/features.dart';

abstract class StateRemoteDatasource {
  Future<List<StateEntity>> getStates(String countryId);
}

class StateRemoteDatasourceImpl implements StateRemoteDatasource {
  final Dio dio;
  StateRemoteDatasourceImpl({required this.dio});
  @override
  Future<List<StateEntity>> getStates(String countryId) async {
    try {
      final response = await dio.get(ApiConstants.states(countryId));
      final List<dynamic> statesJson = response.data['data'];
      return statesJson.map((json) => StateModel.fromJson(json)).toList();
    } catch (e) {
      throw BaseFailures(message: e.toString());
    }
  }
}
