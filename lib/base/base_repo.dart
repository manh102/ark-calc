import 'package:arklevelcalculator/base/di/locator.dart';
import 'package:arklevelcalculator/datasource/remote/api_client.dart';

class BaseRepository {
  ApiClient apiClient = locator<ApiClient>();
}
