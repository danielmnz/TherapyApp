import 'package:flutter/material.dart';
import 'package:therapy_app/pantallas/agenda.dart';
import 'package:therapy_app/pantallas/faq.dart';
import 'package:therapy_app/pantallas/profile.dart';
import 'package:therapy_app/pantallas/settings.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //EL SCAFFOLD
      appBar: AppBar(
        backgroundColor: Colors.red, //color barra
        title: Text(
            widget.title,
            //color de texto del titulo
            style: const TextStyle(color: Colors.white)),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          height:double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dibujos.jpg"),
              fit: BoxFit.cover,
              ), //AQUIIIIIIIIIIIIIIII
          ),
          
          child: _widgetOptions[_selectedIndex]
          
        ),
        
        ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), //color de fondo

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Titulo Drawer')),

            ListTile( //BOTON INICIO
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {}, //ME FALTA NAVEGACION ENTRE PAGINAS NOMAS PORQUE NO FUNCIONABA BIEN
              ),

            ListTile( //BOTON PERFIL
              leading: Icon(Icons.person),
              title: Text('Mi Perfil')
              ),

            ListTile( //BOTON AGENDA
              leading: Icon(Icons.calendar_month),
              title: Text('Agenda')
              ),

            ListTile( //BOTON USUARIOS
              leading: Icon(Icons.family_restroom),
              title: Text('Usuarios Asignados')
              ),

            //separar secciones
            Divider(color: Colors.black,),

            ListTile( //BOTON CONFIG
              leading: Icon(Icons.settings),
              title: Text('Configuración')
              ),

            ListTile( //BOTON FAQ
              leading: Icon(Icons.question_answer_outlined),
              title: Text('Preguntas Frecuentes')
              ),

            ListTile( //BOTON CONTACTO
              leading: Icon(Icons.quick_contacts_dialer_rounded),
              title: Text('Contacto')
              ),
          ],
        ),
      )
      /*
      drawer: Drawer( //EL DRAWER
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Titulo del Drawer'),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined), //icono casita
              title: const Text('Inicio'),
              selected: _selectedIndex == 0, //seleccionar index
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                //ACA DEBERIA HABER UN NAVIGATOR PUSH************************************************************************** 
                //
                //Navigator.push
                //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'title')));
              
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: const Text('Mi perfil'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(title: 'Mi Perfil',),));
                //Navigator.pop(context);
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded), //modificar despues el icono
              title: const Text('Agenda'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.of(context).push( //con push pa volver atras, cambiar
                  MaterialPageRoute(
                    builder: (context) => const AgendaPage(title: 'Agenda',),));
              },
            ),
            ListTile(
              leading: const Icon(Icons.family_restroom_outlined),
              title: const Text('Usuarios Asignados'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            const Divider(color: Colors.black), //partir secciones

            ListTile(
              leading: Icon(Icons.build),
              title: const Text('Configuración'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.of(context).push( //con push pa volver atras, cambiar
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(title: 'Configuración',),));
                
              },
            ),
            ListTile(
              leading: Icon(Icons.live_help),
              title: const Text('Preguntas Frecuentes'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                //Navigator.pop(context);
                //añadir el navigator push sin el pop aqui cuando tenga la pantalla creada
                Navigator.of(context).push( //con push pa volver atras, cambiar
                  MaterialPageRoute(
                    builder: (context) => const FaqPage(title: 'Preguntas Frecuentes',),));
              },
            ),
          ],
        ),
      ),*/
    );
  }
}