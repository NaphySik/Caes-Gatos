import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State createState() => _HomepageState();
}

class _HomepageState extends State {

  String resposta = '';

  final dio = Dio();

  Map? endereco;

  Future<dynamic> getHttp() async {
      final response = await dio.get('https://dog.ceo/api/breeds/image/random');
      return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cães e Gatos aleatórios'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text('Clique no botão para sortear um cachorro:'),
              SizedBox(height: 32,),
              Image.network('${endereco?['message'] ?? 'https://images.dog.ceo/breeds/germanshepherd/n02106662_8870.jpg'}'),
              SizedBox(height: 32,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {

                    Map? end = await getHttp();
                    setState(() {
                      endereco = end;
                    });
                  },

                  child: Text('Sortear')),

              SizedBox(height: 32,)

            ],
          ),
        ),
      ),
    );
  }
}