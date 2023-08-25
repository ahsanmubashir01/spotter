import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ListMatchesScreen extends StatelessWidget {
  const ListMatchesScreen({super.key});

  final _matchesController = 0;

  @override
  Widget build(BuildContext context) {
    return _matchesController == 0 ? _sinMatches() : _conMatches();
  }
}

class _conMatches extends StatelessWidget {
  const _conMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}

class _sinMatches extends StatelessWidget {
  const _sinMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Aquí aparecerán tus matches',
            style: Get.textTheme.bodyMedium,
          ),
          SizedBox(height: 20),
          Text(
            '¡Empieza a dar likes!',
            style: Get.textTheme.bodyMedium,
          ),
          SizedBox(height: 20),
          CircleAvatar(
            backgroundColor: Color(0xFFB81010),
            radius: 50,
            child: Icon(
              LineIcons.heartAlt,
              color: Colors.white,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
