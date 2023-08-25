class Usuario {
  String? userId;
  bool isActive;
  String? nombre;
  String? provincia;
  String? genero;
  DateTime? fechaNacimiento = DateTime(2000, 1, 1);
  String? sexoBusca;
  String? profesion;
  List<String>? orientacionSexual;
  List<String>? tipoRelacionBusca;
  List<String> fotos;
  List<String>? intereses = [];
  String? descripcion;
  double? altura;
  double? peso;
  String? frecuenciaEntrenamiento;
  String? horarioEntrenamiento;
  Map<String, String>? swipes;

  Usuario({
    this.userId,
    this.isActive = true,
    this.nombre,
    this.provincia,
    this.genero,
    this.fechaNacimiento,
    this.sexoBusca,
    this.profesion,
    this.orientacionSexual,
    this.tipoRelacionBusca,
    List<String>? fotos,
    this.intereses,
    this.descripcion,
    this.altura,
    this.peso,
    this.frecuenciaEntrenamiento,
    this.horarioEntrenamiento,
    this.swipes,
  }) : fotos = fotos ?? [];

  factory Usuario.fromMap(Map<String, dynamic> data, String documentId) {
    return Usuario(
      userId: documentId,
      isActive: data['isActive'],
      nombre: data['nombre'],
      provincia: data['provincia'],
      genero: data['genero'],
      fechaNacimiento: data['fechaNacimiento'].toDate(),
      sexoBusca: data['sexoBusca'],
      profesion: data['profesion'],
      orientacionSexual: data['orientacionSexual'].cast<String>(),
      tipoRelacionBusca: data['tipoRelacionBusca'].cast<String>(),
      fotos: data['fotos'].cast<String>(),
      intereses: data['intereses'].cast<String>(),
      descripcion: data['descripcion'],
      altura: data['altura'],
      peso: data['peso'],
      frecuenciaEntrenamiento: data['frecuenciaEntrenamiento'],
      horarioEntrenamiento: data['horarioEntrenamiento'],
      //swipes: data['swipes'].cast<String, String>() ,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isActive': isActive,
      'nombre': nombre,
      'provincia': provincia,
      'genero': genero,
      'fechaNacimiento': fechaNacimiento,
      'sexoBusca': sexoBusca,
      'profesion': profesion,
      'orientacionSexual': orientacionSexual,
      'tipoRelacionBusca': tipoRelacionBusca,
      'fotos': fotos,
      'intereses': intereses,
      'descripcion': descripcion,
      'altura': altura,
      'peso': peso,
      'frecuenciaEntrenamiento': frecuenciaEntrenamiento,
      'horarioEntrenamiento': horarioEntrenamiento,
      'swipes': swipes,
    };
  }
}
