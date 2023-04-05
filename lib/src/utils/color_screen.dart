import 'package:flutter/material.dart';

/*
..######...######..########..########.########.##....##
.##....##.##....##.##.....##.##.......##.......###...##
.##.......##.......##.....##.##.......##.......####..##
..######..##.......########..######...######...##.##.##
.......##.##.......##...##...##.......##.......##..####
.##....##.##....##.##....##..##.......##.......##...###
..######...######..##.....##.########.########.##....##
*/


class ColorScreen extends StatelessWidget {
  final Color color;
  const ColorScreen({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: color);
  }
}
