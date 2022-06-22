import 'dart:convert';

import 'package:dio/dio.dart';
//import 'package:fl_crud/models/model.dart';
import 'package:http/http.dart' as http;

import '../models/model.dart';

class Service {
  //Fetch or read data function
  Future<List<Model>> fetchdata() async {
    final response = await http.get(Uri.parse(
        'https://crudcrud.com/api/e3231930c4d84258ae5008cc44b9dd44/unicorns'));
    List res1 = json.decode(response.body);
    print('res1=' + res1.toString());
    //Model.fromJson(json.decode(response.body));
    List<Model> res2 = res1.map((e) => Model.fromJson(e)).toList();
    print('res2=' + res2.toString());
    if (response.statusCode == 200) {
      print('resopnse.body=' + response.body);
      print('resopnse.length=' + response.body.length.toString());
      return res2;
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Failed to load data');
    }
  }

//Add new data function
  Future<List<Model>> adddata(dynamic name) async {
    final http.Response response = await http.post(
        Uri.parse(
            'https://crudcrud.com/api/e3231930c4d84258ae5008cc44b9dd44/unicorns'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
        }));
    List res1 = json.decode(response.body);
    print('res1=' + res1.toString());
    //Model.fromJson(json.decode(response.body));
    List<Model> res2 = res1.map((e) => Model.fromJson(e)).toList();
    print('res2=' + res2.toString());
    if (response.statusCode == 201) {
      print('resopnse.body=' + response.body);
      print('resopnse.length=' + response.body.length.toString());
      return res2;
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Failed to add data');
    }
  }

//Delete Function
  Future<List<Model>> deletedata(dynamic id) async {
    print('id in service=' + id);
    final http.Response response = await http.delete(
      Uri.parse(
          'https://crudcrud.com/api/e3231930c4d84258ae5008cc44b9dd44/unicorns/$id'),
    );
    List res1 = json.decode(response.body);
    print('res1=' + res1.toString());
    //Model.fromJson(json.decode(response.body));
    List<Model> res2 = res1.map((e) => Model.fromJson(e)).toList();
    print('res2=' + res2.toString());
    if (response.statusCode == 201) {
      print('resopnse.body=' + response.body);
      print('resopnse.length=' + response.body.length.toString());
      return res2;
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Failed to delete data');
    }
  }

  //Modify or Update Function
  Future<List<Model>> modifydata(dynamic id, dynamic name) async {
    print('id in service=' + id);
    final http.Response response = await http.put(
        Uri.parse(
            'https://crudcrud.com/api/e3231930c4d84258ae5008cc44b9dd44/unicorns/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
        }));
    List res1 = json.decode(response.body);
    print('res1=' + res1.toString());
    //Model.fromJson(json.decode(response.body));
    List<Model> res2 = res1.map((e) => Model.fromJson(e)).toList();
    print('res2=' + res2.toString());
    if (response.statusCode == 201) {
      print('resopnse.body=' + response.body);
      print('resopnse.length=' + response.body.length.toString());
      return res2;
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Failed to delete data');
    }
  }
}
