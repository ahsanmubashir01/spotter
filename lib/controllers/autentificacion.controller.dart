import 'package:get/get.dart';
import 'package:spotter/services/autentificacion.service.dart';

class AutentificacionController extends GetxController {
  AutentificacionController() {
    print('Entra AutentificacionController');
  }

  AutentificacionService _autentificacionService = AutentificacionService();

  RxBool _loggedIn = false.obs;
  bool get loggedIn => _loggedIn.value;

  RxBool _isOnline = false.obs;
  bool get isOnline => _isOnline.value;

  RxBool _emailVerified = false.obs;
  bool get emailVerified => _emailVerified.value;

  RxString email = ''.obs;

  Future<void> init() async {
    try {
      await _autentificacionService.init();
      await comprobarVerificacionEmail();
      _loggedIn.value = _autentificacionService.loggedIn;
      _isOnline.value = _autentificacionService.isOnline;
      if (_loggedIn.value) {
        email.value = _autentificacionService.email;
      }
    } catch (e) {
      print(e);
      _isOnline.value = false;
      _loggedIn.value = false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      var result = await _autentificacionService.login(email, password);
      _loggedIn.value = result;
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registrarEmail(String email, String password) async {
    try {
      var result =
          await _autentificacionService.registrarEmail(email, password);
      _loggedIn.value = result;
      this.email.value = email;
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _autentificacionService.logout();
      _loggedIn.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      return await _autentificacionService.resetPassword(email);
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> cambiarPassword(String password) async {
    try {
      return await _autentificacionService.cambiarPassword(password);
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> cambiarEmail(String emailNuevo) async {
    try {
      bool changeTrue = await _autentificacionService.cambiarEmail(emailNuevo);
      if (changeTrue) {
        email.value = emailNuevo;
      }
      return changeTrue;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> eliminarEmail() async {
    try {
      return await _autentificacionService.eliminarEmail();
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> enviarEmailVerificacion() async {
    try {
      await _autentificacionService.enviarEmailVerificacion();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> comprobarVerificacionEmail() async {
    try {
      _emailVerified.value = await _autentificacionService.emailVerified();
      return _emailVerified.value;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
