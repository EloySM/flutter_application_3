import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now(); // Esto guarda la fecha actual

  List<String> myCategoryIcons = [
    'bag-shopping-solid',
    'burger-solid',
    'heart-pulse-solid',
    'house-solid',
    'microchip-solid',
    'paw-solid',
    'plane-solid',
    'user-tie-solid',
    'utensils-solid',
  ];

  String iconSelected = '';

  late Color screenPickerColor = Colors.blue;

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yy').format(
      DateTime.now(),
    ); // DataFormat da un formato más entendible a la fecha
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Expenses',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 16,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                readOnly: true,
                controller: categoryController,
                textAlignVertical: TextAlignVertical.center,
                onTap: () {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    FontAwesomeIcons.list,
                    size: 16,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          bool isExpended = false;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title: Text('Create a Category'),
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 16),
                                      TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Name',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      TextFormField(
                                        onTap: () {
                                          setState(() {
                                            isExpended =
                                                !isExpended; // Esto lo que haces es que si antes la variable isExpanded era true, ahora es false y viceversa
                                          });
                                        },
                                        readOnly: true,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          suffixIcon: Icon(
                                            CupertinoIcons.chevron_down,
                                            size: 21,
                                          ),
                                          fillColor: Colors.white,
                                          hintText: 'Icon',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                isExpended
                                                    ? BorderRadius.vertical(
                                                      top: Radius.circular(12),
                                                    )
                                                    : BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      isExpended
                                          ? Container(
                                            width:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width,
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                    bottom: Radius.circular(12),
                                                  ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 4,
                                                      mainAxisSpacing: 5,
                                                      crossAxisSpacing: 5,
                                                    ),
                                                itemCount:
                                                    myCategoryIcons.length,
                                                itemBuilder: (context, int i) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        iconSelected =
                                                            myCategoryIcons[i];
                                                      });
                                                    },
                                                    child: Container(
                                                      // width: 50,
                                                      // height: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 2,
                                                          color:
                                                              iconSelected ==
                                                                      myCategoryIcons[i]
                                                                  ? Colors.green
                                                                  : Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/${myCategoryIcons[i]}.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                          : Container(),
                                      SizedBox(height: 16),
                                      TextFormField(
                                        onTap: () async {
                                          final Color colorBeforeDialog = screenPickerColor;
                                          final bool colorSelected = await ColorPicker(
                                                color: screenPickerColor,
                                                onColorChanged:
                                                  (Color color) => setState(() =>
                                                    screenPickerColor = color,
                                                  ),
                                                width: 40,
                                                height: 40,
                                                borderRadius: 4,
                                              ).showPickerDialog(context);

                                          // al variable !colorSelected indica si no hay cun color seleccionado
                                          if (!colorSelected) { setState(() =>
                                              screenPickerColor = colorBeforeDialog,
                                            );
                                          }
                                        },
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: screenPickerColor,
                                          hintText: 'Color',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.plus,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: dateController,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () async {
                  // El ? -> indica que la variable puede no tener valor, porque si el usuario cancela y no selecciona ninguna fecha entonces seria null, en ese caso no se guardaría
                  DateTime? newDate = await showDatePicker(
                    // showDatePicker abre un calendario flotante, el await indica que espere a que el usuario indique una fecha y despues continua
                    context: context,
                    initialDate: selectDate, // Pasamos la fecha de hoy
                    firstDate:
                        DateTime.now(), // Esto te permite seleccionar la fecha más cercana que sería hoy, no pudiendo elejir fechas anteriores a la de hoy
                    lastDate: DateTime.now().add(
                      Duration(days: 365),
                    ), // Esto indica la fecha más lejana que puede seleccionar de aqui a un año
                  );
                  if (newDate != null) {
                    // Verifica si el usuario ha elegido una fecha
                    setState(() {
                      dateController.text = DateFormat('dd/MM/yy').format(
                        newDate,
                      ); // Se formatea la fecha y la muestra en un cuadro de texto
                      selectDate =
                          newDate; // Se guarda la nueva fecha en selectDate
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    FontAwesomeIcons.solidClock,
                    size: 16,
                    color: Colors.grey,
                  ),
                  hintText: 'Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight, // Altura estandar de la AppBar
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
