import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListLikesScreen extends StatelessWidget {
  const ListLikesScreen({super.key});

  final _likesController = 0;

  @override
  Widget build(BuildContext context) {
    return _likesController == 0 ? _sinLikes() : _conLikes();
  }
}

class _conLikes extends StatelessWidget {
  const _conLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}

class _sinLikes extends StatelessWidget {
  const _sinLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Aquí aparecerán tus likes',
            style: Get.textTheme.bodyMedium,
          ),
          SizedBox(height: 20),
          Text(
            '¡Empieza a dar likes!',
            style: Get.textTheme.bodyMedium,
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Color de la sombra
                  blurRadius: 10, // Radio del desenfoque de la sombra
                  offset: Offset(0, 3), // Desplazamiento en x e y de la sombra
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(
                Icons.star_rate_rounded,
                color: Color(0xFF8A2387),
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
