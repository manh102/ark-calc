import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/util/core_util.dart';
import '../../../../core/widgets/dialog/dialog.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../app_bloc/app_bloc.dart';
import '../../../profile/data/models/user_profile_model.dart';
import '../../data/models/reward_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomePage extends StatefulWidget {
  final bool isLoggedIn;

  const HomePage({Key? key, bool? isLoggedIn})
      : this.isLoggedIn = isLoggedIn ?? true,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TemplatePageMixin {
  late AppBloc appBloc;
  late HomeBloc homeBloc;
  bool firstInit = true;

  UserProfileModel? userProfileModel;
  List<RewardModel> exploreRewards = [];
  List<RewardModel> exploreMembershipRewards = [];
  List<RewardModel>? myRewards;
  List<RewardModel>? myMembershipRewards;

  List<String> selectedTag = [];

  final ButtonStyle enableStyle =
      ElevatedButton.styleFrom(backgroundColor: CupertinoColors.activeBlue);
  final ButtonStyle disableStyle =
      ElevatedButton.styleFrom(backgroundColor: CupertinoColors.inactiveGray);

  @override
  void initState() {
    appBloc = context.read<AppBloc>();
    homeBloc = context.read<HomeBloc>();
    Logging.log.info("isLoggedIn: ${widget.isLoggedIn}; firstInit: $firstInit");
    if (firstInit) {
      //homeBloc.add(HomeInitialEvent(isLoggedIn: widget.isLoggedIn));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) async {
        if (state is Loading) {
          await EasyLoading.show();
        }

        if (state is TimeOut) {
          await PSDialog.instance.showTimeOutDialog(context);
        }

        if (state is Error) {
          await PSDialog.instance.showErrorDialog(
              context: context,
              messageCode: state.messageCode,
              messageContent: state.messageContent);
        }
      },
      builder: (context, state) {
        if (EasyLoading.isShow && !(state is Error)) {
          EasyLoading.dismiss();
        }

        if (state is Loaded) {
          userProfileModel = state.userProfileModel;
          exploreRewards = state.exploreRewards;
          exploreMembershipRewards = state.exploreMembershipRewards;
          myRewards = state.myRewards;
          myMembershipRewards = state.myMembershipRewards;

          if (firstInit) {
            homeBloc
              ..add(GetBrandEvent())
              ..add(GetCategoriesEvent())
              ..add(HomeIdleEvent());
          }

          firstInit = false;
        }

        return wrapInScrollableTemplatePage(
          backgroundColor: SoloerColors.background,
          [
            _buildTagTable(),
          ],
        );
      },
    );
  }

  Widget _buildTagTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Table(
          border: TableBorder.all(
              color: Colors.white30, width: 1, style: BorderStyle.solid),
          columnWidths: {
            0: FractionColumnWidth(.1),
            1: FractionColumnWidth(.6)
          },
          children: [
            // Row 1
            TableRow(children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(
                  child: Text(
                    'Qualification',
                    style: PSStyle.kRecruitTitle,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Wrap(
                    spacing: 1.0,
                    children: <Widget>[
                      ElevatedButton(
                        style: selectedTag.contains("starter")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Starter'),
                        onPressed: () {
                          print('Tapped on Starter Button');
                          addTag("starter");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("seniorOperator")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Senior Operator'),
                        onPressed: () {
                          print('Tapped on Senior Operator Button');
                          addTag("seniorOperator");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("topOperator")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Top Operator'),
                        onPressed: () {
                          print('Tapped on Top Operator Button');
                          addTag("topOperator");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            // Row 2
            TableRow(children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(
                  child: Text(
                    'Position',
                    style: PSStyle.kRecruitTitle,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Wrap(
                    spacing: 1.0,
                    children: <Widget>[
                      ElevatedButton(
                        style: selectedTag.contains("melee")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Melee'),
                        onPressed: () {
                          print('Tapped on Melee Button');
                          addTag("melee");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("ranged")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Ranged'),
                        onPressed: () {
                          print('Tapped on Ranged Button');
                          addTag("ranged");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            // Row 3
            TableRow(children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(
                  child: Text(
                    'Class',
                    style: PSStyle.kRecruitTitle,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Wrap(
                    spacing: 1.0,
                    children: <Widget>[
                      ElevatedButton(
                        style: selectedTag.contains("guard")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Guard'),
                        onPressed: () {
                          print('Tapped on Guard Button');
                          addTag("guard");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("medic")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Medic'),
                        onPressed: () {
                          print('Tapped on Medic Button');
                          addTag("medic");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("vanguard")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Vanguard'),
                        onPressed: () {
                          print('Tapped on Vanguard Button');
                          addTag("vanguard");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("caster")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Caster'),
                        onPressed: () {
                          print('Tapped on Caster Button');
                          addTag("caster");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("sniper")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Sniper'),
                        onPressed: () {
                          print('Tapped on Sniper Button');
                          addTag("sniper");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("defender")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Defender'),
                        onPressed: () {
                          print('Tapped son Defender Button');
                          addTag("defender");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("supporter")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Supporter'),
                        onPressed: () {
                          print('Tapped on Supporter Button');
                          addTag("supporter");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("specialist")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Specialist'),
                        onPressed: () {
                          print('Tapped on Specialist Button');
                          addTag("specialist");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            // Row 4
            TableRow(children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Center(
                  child: Text(
                    'Affix',
                    style: PSStyle.kRecruitTitle,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Wrap(
                    spacing: 1.0,
                    children: <Widget>[
                      ElevatedButton(
                        style: selectedTag.contains("healing")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Healing'),
                        onPressed: () {
                          print('Tapped on Healing Button');
                          addTag("healing");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("support")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Support'),
                        onPressed: () {
                          print('Tapped on Support Button');
                          addTag("support");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("dPS")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('DPS'),
                        onPressed: () {
                          print('Tapped on DPS Button');
                          addTag("dPS");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("aOE")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('AOE'),
                        onPressed: () {
                          print('Tapped on AOE Button');
                          addTag("aOE");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("slow")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Slow'),
                        onPressed: () {
                          print('Tapped on Slow Button');
                          addTag("slow");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("survival")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Survival'),
                        onPressed: () {
                          print('Tapped on Survival Button');
                          addTag("survival");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("defense")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Defense'),
                        onPressed: () {
                          print('Tapped on Defense Button');
                          addTag("defense");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("debuff")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Debuff'),
                        onPressed: () {
                          print('Tapped on Debuff Button');
                          addTag("debuff");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("shift")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Shift'),
                        onPressed: () {
                          print('Tapped on Shift Button');
                          addTag("shift");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("crowdControl")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Crowd Control'),
                        onPressed: () {
                          print('Tapped on Crowd Control Button');
                          addTag("crowdControl");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("nuker")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Nuker'),
                        onPressed: () {
                          print('Tapped on Nuker Button');
                          addTag("nuker");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("summon")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Summon'),
                        onPressed: () {
                          print('Tapped on Summon Button');
                          addTag("summon");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("fastRedeploy")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Fast-Redeploy'),
                        onPressed: () {
                          print('Tapped on Fast-Redeploy Button');
                          addTag("fastRedeploy");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("dPRecovery")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('DP-Recovery'),
                        onPressed: () {
                          print('Tapped on DP-Recovery Button');
                          addTag("dPRecovery");
                        },
                      ),
                      ElevatedButton(
                        style: selectedTag.contains("robot")
                            ? enableStyle
                            : disableStyle,
                        child: const Text('Robot'),
                        onPressed: () {
                          print('Tapped on Robot Button');
                          addTag("robot");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  addTag(String tagName) {
    print("add tag");
    // Check if tag was selected then remove tag from list
    if (selectedTag.contains(tagName)) {
      print("remove $tagName");
      selectedTag.removeWhere((tag) => tag == tagName);
      print(selectedTag);
    } else {
      if (selectedTag.length < 3) {
        selectedTag.add(tagName);
        print("selected tag: ");
        print(selectedTag);
      } else {
        return;
      }
    }

    //resetOPList();

    // reload operator list
    // if (selectedTag.length > 0) {
    //   _searchOperators(selectedTag);
    // } else {
    //   setState(() {
    //     resetOPList();
    //   });
    // }
  }
}
