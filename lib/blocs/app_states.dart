import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../models/textPrixDist_model.dart';

@immutable
abstract class TextPrixDistState extends Equatable{}

class TextPrixDistLoadingState extends TextPrixDistState{
  @override
  List<Object?> get props => [];
}

class TextPrixDistLoadedState extends TextPrixDistState{
  TextPrixDistLoadedState(this.textPrixDists);
  final List<TextPrixDistModel> textPrixDists;
  @override
  List<Object?> get props => [textPrixDists];
}

class TextPrixDistErrorState extends TextPrixDistState{
  TextPrixDistErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}