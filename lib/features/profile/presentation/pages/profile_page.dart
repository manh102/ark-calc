import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:new_ark_calc/core/extensions/context_extension.dart';
import 'package:new_ark_calc/core/extensions/string_extension.dart';
import 'package:new_ark_calc/core/resources/colors.dart';
import 'package:new_ark_calc/core/widgets/common/buttons/filled_button.dart';
import 'package:new_ark_calc/core/widgets/common/text_widget.dart';
import 'package:new_ark_calc/core/widgets/dialog/dialog.dart';
import 'package:new_ark_calc/features/profile/data/models/user_profile_model.dart';
import 'package:new_ark_calc/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../../core/widgets/common/template_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TemplatePageMixin {
  UserProfileModel? _userProfileModel;

  @override
  void initState() {
    // if (_userProfileModel == null) {
    //   context.read<ProfileBloc>().add(ProfileEvent.loadProfile());
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (EasyLoading.isShow && !(state is Error)) {
          EasyLoading.dismiss();
        }

        if (state is Updated) {
          "Updated".showSnackBar();
          context.read<ProfileBloc>().add(ProfileEvent.loadProfile());
        }

        if (state is Loaded) {
          _userProfileModel = state.retrievedUserProfile;
        }

        return _buildBody(
            userProfileModel: _userProfileModel ?? UserProfileModel.empty());
      },
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

        if (state is SignedOut) {
          await context.backToSignIn();
        }
      },
    );
  }

  Widget _buildBody({required UserProfileModel userProfileModel}) {
    return wrapInTemplatePageEqually(
      isHorizontalPadding: true,
      [
        if (userProfileModel.avatar != null)
          CircleAvatar(
            radius: 50,
            backgroundColor: SoloerColors.background,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.network(userProfileModel.avatar ?? ''),
            ),
          ),
        PSText.normalText('Name: ${userProfileModel.name}'),
        PSText.normalText('Email: ${userProfileModel.email}'),
        PSText.normalText('Phone: ${userProfileModel.phone}'),
        PSText.normalText('Location: ${userProfileModel.location ?? ""}'),
        PSText.normalText('Birthday: ${userProfileModel.birthday ?? ""}'),
        PSText.normalText('Beans: ${userProfileModel.beans}'),
        PSText.normalText('Level: ${userProfileModel.level ?? ""}'),
        PSText.normalText('Redemption: ${userProfileModel.redemption}'),
        PSFilledButton.normal(
          onPressed: () {
            var updatedUserProfileModel = userProfileModel.copyWith(
                name: userProfileModel.name + ' Updated',
                birthday: "19/05/1999",
                phone: userProfileModel.phone
                    .substring(2, userProfileModel.phone.length));
            context.read<ProfileBloc>().add(ProfileEvent.updateProfile(
                updatedUserProfile: updatedUserProfileModel));
          },
          label: "Update",
        ),
        PSFilledButton.normal(
          onPressed: () async {
            await PSDialog.instance.showAlertDialog(context,
                title: "Are you sure you want to sign out?",
                content:
                    "You will need to log in again to access your account.",
                positiveButton: PSActionButton(
                  label: "OK",
                  onTap: () async {
                    context.read<ProfileBloc>().add(ProfileEvent.signOut());
                    context.pop();
                  },
                ));
          },
          label: "Sign Out",
        )
      ],
    );
  }

  @override
  void dispose() {
    EasyLoading.dismiss();
    super.dispose();
  }
}
