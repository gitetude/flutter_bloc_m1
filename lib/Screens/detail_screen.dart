import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_flutter_master1/models/textPrixDist_model.dart';

class DetailScreen extends StatelessWidget{
  const DetailScreen({Key? key,required this.e}) : super(key: key);
  final TextPrixDistModel e;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
             Text(
               e.type + " " + e.description,
             ),
             Text(
               e.date! + " " + e.dateFin!,
             ),
            ],
          ),
        ),
      ),
    );


  }

}