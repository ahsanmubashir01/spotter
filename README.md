# spotter

Esta aplicación una red social, la cual está pensada para unir a personas amantes del deporte. La unión no tiene porque ser sentimental, sobretodo esta creada para hacer GymBros y poder entrenar con gente nueva y que ame lo mismo que tu.

## Estructura de carpetas

- lib/

  - models/: Clases que representan los modelos de datos de la aplicación.

  - controllers/: Clases que implementan la lógica de negocio y se comunican con las vistas. ( También llamada viewmodels/ )

  - screens/: Páginas de la aplicación y widgets reutilizables que componen la interfaz de usuario.

  - services/: Clases que encapsulan la lógica para acceder a servicios externos, como Firebase.

  - utils/: Clases de utilidad que proporcionan funcionalidades genéricas para la aplicación.

  - main.dart: Punto de entrada de la aplicación.

  - firebase_options.dart: Configuración entre el proyecto y firebase.

## Orden de la páginas

- Inicio

  - Splash Screen: Comprueba si hay internet y conexión con firebase

- Inicio de sesión: En caso de que el usuario no esté registrado vamos aquí

- Explore Main: En el caso de que esté registrado vamos aquí

- Registrar Screen: En caso de que no este registrado entramos aquí desde la ventana de inicio de sesión
  Ponemos el correo y la contraseña.

  - Nombre
  - Provincia
  - Genero
  - Fecha nacimiento
  - Que genero quieres
  - Profesión
  - Orientación sexual
  - Tipo de relación
  - Fotos
  - Pasiones

  Se sube toda la información y se va a Explore Main.
