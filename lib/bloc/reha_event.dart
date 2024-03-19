import 'package:meta/meta.dart';
import 'package:reha_nutrition_app/bloc/reha_bloc.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';

@immutable
abstract class RehasEvent {}

class CardTappedEvent extends RehasEvent {
  final RehaData reha;

  CardTappedEvent({required this.reha});
}