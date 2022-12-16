import 'package:flutter_bloc/flutter_bloc.dart';

import '../repos/repositories.dart';
import 'app_events.dart';
import 'app_states.dart';


class TextPrixDistBloc extends Bloc<TextPrixDistEvent,TextPrixDistState>{
final TextPrixDistRepository _textPrixDistRepository;
TextPrixDistBloc(this._textPrixDistRepository) : super(TextPrixDistLoadingState()){
  on<LoadTextPrixDistEvent>((event,emit) async{
   emit(TextPrixDistLoadingState());
   try{
     final textPrixDists = await _textPrixDistRepository.getTextPrixDists();
     emit(TextPrixDistLoadedState(textPrixDists));
   }catch(e){
     emit(TextPrixDistErrorState(e.toString()));
   }
  // print("salut");
  });
}
}