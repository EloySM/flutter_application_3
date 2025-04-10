import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/home/views/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        // ClipRReact => Clip Rounded Rectangle, se encarga de aplicar redondeados a lo que estea dentro(imagenes, contenedores, etc)
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),

        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.graph_square_fill),
              label: 'Start',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation
              .centerDocked, // Al poner centerDocked el boton se centrara
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(), // Esto hace que el boton sea redondeado,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(  // Añado decoración
            shape: BoxShape.circle,  // Para que el gradiente sea circular
            gradient: LinearGradient(  // La decoración sera un gradiente linear
              colors: [  // Los gradientes a utilizar serán estes
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: GradientRotation(1)  // Rotacion del gradiante
            ),
          ),
          child: Icon(CupertinoIcons.add), // Esto añadirá un icono de una cruz
        ),
      ),
      body: MainScreen(),
    );
  }
}