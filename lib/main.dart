import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Listview',
      home: ListDemo(),
      debugShowCheckedModeBanner: false,
      //aplicar o tema
    );
  }
}

//Criando uma classe com estado

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

//Criando o estado

class _ListDemoState extends State<ListDemo> {
  //Mapear os quantos itens tem na lista
  Map<int, bool> countToValue = <int, bool>{};

  @override
  Widget build(BuildContext context) {
    //Criando meu layout
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista com tres linhas'),
      ),
      body: ListTileTheme(
        child: ListView(
          children: [
            for (int count in List.generate(120, (index) => index + 1))
              ListTile(
                title: Text('Usuário número $count'),
                isThreeLine: true,
                subtitle: Text('Exemplo de texto \n Exemplo de texto'),
                leading: Icon(Icons.account_circle),
                selected: countToValue[count] ?? false,
                trailing: Checkbox(
                  value: countToValue[count] ?? false,
                  onChanged: (bool? value) {
                    setState(() {
                      countToValue[count] = value!;
                    });
                  },
                  //cor de ativação
                ),
              ),
          ],
        ),
      ),
      //implementar a cor de seleção
    );
  }
}
