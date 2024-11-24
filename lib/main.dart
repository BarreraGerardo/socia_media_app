import 'package:firebase_core/firebase_core.dart'; 
// Importa Firebase Core para inicializar Firebase en la app.

import 'package:flutter/material.dart'; 
// Importa Flutter Material para usar widgets básicos y temas visuales.

import 'package:firebase_auth/firebase_auth.dart'; 
// Importa Firebase Authentication para gestionar el inicio de sesión de usuarios.

import 'package:socia_media_app/components/firebase_options.dart'; 
// Importa las configuraciones específicas de Firebase para tu aplicación.

import 'package:socia_media_app/pages/home_page.dart'; 
// Importa la pantalla principal (HomePage) que se mostrará al usuario autenticado.

import 'package:socia_media_app/pages/login_page.dart'; 
// Importa la pantalla de inicio de sesión (LoginPage) para usuarios no autenticados.

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  // Garantiza que los widgets estén inicializados antes de ejecutar cualquier código asincrónico.

  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform, 
  ); 
  // Inicializa Firebase con las configuraciones específicas para la plataforma actual (Android, iOS o Web).

  runApp(const MyApp()); 
  // Inicia la ejecución de la app con la clase MyApp como punto de entrada principal.
}

class MyApp extends StatelessWidget { 
  // Define la clase principal de la app. Es un widget sin estado (Stateless).

  const MyApp({super.key}); 
  // Constructor de MyApp que acepta una clave única (super.key) para identificar este widget.

  @override
  Widget build(BuildContext context) { 
    // Método que construye la interfaz visual de este widget.

    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      // Desactiva la marca de depuración en la esquina superior derecha de la app.

      title: 'The Wall App', 
      // Título de la app, útil para dispositivos o navegadores.

      theme: ThemeData( 
        primarySwatch: Colors.blue, 
      ), 
      // Define el tema visual principal de la app, con un color base azul.

      home: AuthGate(), 
      // Establece AuthGate como la pantalla inicial (widget raíz) de la app.
    );
  }
}

class AuthGate extends StatelessWidget { 
  // Clase que actúa como "puerta" para verificar si el usuario está autenticado.

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz visual de este widget.

    return StreamBuilder<User?>( 
      stream: FirebaseAuth.instance.authStateChanges(), 
      // Escucha continuamente el estado de autenticación del usuario (si ha iniciado sesión o no).

      builder: (context, snapshot) { 
        // Define cómo construir la interfaz dependiendo del estado de autenticación.

        if (snapshot.connectionState == ConnectionState.waiting) { 
          // Si la conexión está en estado "esperando", muestra un indicador de carga.
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) { 
          // Si hay datos en el snapshot, significa que el usuario está autenticado.
          return HomePage(); 
          // Lleva al usuario a la pantalla principal (HomePage).
        } else { 
          // Si no hay datos, el usuario no está autenticado.
          return LoginPage(onTap: () { }); 
          // Muestra la pantalla de inicio de sesión (LoginPage).
        }
      },
    );
  }
}