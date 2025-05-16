import 'package:flutter/material.dart';
import 'package:therapy_app/pantallas/agenda.dart';
import 'package:therapy_app/pantallas/settings.dart';
import 'package:therapy_app/pantallas/home_p.dart';

class UsuariosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('UsuariosAsignadosPage')
      ),
    );
  }
}

/*
class UsersPage extends StatefulWidget {
  const UsersPage({super.key, required this.title});

  final String title;

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
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
    return Scaffold(
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
      body: Center(child: _widgetOptions[_selectedIndex]),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), //color de fondo

      drawer: Drawer(
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
              title: const Text('Home'),
              selected: _selectedIndex == 0, //seleccionar index
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                //ACA DEBERIA HABER UN NAVIGATOR PUSH************************************************************************** 
                //
                //Navigator.push
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(title: 'title')));
              
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
                    builder: (context) => const UsersPage(title: 'Therapy App | Inicio',),));
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
              },
            ),
          ],
        ),
      ),
    );
  }
}


class Pepe extends StatelessWidget {
  const Pepe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//flutter snippet revisar */