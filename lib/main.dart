import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_flutter_master1/repos/repositories.dart';

import 'Screens/detail_screen.dart';
import 'Screens/search_screen.dart';
import 'blocs/app_blocs.dart';
import 'blocs/app_events.dart';
import 'blocs/app_states.dart';
import 'models/textPrixDist_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RepositoryProvider(
      create: (context) => TextPrixDistRepository(),
      child: const Home(),
    ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextPrixDistBloc(
        RepositoryProvider.of<TextPrixDistRepository>(context),
      )..add(LoadTextPrixDistEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Page =>'),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_outlined),
          ),
        ),

        body:  BlocBuilder<TextPrixDistBloc, TextPrixDistState>(

          builder: (context, state) {



            if (state is TextPrixDistLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is TextPrixDistLoadedState) {
              List<TextPrixDistModel> textPrixDistList = state.textPrixDists;
              return ListView.builder(
                  itemCount: textPrixDistList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                         onTap: (){
                           Navigator.of(context).push(
                           MaterialPageRoute(
                             builder: (context) => DetailScreen(
                               e: textPrixDistList[index],
                    ),
                    ),
                    );
                    },

                        child: Card(
                          color: Colors.blue,
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(
                              textPrixDistList[index].type,
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(textPrixDistList[index].description,
                                style: const TextStyle(color: Colors.white)),
                          ),
                        )));
                  });
            }

            if (state is TextPrixDistErrorState) {
              return Center(child: Text("erreur"));
            }
            return Container();
          },
        ),

        bottomNavigationBar: Container(
          height: 56,
          color: Colors.blue,
          child: Row(
            children: <Widget>[

          Expanded(
          child: Container(
            width: 50,
            color: Colors.blue,
                child: Align(
                  alignment: Alignment(0.6, 0.6),child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: <Widget>[

                    Icon(Icons.add, color: Colors.white), Text("Ajouter", style: TextStyle(color: Colors.black))],
                ),
              ),
          ),),
            ],
          ),
        ),


          ),


    );
  }
}
