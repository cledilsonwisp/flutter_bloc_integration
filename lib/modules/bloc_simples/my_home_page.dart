import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'my_home_page_bloc.dart';
import 'my_home_page_state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ModularState<MyHomePage, MyHomePageBloc> {
  final editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU'),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: editingController,
                decoration: InputDecoration(
                  hintText: 'Qual o cep?',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Modular.get<MyHomePageBloc>()
                        .searchCep
                        .add(editingController.text);
                    // controller.searchCep.add(editingController.text);
                  },
                  child: Text("Buscar")),
              StreamBuilder<SearchCepState>(
                stream: Modular.get<MyHomePageBloc>().cepResult,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  var state = snapshot.data;

                  if (state is SearchCepError) {
                    return Text('${snapshot.error}');
                  }

                  if (state is SearchCepLoading) {
                    return Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  }

                  var stete = state as SearchCepSucess;

                  return Text(
                      "Cidade : ${stete.data['localidade']}, bairro: ${stete.data['logradouro']}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
