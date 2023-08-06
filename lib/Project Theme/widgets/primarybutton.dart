import 'package:flutter/cupertino.dart';
import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.buttonname, this.onPressed});

  final String buttonname;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primary,
        onPressed: onPressed,
        child: Text(buttonname, style: TextStyles.buttontextstyle),
      ),
    );
  }
}
