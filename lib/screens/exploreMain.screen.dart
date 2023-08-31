import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:spotter/screens/profile.screen.dart';
import '../models/usuario.dart';
import '../utils/calculoEdad.util.dart';

class ExploreMainScreen extends StatefulWidget {
  ExploreMainScreen({super.key});

  @override
  State<ExploreMainScreen> createState() => _ExploreMainScreenState();
}

class _ExploreMainScreenState extends State<ExploreMainScreen> {
  CardSwiperController _controllerCards = CardSwiperController();

  final cards =
      candidates.map((candidate) => ImageConInformacion(candidate)).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: [
          Flexible(
            child: CardSwiper(
              controller: _controllerCards,
              cardsCount: cards.length,
              onSwipe: _onSwipe,
              numberOfCardsDisplayed: 1,
              //isLoop: false,
              onEnd: () {
                // TODO Mostrar un mensaje de que no hay más tarjetas o llamar a más tarjetas
                debugPrint('Se han mostrado todas las tarjetas');
              },

              padding: const EdgeInsets.symmetric(horizontal: 20),
              cardBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(20), child: cards[index]),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _controllerCards.swipeLeft,
                child: Icon(
                  Icons.close_rounded,
                  color: Get.theme.primaryColorDark,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  elevation: 10.0,
                  backgroundColor: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _controllerCards.swipeTop();
                },
                child: Icon(
                  LineIcons.heartAlt,
                  size: 50,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  elevation: 10.0,
                ),
              ),
              ElevatedButton(
                onPressed: _controllerCards.swipeRight,
                child: Icon(
                  Icons.star_rate_rounded,
                  color: Color(0xFF8A2387),
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                  elevation: 10.0,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    print('---------');
    debugPrint(
      'La tarjeta $previousIndex le has hecho ${direction.name}. La tarjeta que hay ahora en pantalla es $currentIndex',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'La tarjeta $currentIndex le has hecho ${direction.name}',
    );
    return true;
  }
}

// ignore: must_be_immutable

// ignore: must_be_immutable
class ImageConInformacion extends StatelessWidget {
  final Usuario candidate;
  int _indexFoto = 0;

  ImageConInformacion(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _foto = candidate.fotos[_indexFoto];
    print('Cantidad de imagenes ${candidate.fotos.length}');

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: _foto, // TODO: Poner una imagen de error
          placeholder: (context, url) => Container(
              color: Colors.white,
              child: Center(
                  child: CircularProgressIndicator(
                color: Get.theme.primaryColor,
              ))),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  _indexFoto == 0
                      ? _indexFoto = candidate.fotos.length - 1
                      : _indexFoto--;
                  _foto = candidate.fotos[_indexFoto];
                  print('Foto: $_indexFoto');
                  Get.forceAppUpdate();
                },
                child: Container(
                  color: Colors.red.withOpacity(0.0),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  _indexFoto == candidate.fotos.length - 1
                      ? _indexFoto = 0
                      : _indexFoto++;
                  _foto = candidate.fotos[_indexFoto];
                  print('Foto: $_indexFoto');
                  Get.forceAppUpdate();
                },
                child: Container(
                  color: Colors.blue.withOpacity(0.0),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      LineIcons.mapMarker,
                      color: Colors.black,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      candidate.provincia!,
                      style: Get.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(),
            GestureDetector(
              onTap: () {
                print('Entrando en el perfil de ${candidate.nombre}');
                Get.bottomSheet(
                  ProfileScreen(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  ignoreSafeArea: false,
                );
                //Get.toNamed('/profile', arguments: candidate);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.black12,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      candidate.nombre! +
                          ', ${calculoEdad(candidate.fechaNacimiento!)}',
                      style: TextStyle(
                        fontFamily: 'Swis721',
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      candidate.profesion!,
                      style: TextStyle(
                        fontFamily: 'Swis721',
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      candidate.intereses!.join(', '),
                      style: TextStyle(
                        fontFamily: 'Swis721',
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

final List<Usuario> candidates = [
  Usuario(
    nombre: 'Patricia',
    fechaNacimiento: DateTime(1997, 03, 13),
    profesion: 'Developer',
    provincia: 'Areado',
    intereses: ['Travel, Music, Sports'],
    fotos: [
      'https://images.pexels.com/photos/13965335/pexels-photo-13965335.jpeg',
      'https://images.pexels.com/photos/3452877/pexels-photo-3452877.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/14723748/pexels-photo-14723748.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/416809/pexels-photo-416809.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ],
  ),
  Usuario(
    nombre: 'Alvaro',
    fechaNacimiento: DateTime(2000, 03, 13),
    profesion: 'Manager',
    provincia: 'New York',
    intereses: ['Travel, Music, Sports'],
    fotos: [
      'https://images.pexels.com/photos/3452877/pexels-photo-3452877.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/13965335/pexels-photo-13965335.jpeg',
      'https://images.pexels.com/photos/14723748/pexels-photo-14723748.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/416809/pexels-photo-416809.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ],
  ),
  Usuario(
    nombre: 'Pedro',
    fechaNacimiento: DateTime(2004, 03, 13),
    profesion: 'Engineer',
    provincia: 'London',
    intereses: ['Travel, Music, Sports'],
    fotos: [
      'https://images.pexels.com/photos/14723748/pexels-photo-14723748.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/13965335/pexels-photo-13965335.jpeg',
      'https://images.pexels.com/photos/3452877/pexels-photo-3452877.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/416809/pexels-photo-416809.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ],
  ),
  Usuario(
    nombre: 'Maria',
    fechaNacimiento: DateTime(1999, 03, 13),
    profesion: 'Designer',
    provincia: 'Tokyo',
    intereses: ['Travel, Music, Sports'],
    fotos: [
      'https://images.pexels.com/photos/416809/pexels-photo-416809.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/13965335/pexels-photo-13965335.jpeg',
      'https://images.pexels.com/photos/3452877/pexels-photo-3452877.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'https://images.pexels.com/photos/14723748/pexels-photo-14723748.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ],
  ),
];
