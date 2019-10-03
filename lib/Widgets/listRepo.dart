import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:link/link.dart';
import '../Models/repos.dart';
import '../providers/listRepoProviders.dart';

class ListRepos extends StatefulWidget {
  @override
  _ListRepoState createState() => _ListRepoState();
}

class _ListRepoState extends State<ListRepos> {
  bool isDetailsShow = false;

  void _showDetails() {
    setState(() {
      isDetailsShow = !isDetailsShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Repos> listRepos =
        Provider.of<ListReposProvider>(context).listRepos;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: listRepos.length,
        itemBuilder: (context, index) => Card(
          child: InkWell(
            onTap: () {
              _showDetails();
            },
            child: ListTile(
              title: Text(
                listRepos[index].name,
                style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
              ),
              subtitle: Column(
                children: <Widget>[
                  Text(listRepos[index].description != null? listRepos[index].description: '', textAlign: TextAlign.center),
                  Text(
                      listRepos[index].language != null? listRepos[index].language: '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  isDetailsShow ? Link(
                    child: Text(listRepos[index].url != null? listRepos[index].url: '', textAlign: TextAlign.center),
                        url: listRepos[index].url != null? listRepos[index].url: '',
                  ) : Text('')
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}