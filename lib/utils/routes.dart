import 'package:get/get.dart';
import 'package:spotter/screens/exploreMain.screen.dart';
import 'package:spotter/screens/listLikes.screen.dart';
import 'package:spotter/screens/registroScreens/Stories.dart';
import 'package:spotter/screens/registroScreens/chat.dart';
import 'package:spotter/screens/registroScreens/chatnew.dart';
import 'package:spotter/screens/registroScreens/likes.dart';
import 'package:spotter/screens/registroScreens/mainprofile.dart';
import 'package:spotter/screens/registroScreens/matche.dart';
import 'package:spotter/screens/registroScreens/messagelist.dart';
import 'package:spotter/screens/registroScreens/payment.dart';
import 'package:spotter/screens/registroScreens/photofullscreen.dart';
import 'package:spotter/screens/registroScreens/privacypolicy.dart';
import 'package:spotter/screens/registroScreens/profilesettings.dart';
import 'package:spotter/screens/registroScreens/subscription.dart';
import 'package:spotter/screens/registroScreens/subscriptionoptingmessage.dart';
import 'package:spotter/screens/registroScreens/termofuse.dart';
import 'package:spotter/screens/screens.dart';
import '../screens/registroScreens/matches.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: '/pruebas', page: () => Example()),
  GetPage(name: '/', page: () => SplashScreen()),
  GetPage(name: '/onboarding', page: () => OnboardingScreen()),
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/register', page: () => RegisterScreen()),
  GetPage(name: '/name', page: () => NameScreen()),
  GetPage(name: '/location', page: () => LocationScreen()),
  GetPage(name: '/gender', page: () => GenderScreen()),
  GetPage(name: '/birthday', page: () => BirthdayScreen()),
  GetPage(name: '/showMe', page: () => ShowMe()),
  GetPage(name: '/occupation', page: () => OccupationScreen()),
  GetPage(name: '/sexualOrientation', page: () => SexualOrientationScreen()),
  GetPage(name: '/lookingFor', page: () => LookingForScreen()),
  GetPage(name: '/photosAdd', page: () => PhotosAddScreen()),
  GetPage(name: '/passions', page: () => PassionsScreen()),
  GetPage(name: '/subirUsuario', page: () => SubirUsuarioScreen()),
  GetPage(name: '/verificacionCorreo', page: () => VerificacionCorreoScreen()),
  GetPage(name: '/exploreMain', page: () => LogicaBottomNavigatorBarScreen()),
  GetPage(name: '/perfil', page: () => ProfileScreen()),
  GetPage(name: '/privacy', page: () => PrivacyPolicy()),
  GetPage(name: '/term', page: () => TermOfUse()),
  GetPage(
      name: '/subscriptionoptingmessage',
      page: () => SubscriptionOptingMessage()),
  GetPage(name: '/payment', page: () => PaymentScreen()),
  GetPage(name: '/photofullscreen', page: () => PhotoFullScreen()),
  GetPage(name: '/listlikescreen', page: () => ListLikesScreen()),
  GetPage(name: '/matches', page: () => Matches()),
  GetPage(name: '/likes', page: () => HomePage()),
  GetPage(name: '/chatnew', page: () => ChatNew()),
  GetPage(name: '/chat', page: () => ChatScreen()),
  // GetPage(name: '/profilesetting', page: () => ProfileSettings()),
  GetPage(name: '/Match', page: () => MatchApp()),
  GetPage(name: '/story', page: () => Story()),
  GetPage(name: '/profilesettings', page: () => MainProfile()),
  // GetPage(name: '/profilesettings', page: () => ProfileSettings()),
  GetPage(name: '/messagelist', page: () => MessageList()),
];
