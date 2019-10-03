import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/repos.dart';

class ListReposProvider with ChangeNotifier {
  List<Repos> _listRepos = [];
  List<Repos> get listRepos => _listRepos;

  String _username = '';
  String get username => _username;

  Future<void> getListRepos(String value) async {
    final String url = 'https://api.github.com/users/$value/repos?client_id=377d2e1610e7c601e6e8&client_secret=04cb973dac25fa3c57189a9c3a96e1465bba0921';
    _username = value;
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      final List<Repos> result = [];
      data.forEach((e) {
        result.add(Repos(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          url: e['html_url'],
          language: e['language']
        ));
      });
      _listRepos = result;
      notifyListeners();
    } catch (error) {
      _listRepos = [];
      notifyListeners();
    }
  }
}
