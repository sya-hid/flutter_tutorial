import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MySqflite extends StatefulWidget {
  final String? title;
  const MySqflite({Key? key, this.title}) : super(key: key);

  @override
  State<MySqflite> createState() => _MySqfliteState();
}

class _MySqfliteState extends State<MySqflite> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  int? selectedId;
  Future<dynamic> dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: selectedId == null
                ? const Text('New Data')
                : const Text('Update Data'),
            content: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(label: Text('Name')),
                  ),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text('Price')),
                  )
                ],
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Save')),
              FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel')),
            ],
          );
        }).then((value) async {
      if (value == null) return;
      if (value) {
        if (nameController.text != '' && priceController.text != '') {
          if (selectedId != null) {
            await DatabaseHelper.instance.updateFruit(Fruits(
                id: selectedId,
                name: nameController.text,
                price: double.parse(priceController.text)));
          } else {
            await DatabaseHelper.instance.addFruit(Fruits(
                name: nameController.text,
                price: double.parse(priceController.text)));
          }

          setState(() {
            nameController.clear();
            priceController.clear();
            selectedId = null;
          });
        }
      } else {
        setState(() {
          nameController.clear();
          priceController.clear();
          selectedId = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dialog(context);
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
            child: FutureBuilder(
                future: DatabaseHelper.instance.getFruits(),
                builder: (context, AsyncSnapshot<List<Fruits>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Loading ...'),
                    );
                  }
                  return snapshot.data!.isEmpty
                      ? const Center(
                          child: Text('Data Empty'),
                        )
                      : ListView(
                          children: snapshot.data!.map((e) {
                            return Card(
                              color: e.id == selectedId
                                  ? Colors.black38
                                  : Colors.white,
                              child: ListTile(
                                trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        DatabaseHelper.instance
                                            .deleteFruit(e.id!);
                                      });
                                    },
                                    child: const Icon(Icons.delete)),
                                textColor: e.id == selectedId
                                    ? Colors.white
                                    : Colors.black,
                                onTap: () {
                                  setState(() {
                                    selectedId = e.id;
                                    nameController.text = e.name!;
                                    priceController.text = e.price.toString();
                                    dialog(context);
                                  });
                                },
                                title: Text(e.name!),
                                subtitle: Text(e.price!.toString()),
                              ),
                            );
                          }).toList(),
                        );
                })));
  }
}

class Fruits {
  final int? id;
  final String? name;
  final double? price;

  Fruits({this.id, this.name, this.price});
  factory Fruits.fromMap(Map<String, dynamic> json) => Fruits(
        id: json['id'],
        name: json['name'],
        price: json['price'],
      );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE fruits (id INTEGER PRIMARY KEY , name TEXT, price DOUBLE)');
  }

  Future<List<Fruits>> getFruits() async {
    Database db = await instance.database;
    var fruits = await db.query('fruits', orderBy: 'name');
    List<Fruits> fruitList = fruits.isNotEmpty
        ? fruits.map((data) => Fruits.fromMap(data)).toList()
        : [];
    return fruitList;
  }

  Future<int> addFruit(Fruits fruits) async {
    Database db = await instance.database;
    return await db.insert('fruits', fruits.toMap());
  }

  Future<int> updateFruit(Fruits fruits) async {
    Database db = await instance.database;
    return await db.update('fruits', fruits.toMap(),
        where: 'id=?', whereArgs: [fruits.id]);
  }

  Future<int> deleteFruit(int id) async {
    Database db = await instance.database;
    return await db.delete('fruits', where: 'id=?', whereArgs: [id]);
  }
}
