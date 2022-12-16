import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class TextPrixDistEvent extends Equatable{
  const TextPrixDistEvent();
}

class LoadTextPrixDistEvent extends TextPrixDistEvent{
  @override
  List<Object> get props => [];
}