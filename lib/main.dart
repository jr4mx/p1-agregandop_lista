import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navengando secciones',
    home: pagina1(),
  ));
}

class Persona {
  String nombre;
  String apellido;
  String cuenta;
  Persona(this.nombre, this.apellido, this.cuenta);
}

List<Persona> _personas = [
  Persona('Juan', 'Pérez', '99999'),
  Persona('Rodrigo', 'chávez', '77777'),
  Persona('Pepe', 'Ramírez', '55555'),
];

class pagina1 extends StatefulWidget {
  @override
  State<pagina1> createState() => _pagina1State();
}

class _pagina1State extends State<pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 110, 201, 118),
        title: Text(
          'Programadores',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(92, 184, 100, 1),
        hoverColor: Color.fromARGB(126, 0, 0, 0),
        child: Icon(Icons.people_alt_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pagina2()),
          );
        },
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title:
                Text(_personas[index].nombre + ' ' + _personas[index].apellido,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    )),
            subtitle: Text(_personas[index].cuenta),
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 89, 158, 95),
              child: Text(_personas[index].nombre.substring(0, 1)),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(92, 184, 100, 1),
            ),
          );
        },
      ),
    );
  }
}

class pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 19, 207, 144),
        title: Text("Agregar Programador"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 213, 216, 36),
        child: Icon(Icons.people_alt_outlined),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => pagina1()),
          );
        },
      ),
      body: MyCustomForm(),
    );
  }
}

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreCon = TextEditingController();
  final TextEditingController _apellidoCon = TextEditingController();
  final TextEditingController _cuentaCon = TextEditingController();
  String tnombre = '';
  String tapellido = '';
  String tcuenta = '';

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nombreCon,
            decoration: InputDecoration(
              labelText: 'Nombre',
              filled: true,
            ),
          ),
          TextFormField(
            controller: _apellidoCon,
            decoration: InputDecoration(
              labelText: 'Apellido',
              filled: true,
            ),
          ),
          TextFormField(
            controller: _cuentaCon,
            decoration: InputDecoration(
              labelText: 'Número de Cuenta',
              filled: true,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 150.0),
            child: MaterialButton(
              color: Color.fromARGB(255, 28, 116, 199),
              onPressed: () {
                tnombre = _nombreCon.text;
                tapellido = _apellidoCon.text;
                tcuenta = _cuentaCon.text;
                _personas.add(Persona(tnombre, tapellido, tcuenta));

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pagina1()),
                );
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
              },
              child: Text('Guardar'),
            ),
          ),
        ],
      ),
    );
  }
}
