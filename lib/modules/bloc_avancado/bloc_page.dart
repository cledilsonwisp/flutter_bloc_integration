import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc_bloc.dart';
import 'block_state.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key key}) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  final editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
                    Modular.get<BlockBlock>().add(editingController.text);
                    // bloc.add(editingController.text);
                  },
                  child: Text("Buscar")),
              BlocBuilder<BlockBlock, SearchCepState2>(
                 bloc: Modular.get<BlockBlock>(),
                builder: (context, state) {
                  if (state is SearchCepError2) {
                    return Text('Deu erro');
                  }

                  if (state is SearchCepLoading2) {
                    return Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  }

                  var stete = state as SearchCepSucess2;
                  if (stete.data.isEmpty) {
                    return Container();
                  }
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
