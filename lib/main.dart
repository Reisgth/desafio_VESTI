import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const titulo = Text(
  'CASA',
  style: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: 'Zen Antique Soft',
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                  accountName: Text("Gustavo Reis"),
                  accountEmail: Text("reisgth@gmail.com"))
            ],
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.grey[200],
            toolbarHeight: 80,
            centerTitle: true,
            title: titulo,
            actions: const <Widget>[
              Align(
                child: Text(
                  'Cart(0)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              )
            ]),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 80.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: const Text(
                        'New Arivels',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: const Text(
                        'Shirts',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: const Text(
                        'Sneakers',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: const Text(
                        'Hot Sails',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 499.300,
                child: GetLista(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GetLista extends StatefulWidget {
  @override
  _GetListaState createState() => _GetListaState();
}

class _GetListaState extends State<GetLista> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          final todo = controller.todos[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'aa',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                'aaaaaaaaaa',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          );
        });
  }
}

class TodoRepository {
  final dio = Dio();

  Future<List<Cadastro>> fetch() async {
    final response = await dio.get('https://testvesti.herokuapp.com/catalog');
    final list = response.data as List;

    List<Cadastro> todos = [];
    for (var json in list) {
      final todo = Cadastro.fromJson(json);
      todos.add(todo);
    }
    return todos;
  }
}

class Cadastro {
  String id = "a";
  String name = "a";
  int price = 1;
  int pricePromo = 1;
  String photo = "a";

  Cadastro(
      {required this.id,
      required this.name,
      required this.price,
      required this.pricePromo,
      required this.photo});

  Cadastro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    pricePromo = json['price_promo'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['price_promo'] = pricePromo;
    data['photo'] = photo;
    return data;
  }
}

class HomeController {
  List<Cadastro> todos = [];

  final repositorio = TodoRepository();

  Future start() async {
    todos = await repositorio.fetch();
  }
}
