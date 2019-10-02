import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/repos.dart';
import '../providers/listRepoProviders.dart';

class ListRepos extends StatelessWidget {
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
              return(
                  Text(
                    listRepos[index].name,
                    style: Theme.of(context).textTheme.title,
                  )
              );
            },
            child: ListTile(
              trailing:
              Icon(Icons.details, color: Colors.black, size: 20.0),
              title: Text(
                listRepos[index].name,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                listRepos[index].description != null? listRepos[index].description: '',
              ),
            ),
          )
        ),
      ),
    );
  }
}