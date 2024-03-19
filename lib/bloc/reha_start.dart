import 'package:meta/meta.dart';
import 'package:reha_nutrition_app/bloc/reha_bloc.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';


@immutable
abstract class RehasState {}

class RehasInitial extends RehasState {}

class CardTappedState extends RehasState {
  final RehaData Reha;

  CardTappedState({required this.Reha});
}
