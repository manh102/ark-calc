// Entry point for development in Vietnam.
//
// Used with vietnam build flavor like example:
// `flutter build apk --flavor vnProd --target lib/main_vn_dev.dart`

import 'core/config/app_properties.dart';
import 'main_common.dart';

void main() async {
  await mainCommon(AppProperties(
    apSrvURL: 'https://dev.be.pointsuite.xyz',
    imgSrvURL: 'http://192.168.200.114',
  ));
}
