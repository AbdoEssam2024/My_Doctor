import 'package:flutter/material.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/view/core_widgets/custom_text.dart';

class ForgetOptions extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final void Function(bool?) checkBoxFunc;
  final bool val;
  final Color borderColor;
  final Color imageColor;

  const ForgetOptions({
    super.key,
    required this.imageColor,
    required this.borderColor,
    required this.val,
    required this.title,
    required this.subtitle,
    required this.checkBoxFunc,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth! * 0.04),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(image, color: imageColor),
        title: CustomText(text: title, size: 16, weight: FontWeight.w400),
        subtitle: CustomText(
          text: subtitle,
          size: 12,
          textColor: AppColors.blackColor,
          weight: FontWeight.w400,
        ),
        trailing: Checkbox(
          value: val,
          onChanged: checkBoxFunc,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          activeColor: AppColors.blueColor,
          side: BorderSide(color: AppColors.blueColor, width: 2),
        ),
      ),
    );
  }
}
