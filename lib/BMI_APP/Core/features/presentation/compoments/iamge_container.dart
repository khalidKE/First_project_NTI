import 'package:first_app/BMI_APP/Core/features/presentation/compoments/theme/app_color.dart';
import 'package:flutter/material.dart';

class IamgeContainer extends StatelessWidget {
  const IamgeContainer({
    super.key,
    required this.genderSelection,
    required this.path,
    required this.value,
  });

  final String genderSelection;
  final String path;
  final String value;

  @override
  Widget build(BuildContext context) {
    final isSelected = genderSelection == value;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.lightBlue2,
        border: Border.all(
          color: isSelected ? AppColor.purple : Colors.transparent,
          width: 3,
        ),
      ),
      child: Image.asset(
        path,
        height: 100,
        width: 100,
      ),
    );
  }
}