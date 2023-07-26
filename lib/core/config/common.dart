import 'app_properties.dart';

class Common {
  static final bool isDebugMode =
      AppProperties.instance.modeBuild == ModeBuildType.DEBUG;
  static final bool isTestingMode =
      AppProperties.instance.modeBuild == ModeBuildType.TESTING;

  // Application URL
  static final String apSrvURL = AppProperties.instance.apSrvURL;

  // Image URL
  static final String imgSrvURL = AppProperties.instance.imgSrvURL;

  // Server URL
  static final String serverUrl = apSrvURL + '/api/v1';

  // Customer resource
  static final String customerUrl = '/customer';
  // Reward resource
  static final String rewardUrl = '/reward';

  // Authentication resource
  static final String apiLogin = customerUrl + '/login';
  static final String apiRefreshToken = customerUrl + "/refresh";
  static final String apiLogout = customerUrl + "/logout";

  // User resource
  static final String apiProfile = customerUrl + "/profile";
  static final String apiChangeUserAvatar = customerUrl + "/avatar";

  // Reward resource
  static final String apiBrand = rewardUrl + "/brand";
  static final String apiCategory = rewardUrl + "/category";
  static final String apiRewardFilter = rewardUrl + "/filter";
  static final String apiMyReward = rewardUrl + "/my-reward";

  // Redeem resource
  static final String apiRewardDetail = rewardUrl + "/detail";
  static final String apiRedeemReward = rewardUrl + "/redeem";

  // Other resource
  static int defaultTimeOut = 15000;
}
