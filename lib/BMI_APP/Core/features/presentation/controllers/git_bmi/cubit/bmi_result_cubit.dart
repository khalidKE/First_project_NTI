import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:first_app/BMI_APP/Core/features/data/api/api_constants.dart';
import 'package:first_app/BMI_APP/Core/features/data/model/bmi_data_model.dart';
import 'package:first_app/BMI_APP/Core/features/data/model/bmi_model.dart';
import 'package:first_app/BMI_APP/Core/features/presentation/controllers/git_bmi/cubit/bmi_result_state.dart';

class BmiResultCubit extends Cubit<BmiResultState> {
  BmiResultCubit() : super(BmiResInitial()) {
    _dio = Dio(
      BaseOptions(
        headers: {'x-api-key': ApiConstants.apiKey},
      ),
    );
  }

  late final Dio _dio;

  Future<void> getBmiRes({
    required String height,
    required String weight,
    required String unit,
    required String gender,
    required String name,
  }) async {
    try {
      emit(BmiResLoading());

      final response = await _dio.get(
        ApiConstants.baseUrl,
        queryParameters: {
          'weight': weight,
          'height': height,
          'unit': unit,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData;
        if (response.data is String) {
          responseData = json.decode(response.data);
        } else if (response.data is Map<String, dynamic>) {
          responseData = response.data;
        } else {
          emit(BmiResError('Unexpected API response format'));
          return;
        }
        final model = BmiModel.fromJson(responseData);

        if (model.status == 'ok' && model.data != null) {
          final bmiData = BmiDataModel.fromJson(model.data!);
          emit(BmiResSuccess(bmiModel: bmiData, gender: gender, name: name));
        } else {
          emit(BmiResError('Failed to get BMI data: ${model.message ?? 'Unknown error'}'));
        }
      } else {
        emit(BmiResError('Server error: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      emit(BmiResError('Network Error: ${e.message}'));
    } catch (e) {
      emit(BmiResError('An unexpected error occurred: $e'));
    }
  }
}
