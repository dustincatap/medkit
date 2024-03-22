import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medkit/common/enums/gender.dart';
import 'package:medkit/core/infrastructure/dependency_injection/service_locator.dart';
import 'package:medkit/core/presentation/widgets/context_extensions.dart';
import 'package:medkit/core/presentation/widgets/rounded_network_image.dart';
import 'package:medkit/core/presentation/widgets/spaced_column.dart';
import 'package:medkit/core/presentation/widgets/spaced_row.dart';
import 'package:medkit/core/presentation/widgets/views.dart';
import 'package:medkit/features/user/domain/models/user_emergency_contact.dart';
import 'package:medkit/features/user/domain/models/user_profile.dart';
import 'package:medkit/features/user/presentation/models/medical_data_item.dart';
import 'package:medkit/features/user/presentation/view_models/user_profile_view_model.dart';

@RoutePage()
class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>(
      create: (_) => ServiceLocator.get<UserProfileViewModel>(),
      builder: (BuildContext context, UserProfileViewModel viewModel) {
        return const _UserProfileViewBody();
      },
    );
  }
}

class _UserProfileViewBody extends StatelessWidget {
  const _UserProfileViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: context.theme.scaffoldBackgroundColor),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SpacedColumn(
          spacing: 40,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const _UserProfileViewHeader(),
            const _UserProfileViewMedicalData(),
            const _UserProfileEmergencyContacts(),
            ElevatedButton(
              onPressed: () {},
              child: Text(context.il8n.generalEditDetails),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserProfileViewHeader extends StatelessWidget {
  const _UserProfileViewHeader();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProfile>(
      valueListenable: context.viewModel<UserProfileViewModel>().userProfile,
      builder: (BuildContext context, UserProfile userProfile, _) {
        return SpacedColumn(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoundedNetworkImage(
              imageUrl: userProfile.profilePictureUrl,
              radius: 40,
              width: 128,
              height: 128,
            ),
            Column(
              children: <Widget>[
                Text(
                  userProfile.fullName,
                  style: context.theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                SpacedRow(
                  mainAxisSize: MainAxisSize.max,
                  spacing: 8,
                  children: <Widget>[
                    Chip(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: MaterialStateProperty.all<Color>(Colors.white),
                      label: Text(
                        userProfile.localizedYearsOld,
                        style: context.theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    Chip(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: MaterialStateProperty.all<Color>(Colors.white),
                      label: Text(
                        userProfile.gender.localizedName,
                        style: context.theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _UserProfileViewMedicalData extends StatelessWidget {
  const _UserProfileViewMedicalData();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Iterable<MedicalDataItem>>(
      valueListenable: context.viewModel<UserProfileViewModel>().medicalDataItems,
      builder: (BuildContext context, Iterable<MedicalDataItem> medicalDataItems, _) {
        return SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: <Widget>[
            for (final MedicalDataItem medicalDataItem in medicalDataItems)
              SpacedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: <Widget>[
                  Text(
                    medicalDataItem.label,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    medicalDataItem.value,
                    style: context.theme.textTheme.bodyLarge?.copyWith(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    height: 1,
                    thickness: 1,
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}

class _UserProfileEmergencyContacts extends StatelessWidget {
  const _UserProfileEmergencyContacts();

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: <Widget>[
        Text(
          'Emergency contacts',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.colorScheme.primary,
          ),
        ),
        ValueListenableBuilder<Iterable<UserEmergencyContact>>(
          valueListenable: context.viewModel<UserProfileViewModel>().emergencyContacts,
          builder: (BuildContext context, Iterable<UserEmergencyContact> emergencyContacts, _) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: emergencyContacts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 0.45,
              ),
              itemBuilder: (BuildContext context, int index) {
                final UserEmergencyContact emergencyContact = emergencyContacts.elementAt(index);

                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SpacedRow(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Chip(
                            padding: const EdgeInsets.all(4),
                            color: MaterialStateProperty.all<Color>(context.theme.colorScheme.primary.withOpacity(0.2)),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            label: Text('${index + 1}'),
                          ),
                          Text(
                            emergencyContact.name,
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
