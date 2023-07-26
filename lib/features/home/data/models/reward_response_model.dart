import 'package:new_ark_calc/core/extensions/map_extension.dart';

import 'reward_model.dart';

class RewardResponseModel {
  final List<RewardModel>? reward;
  final List<RewardModel>? membership;
  final bool? rewardHasNextPage;
  final bool? membershipHasNextPage;

//<editor-fold desc="Data Methods">
  const RewardResponseModel({
    this.reward,
    this.membership,
    this.rewardHasNextPage,
    this.membershipHasNextPage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RewardResponseModel &&
          runtimeType == other.runtimeType &&
          reward == other.reward &&
          membership == other.membership &&
          rewardHasNextPage == other.rewardHasNextPage &&
          membershipHasNextPage == other.membershipHasNextPage);

  @override
  int get hashCode =>
      reward.hashCode ^
      membership.hashCode ^
      rewardHasNextPage.hashCode ^
      membershipHasNextPage.hashCode;

  @override
  String toString() {
    return 'RewardResponseModel{' +
        ' reward: $reward,' +
        ' membership: $membership,' +
        ' rewardHasNextPage: $rewardHasNextPage,' +
        ' membershipHasNextPage: $membershipHasNextPage,' +
        '}';
  }

  RewardResponseModel copyWith({
    List<RewardModel>? reward,
    List<RewardModel>? membership,
    bool? rewardHasNextPage,
    bool? membershipHasNextPage,
  }) {
    return RewardResponseModel(
      reward: reward ?? this.reward,
      membership: membership ?? this.membership,
      rewardHasNextPage: rewardHasNextPage ?? this.rewardHasNextPage,
      membershipHasNextPage:
          membershipHasNextPage ?? this.membershipHasNextPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reward': this.reward,
      'membership': this.membership,
      'reward_has_next_page': this.rewardHasNextPage,
      'membership_has_next_page': this.membershipHasNextPage,
    };
  }

  factory RewardResponseModel.fromMap(Map<String, dynamic> map) {
    return RewardResponseModel(
      reward: _mapRewardModelList(map['reward']),
      membership: _mapRewardModelList(map['membership']),
      rewardHasNextPage: map.find<bool?>(
        "reward_has_next_page",
        (value) => value,
      ),
      membershipHasNextPage: map.find<bool?>(
        "membership_has_next_page",
        (value) => value,
      ),
    );
  }

  static List<RewardModel>? _mapRewardModelList(dynamic map) {
    List<dynamic>? jsonList = map as List<dynamic>?;
    if (jsonList == null) return null;

    return jsonList
        .map((jsonObject) => RewardModel.fromMap(jsonObject))
        .toList();
  }

//</editor-fold>
}
