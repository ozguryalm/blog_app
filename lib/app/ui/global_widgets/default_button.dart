// ignore_for_file: unrelated_type_equality_checks

import 'package:blog/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function() oneTap;
  final bool filled;
  final Widget? loadingWidget;
  const DefaultButton(
      {Key? key,
      required this.text,
      required this.oneTap,
      required this.filled, this.loadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              filled ? defaultColor : Colors.white),
          fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(6.63.h))),
      onPressed: () {
        oneTap();
      },
      child: Stack(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Theme.of(context).elevatedButtonTheme.style!.backgroundColor ==
                  Colors.white
              ? (filled
                  ? Image.asset("assets/icons/login_icon_white.png")
                  : Image.asset("assets/icons/login_icon_black.png"))
              : (filled
                  ? Image.asset("assets/icons/login_icon_white.png")
                  : Image.asset("assets/icons/login_icon_black.png")),
        ),
        Center(
          child:loadingWidget?? Text(
            text,
            style: TextStyle(
                color: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .backgroundColor ==
                        Colors.white
                    ? (filled ? defaultColor : Colors.white)
                    : (filled ? Colors.white : defaultColor)),
          ),
        ),
      ]),
    );
  }
}
