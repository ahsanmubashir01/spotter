import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotter/firebase_options.dart';

class AutentificacionService {
  AutentificacionService() {
    print('Entra AutentificacionService');
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  bool _isOnline = false;
  bool get isOnline => _isOnline;

  String get email => FirebaseAuth.instance.currentUser!.email!;

  Future<void> init() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        _isOnline = false;
        return;
      } else {
        _isOnline = true;
      }

      // await Firebase.initializeApp(
      //     options: DefaultFirebaseOptions.currentPlatform);
      FirebaseAuth.instance.currentUser?.reload();
      await FirebaseAuth.instance.userChanges().listen((User? user) async {
        //print('Entra el listener de cambios de usuario');
        if (user == null) {
          _loggedIn = false;
          print('No hay usuario logueado');
          //FirebaseAuth.instance.signOut();
        } else {
          //print('UID: ' + FirebaseAuth.instance.currentUser!.uid);
          _loggedIn = true;
        }
      });
    } catch (e) {
      print('Error en init');
      print(e);
      _isOnline = false;
      _loggedIn = false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print('Error en login');
      print(e);
      return false;
    }
  }

  Future<bool> registrarEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await enviarEmailVerificacion();
      return true;
    } catch (e) {
      print('Error en registrarEmail');
      print(e);
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print('Error en logout');
      print(e);
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print('Error en resetPassword');
      print(e);
      return false;
    }
  }

  Future<bool> cambiarPassword(String password) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(password)
          .then((value) => print('Password Updated'));
      return true;
    } catch (e) {
      print('Error en cambiarPassword');
      print(e);
      return false;
    }
  }

  Future<bool> cambiarEmail(String email) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updateEmail(email)
          .then((value) => print('Email Updated'));
      await enviarEmailVerificacion();
      return true;
    } catch (e) {
      print('Error en cambiarEmail');
      print(e);
      return false;
    }
  }

  Future<bool> eliminarEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      return true;
    } catch (e) {
      print('Error en eliminarEmail');
      print(e);
      return false;
    }
  }

  Future<void> enviarEmailVerificacion() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> emailVerified() async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error en emailVerified');
      print(e);
      return false;
    }
  }
}
