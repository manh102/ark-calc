import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_ark_calc/core/util/recruit_utilities.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/util/core_util.dart';
import '../../../../core/widgets/dialog/dialog.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../app_bloc/app_bloc.dart';
import '../../data/models/combine_result_model.dart';
import '../../data/models/operator.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/home_widgets_mixin.dart';

class HomePage extends StatefulWidget {
  final bool isLoggedIn;

  const HomePage({Key? key, bool? isLoggedIn})
      : this.isLoggedIn = isLoggedIn ?? true,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TemplatePageMixin, HomeWidgetsMixin {
  late AppBloc appBloc;
  late HomeBloc homeBloc;
  bool firstInit = true;
  // Recruit variables
  List<List<String>> totalList = [];
  List<Operator> listOperator1 = [];
  List<Operator> listOperator2 = [];
  List<Operator> listOperator3 = [];
  List<String> selectedTag = [];

  List<String> operatorTagDetail = [];
  Operator? selectedOperator;

  RecruitCombineModel? combineResult;
  RecruitUtils recruitCalculate = RecruitUtils();

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
          if (firstInit) {
            /// TODO
          }

          firstInit = false;
        }

        return wrapInScrollableTemplatePage(
          backgroundColor: SoloerColors.primaryDark,
          [
            buildTagTable(selectedTag, onPressed: (String tagName) {
              addTag(tagName);
            }),
            _buildClearButton(),
            buildResultTable(),
          ],
        );
      },
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      child: Container(
        height: 30.0,
        width: double.infinity,
        color: Colors.redAccent,
        child: Center(
          child: Text(
            "Clear all tags",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onPressed: () {
        print("tapped on flat button");
        // setState(() {
        //   selectedTag = [];
        //   listOperator1 = [];
        //   listOperator2 = [];
        //   listOperator3 = [];
        //   selectedOperator = null;
        //   operatorTagDetail = [];
        //   if (combineResult != null) {
        //     combineResult.combineTagList = [];
        //     combineResult.operatorList = [];
        //   }
        // });
      },
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

    resetOPList();

    // reload operator list
    if (selectedTag.length > 0) {
      _searchOperators(selectedTag);
    } else {
      setState(() {
        resetOPList();
      });
    }
  }

  resetOPList() {
    listOperator1 = [];
    listOperator2 = [];
    listOperator3 = [];
    if (combineResult != null) {
      combineResult?.combineTagList = [];
      combineResult?.operatorList = [];
    }
  }

  _searchOperators(List<String> tagList) async {
    print('get OP by tag');
    print(tagList);

    for (var i = 0; i < tagList.length; i++) {
      List<Operator> result = [];

      /// TODO
      // final operators = await _operatorRepository.getOperatorsByTag(tagList[i]);
      // for (final operator in operators) {
      //   result.add(operator);
      //   //print("OP name: " + operator.name + ", ID:" + operator.id.toString());
      // }
      if (i == 0) {
        setState(() {
          listOperator1 = result;
        });
      } else if (i == 1) {
        setState(() {
          listOperator2 = result;
        });
      } else {
        setState(() {
          listOperator3 = result;
        });
      }
    }

    // find intersection list
    combineResult = recruitCalculate.findIntersectionList(
        list1: listOperator1,
        list2: listOperator2,
        list3: listOperator3,
        tagList: selectedTag);
  }

  _getOperatorTag(String name) async {
    print('Get operator by name');
    selectedOperator = null;
    operatorTagDetail = [];
    List<String> tagList = [];
    // final operator = await _operatorRepository.getOperator(name);
    // setState(() {
    //   selectedOperator = operator;
    //   if (selectedOperator != null) {
    //     operatorTagDetail = selectedOperator!.getTag();
    //   }
    // });
  }
}
