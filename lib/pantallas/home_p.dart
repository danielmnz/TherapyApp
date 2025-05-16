import 'package:flutter/material.dart';
import 'package:therapy_app/pantallas/agenda.dart';
import 'package:therapy_app/pantallas/faq.dart';
import 'package:therapy_app/pantallas/profile.dart';
import 'package:therapy_app/pantallas/settings.dart';
import 'package:therapy_app/pantallas/drawer_header.dart';
import 'package:therapy_app/pantallas/usuarios.dart';
import 'package:therapy_app/pantallas/content.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int _selectedIndex = 0;
  var currentPage = DrawerSections.inicioo; //

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

  //chat
 Widget menuItem(int id, String title, IconData icon, bool selected, BuildContext context) {
  return Material(
    color: selected ? Colors.grey : Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.pop(context); // cerrar el drawer

        setState(() {
          if (id == 1) {
            currentPage = DrawerSections.inicioo;
          } else if (id == 2) {
            currentPage = DrawerSections.miperfil;
          } else if (id == 3) {
            currentPage = DrawerSections.agenda;
          } else if (id == 4) {
            currentPage = DrawerSections.usuarios_asignados;
          } else if (id == 5) {
            currentPage = DrawerSections.settings;
          } else if (id == 6) {
            currentPage = DrawerSections.faq;
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(child: Icon(icon, size: 20, color: Colors.black)),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget TarjetaImagen(Content item, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Ir a otra pantalla si quieres, o eliminar esta parte si no navegas
    },
    child: Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(item.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            height: 300.0,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 56.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 8.0),
                Text(item.subtitle,
                    style: TextStyle(fontSize: 16.0, color: Colors.white70)),
                SizedBox(height: 8.0),
                Text(item.date,
                    style: TextStyle(fontSize: 14.0, color: Colors.white70)),
              ],
            ),
          ),
          /*
          Positioned(
            top: 16.0,
            right: 16.0,
            child: Icon(
              item.like ? Icons.thumb_up : Icons.thumb_down,
              color: item.like ? Colors.green : Colors.red,
              size: 32.0,
            ),
          ),*/
        ],
      ),
    ),
  );
}

  //
  Widget MyDrawerList(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      children: [
        menuItem(1, "Inicio", Icons.home, currentPage == DrawerSections.inicioo, context),
        menuItem(2, "Mi Perfil", Icons.person, currentPage == DrawerSections.miperfil, context),
        menuItem(3, "Agenda", Icons.calendar_today, currentPage == DrawerSections.agenda, context),
        menuItem(4, "Usuarios Asignados", Icons.group, currentPage == DrawerSections.usuarios_asignados, context),

        Divider(), //separar secciones

        menuItem(5, "Configuración", Icons.settings, currentPage == DrawerSections.settings, context),
        menuItem(6, "Preguntas Frecuentes", Icons.question_answer, currentPage == DrawerSections.faq, context),
        //menuItem(7, "Tarjetas", Icons.image, currentPage == DrawerSections.cards, context),

      ],
    ),
  );
}

  //var currentPage = DrawerSections.dashboard; //
  @override
  Widget build(BuildContext context) {
    final List<Content> contentList = [
    Content(
      title: "Instituto Therapy",
      subtitle: "Talca, Región del Maule",
      date: "15 de mayo, 2025",
      imagePath: "images/edificio.jpg",
      //like: false,
    )
  ];

    Widget container = const Center(child: Text("Cargando..."));

      if (currentPage == DrawerSections.inicioo) {
        container = ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bienvenido', //titulo
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...contentList.map((item) => TarjetaImagen(item, context)).toList(),
          ],
        );
      }else if (currentPage == DrawerSections.miperfil) {
        container = ProfilePage();
      } else if (currentPage == DrawerSections.agenda) {
        container = AgendaPage();
      } else if (currentPage == DrawerSections.usuarios_asignados) {
        container = UsuariosPage();
      } else if (currentPage == DrawerSections.settings) {
        container = SettingsPage();
      } else if (currentPage == DrawerSections.faq) {
        container = FaqPage();
      }

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

      body: container,
      
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(context), // pásale el context
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  inicioo,
  miperfil,
  agenda,
  usuarios_asignados,
  settings,
  faq,
  cards,
}