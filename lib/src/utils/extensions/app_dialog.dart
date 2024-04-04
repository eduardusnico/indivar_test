import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indivar_test/src/utils/resources/reusable_button.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_padding.dart';

//TODO add ontap
class AppDialog {
  static tryCatchPokemon(
      {VoidCallback? topButtonPressed, VoidCallback? bottomButtonPressed}) {
    CustomAppDialog.withTwoButton(
      icon: Icons.question_mark,
      content: 'Are you sure want to catch this pokemon?',
      topButtonText: 'OK',
      topButtonPressed: topButtonPressed,
      bottomButtonText: 'Cancel',
      bottomButtonPressed: bottomButtonPressed,
    );
  }

  static failedCatchPokemon() {
    CustomAppDialog.withOneButton(
      icon: Icons.close,
      content: 'Failed to catch the Pokemon!',
      buttonText: 'OK',
    );
  }

  static successCatchPokemon() {
    CustomAppDialog.withOneButton(
      icon: Icons.check,
      content: "You're successfully catch the pokemon!",
      buttonText: 'OK',
    );
  }

  static alreadyOwnPokemon() {
    CustomAppDialog.withOneButton(
      icon: Icons.close,
      content: 'You already owned this Pokemon!',
      buttonText: 'OK',
    );
  }

  static releasePokemon(
      {VoidCallback? topButtonPressed, VoidCallback? bottomButtonPressed}) {
    CustomAppDialog.withTwoButton(
      icon: Icons.question_mark,
      content: 'Are you sure want to release this pokemon?',
      topButtonText: 'OK',
      topButtonPressed: topButtonPressed,
      bottomButtonText: 'Cancel',
      bottomButtonPressed: bottomButtonPressed,
    );
  }
}

sealed class CustomAppDialog {
  static withTwoButton(
      {required IconData icon,
      required String content,
      required String topButtonText,
      required String bottomButtonText,
      VoidCallback? topButtonPressed,
      VoidCallback? bottomButtonPressed}) {
    return Get.defaultDialog(
      radius: 8,
      contentPadding: const EdgeInsets.only(left: 14, right: 14, top: 10),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.close,
                  color: kCharcoal,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kTomato, width: 3)),
            child: Icon(
              icon,
              color: kTomato,
              size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14.5,
                  fontFamily: poppins,
                  fontWeight: FontWeight.w600),
            ),
          ),
          ReusableFloatButton(
              text: topButtonText,
              onPressed: topButtonPressed ?? () => Get.back()),
          ReusableOutlineButton(
              text: bottomButtonText,
              onPressed: bottomButtonPressed ?? () => Get.back())
        ],
      ),
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      titlePadding: kInsetsZero,
    );
  }

  static withOneButton(
      {required IconData icon,
      required String content,
      required String buttonText,
      VoidCallback? buttonPressed}) {
    return Get.defaultDialog(
      radius: 8,
      contentPadding: const EdgeInsets.only(left: 14, right: 14, top: 10),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.close,
                  color: kCharcoal,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kTomato, width: 3)),
            child: Icon(
              icon,
              color: kTomato,
              size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: poppins,
                  fontWeight: FontWeight.w600),
            ),
          ),
          ReusableFloatButton(
              text: buttonText, onPressed: buttonPressed ?? () => Get.back()),
        ],
      ),
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      titlePadding: kInsetsZero,
    );
  }
}
