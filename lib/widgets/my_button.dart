
import 'package:flutter/material.dart';
import 'package:app/config/appcolors.dart';
import 'package:app/config/dimens.dart';
import 'package:app/utils/theme_utils.dart';


class MyButton extends StatelessWidget {

  const MyButton({
    Key key,
    this.text: '',
    @required this.onPressed,
  }): super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);
    return FlatButton(
      onPressed: onPressed,
      textColor: isDark ? AppColors.dark_button_text : Colors.white,
      color: isDark ? AppColors.dark_app_main : AppColors.app_main,
      disabledTextColor: isDark ? AppColors.dark_text_disabled : AppColors.text_disabled,
      disabledColor: isDark ? AppColors.dark_button_disabled : AppColors.button_disabled,
      //shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(fontSize: Dimens.font_sp18),),
      ),
    );
  }
}
