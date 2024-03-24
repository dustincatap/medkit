import 'package:flutter/material.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/rounded_network_image.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';
import 'package:medkit/features/user/presentation/view_models/user_profile_app_bar_view_model.dart';

class UserProfileAppBarView extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;

  const UserProfileAppBarView({this.leading, this.title, this.centerTitle, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileAppBarViewModel>(
      create: (_) => ServiceLocator.get<UserProfileAppBarViewModel>(),
      builder: (BuildContext context, UserProfileAppBarViewModel viewModel) {
        return AppBar(
          title: title,
          centerTitle: centerTitle,
          leading: leading,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: ValueListenableBuilder<UserProfile>(
                valueListenable: viewModel.userProfile,
                builder: (BuildContext context, UserProfile userProfile, _) {
                  return GestureDetector(
                    onTap: viewModel.onNavigateToUserProfile,
                    child: RoundedNetworkImage(
                      imageUrl: userProfile.profilePictureUrl,
                      radius: 16,
                      width: 40,
                      height: 40,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
