import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  const factory CustomOutlinedButton.icon({
    Function()? onPressed,
    required String label,
    required Widget icon,
  }) = _CustomOutlinedButtonWithIcon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: _getButtonStyle(),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  ButtonStyle _getButtonStyle() {
    return TextButton.styleFrom(
      minimumSize: const Size(500.0, 60.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      side: const BorderSide(color: Colors.black, width: 1.0),
      textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}

class _CustomOutlinedButtonWithIcon extends CustomOutlinedButton {
  final Widget icon;

  const _CustomOutlinedButtonWithIcon({
    super.onPressed,
    required super.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: _getButtonStyle(),
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
    );
  }
}