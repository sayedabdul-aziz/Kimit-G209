import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_btn.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                bool isDarkMode =
                    AppLocalStorage.getCachedData("isDarkMode") ?? false;
                if (isDarkMode) {
                  AppLocalStorage.cacheData("isDarkMode", false);
                } else {
                  AppLocalStorage.cacheData("isDarkMode", true);
                }
                setState(() {});
              },
              icon: const Icon(Icons.sunny))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage:
                        AppLocalStorage.getCachedData('image') != null
                            ? FileImage(
                                File(AppLocalStorage.getCachedData('image')))
                            : const AssetImage('assets/images/user.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showImageBottomSheet(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(40),
              Divider(
                thickness: 1,
                color: AppColors.primaryColor,
              ),
              const Gap(30),
              Row(
                children: [
                  Text(
                    AppLocalStorage.getCachedData('name'),
                    style: getTitleTextStyle(context,
                        color: AppColors.primaryColor, fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton.outlined(
                      constraints:
                          const BoxConstraints(maxHeight: 35, maxWidth: 35),
                      style: IconButton.styleFrom(
                          side: BorderSide(color: AppColors.primaryColor)),
                      onPressed: () {
                        showNameBottomSheet(context);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: AppColors.primaryColor,
                        size: 20,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showImageBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 3,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const Gap(20),
                CustomButton(
                    text: 'Upload From Camera',
                    onPressed: () {
                      pickProfileImage();
                    }),
                const Gap(15),
                CustomButton(
                    text: 'Upload From Gallery',
                    onPressed: () {
                      pickProfileImage(false);
                    }),
              ],
            ),
          );
        });
  }

  showNameBottomSheet(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var textController = TextEditingController(
      text: AppLocalStorage.getCachedData('name'),
    );
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const Gap(11),
                    TextFormField(
                      style: getBodyTextStyle(
                        context,
                      ),
                      controller: textController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const Gap(10),
                    CustomButton(
                        text: 'Update Name',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AppLocalStorage.cacheData(
                                'name', textController.text);
                            setState(() {});
                            Navigator.pop(context);
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  pickProfileImage([bool isCamera = true]) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        AppLocalStorage.cacheData('image', value.path);
        setState(() {});
      }
    });
    Navigator.pop(context);
  }
}
