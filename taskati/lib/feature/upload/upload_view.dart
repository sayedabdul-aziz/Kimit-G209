import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/colors.dart';
import 'package:taskati/core/functions/dialogs.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_btn.dart';
import 'package:taskati/feature/home/home_view.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  // cache data
                  AppLocalStorage.cacheData('name', name);
                  AppLocalStorage.cacheData('image', path);
                  AppLocalStorage.cacheData('isUploaded', true);
                  pushWithReplacement(context, const HomeView());
                } else if (path == null && name.isNotEmpty) {
                  showErrorDialog(context, 'Please select image');
                } else if (path != null && name.isEmpty) {
                  showErrorDialog(context, 'Please enter name');
                } else {
                  showErrorDialog(context, 'Please select image and name');
                }
              },
              child: Text('Done',
                  style: getSmallTextStyle(color: AppColors.primaryColor)))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.primaryColor,
                backgroundImage: (path != null)
                    ? FileImage(File(path!))
                    : const AssetImage('assets/images/user.png'),
              ),
              const Gap(20),
              CustomButton(
                text: 'Upload From Camera',
                width: 250,
                onPressed: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.camera)
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        path = value.path;
                      });
                    }
                  });
                },
              ),
              const Gap(10),
              CustomButton(
                text: 'Upload From Gallery',
                width: 250,
                onPressed: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        path = value.path;
                      });
                    }
                  });
                },
              ),
              const Gap(16),
              const Divider(),
              const Gap(16),
              TextFormField(
                style: getBodyTextStyle(
                  context,
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Your Name',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
