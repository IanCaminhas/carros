import 'package:carros_app/domain/carro_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(16),
          child: _listView(),
        ),
      ),
      body: _listView(),
    );
  }

  _listView() {
    final carros = CarroService.getCarros();

    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (ctx, idx) {
          final c = carros[idx];

          return Container(
            height: 250,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 9, // porcentagem de como vai ficar o contaneir
                    child: Image.network(c.urlFoto),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          c.nome,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

/*
 ListTile(
                    leading: Image.network(
                      c.urlFoto,
                      width: 150,
                    ), // foto imagem carro
                    title: Text(
                      c.nome,
                      style: TextStyle(color: Colors.blue, fontSize: 25.0),
                    ),
                    subtitle: Text(
                      "descrição",
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                    ),
                  ),


 */
