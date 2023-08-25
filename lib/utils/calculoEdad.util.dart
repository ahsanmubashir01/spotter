int calculoEdad(DateTime nacimiento) {
  DateTime hoy = DateTime.now();
  int edad = hoy.year - nacimiento.year;
  int mes = hoy.month - nacimiento.month;
  if (mes < 0 || (mes == 0 && hoy.day < nacimiento.day)) {
    edad--;
  }
  return edad;
}
