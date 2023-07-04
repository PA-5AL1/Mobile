import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/loading_result_error_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/loading_result_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/image_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/controllers/user_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/screens/profile/user_panel_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/screens/profile/widgets/profile_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userController = Get.put(UserController());
  final controller = Get.put(AuthenticationController());
  late Future<String> _email;
  late Future<String> _role;
  // bool themeMode = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
  //         .platformBrightness ==
  //     Brightness.dark;
  late bool _isDark;

  @override
  initState() {
    super.initState();
    _email = retrieveCurrentUserEmail();
    _isDark = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .platformBrightness ==
        Brightness.dark;
  }

  Future<String> retrieveCurrentUserEmail() async {
    var user = await controller.currentUser;
    // _role = await userController.getUserData(user.email);
    return user.email;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    return FutureBuilder(
      future: _email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(tDefaultSize),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                            image: AssetImage(tProfileImage),
                          ),
                        ),
                      ),
                      const SizedBox(height: tDefaultSize / 2),
                      Text(
                        snapshot.data!,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: tDefaultSize / 2),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const UpdateProfileScreen()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tRedCroixRougeColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(tEditProfile),
                        ),
                      ),
                      const SizedBox(height: tDefaultSize),
                      const Divider(),
                      const SizedBox(height: tDefaultSize / 2),
                      ProfileMenuWidget(
                        title: _isDark ? tLightMode : tDarkMode,
                        icon: _isDark ? tSunIcon : tMoonIcon,
                        onPress: () {},
                        trailing: Switch(
                          value: _isDark,
                          onChanged: (value) {
                            Get.changeThemeMode(
                              value ? ThemeMode.dark : ThemeMode.light,
                            );
                            setState(() {
                              _isDark = value;
                            });
                          },
                        ),
                      ),
                      ProfileMenuWidget(
                        title: tUsersPanel,
                        icon: tUserPanelIcon,
                        onPress: () => Get.to(() => const UserPanelScreen()),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: tSecondaryColor.withOpacity(0.1),
                          ),
                          child: const Icon(tArrowRightIcon),
                        ),
                      ),
                      const SizedBox(height: tDefaultSize / 2),
                      const Divider(),
                      const SizedBox(height: tDefaultSize / 2),
                      ProfileMenuWidget(
                        title: tInfo,
                        icon: tInformationIcon,
                        onPress: () {
                          Get.defaultDialog(
                            title: tInfo,
                            middleTextStyle: TextStyle(
                                fontSize: 14,
                                color: _isDark ? tWhiteColor : tBlack),
                            middleText: tInfoText,
                            textConfirm: tOk,
                            confirmTextColor: tWhiteColor,
                            onConfirm: () => Get.back(),
                          );
                        },
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: tSecondaryColor.withOpacity(0.1),
                          ),
                          child: const Icon(tArrowRightIcon),
                        ),
                      ),
                      ProfileMenuWidget(
                        title: tLogout,
                        titleColor: tRedCroixRougeColor,
                        icon: tLogoutIcon,
                        onPress: () {
                          controller.logoutUser();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const LoadingResultErrorWidget();
          } else {
            return const LoadingResultErrorWidget();
          }
        } else {
          return const LoadingResultWidget();
        }
      },
    );
  }
}
