import 'package:flutter/material.dart';


///[CustomElevatedButton] is used to return [ElevatedButton] with and without icon.
class CustomElevatedButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    this.child,
    required this.onPressed,
  });

  const factory CustomElevatedButton.icon({
    Function()? onPressed,
    required Widget icon,
    required Widget label,
  }) = _CustomElevatedButtonWithIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: getButtonStyle(),
      child: child,
    );
  }

  ButtonStyle getButtonStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(10.0),
      // backgroundColor: Colors.white,
      minimumSize: const Size.fromHeight(50),
    );
  }
}

///[_CustomElevatedButtonWithIcon] class is used to return when factor [CustomElevatedButton] constructor.
///The arguments [label] and [icon] must be not null.
class _CustomElevatedButtonWithIcon extends CustomElevatedButton {
  final Widget icon;
  final Widget label;

  const _CustomElevatedButtonWithIcon({
    super.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: label,
      style: super.getButtonStyle(),
    );
  }
}
