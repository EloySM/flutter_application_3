import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/add_expense/views/add_expense.dart';
import 'package:flutter_application_3/screens/home/views/main_screen.dart';
import 'package:flutter_application_3/screens/stats/stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var widgetList = [MainScreen(), StatScreen()];

  int index = 0;

  // context es un objeto que representa la ubicación de un widget
  // No se puede utilizar context fuera del método build() (o métodos como initState() en un StatefulWidget) porque context depende del ciclo de vida del widget y de la construcción del árbol de widgets en Flutter.
  // Poner late se inicializa la variable pero no se le da un valor a la variable hasta que se llegue a utilizar(a pesar de que ya lo tenga)
  late Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        // ClipRReact => Clip Rounded Rectangle, se encarga de aplicar redondeados a lo que estea dentro(imagenes, contenedores, etc)
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),

        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                color: index == 0 ? selectedItem : unselectedItem,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.graph_square_fill,
                color: index == 1 ? selectedItem : unselectedItem,
              ),
              label: 'Start',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation
              .centerDocked, // Al poner centerDocked el boton se centrara
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const AddExpense(),
            )
          );
        },
        shape: CircleBorder(), // Esto hace que el boton sea redondeado,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            // Añado decoración
            shape: BoxShape.circle, // Para que el gradiente sea circular
            gradient: LinearGradient(
              // La decoración sera un gradiente linear
              colors: [
                // Los gradientes a utilizar serán estes
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: GradientRotation(1), // Rotacion del gradiante
            ),
          ),
          child: Icon(CupertinoIcons.add), // Esto añadirá un icono de una cruz
        ),
      ),
      body: index == 0 ? MainScreen() : StatScreen(),
    );
  }
}
