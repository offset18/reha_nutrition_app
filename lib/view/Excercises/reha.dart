import 'package:reha_nutrition_app/bloc/reha_start.dart';
import 'package:reha_nutrition_app/view/Excercises/reha_details.dart';

import 'package:reha_nutrition_app/bloc/reha_bloc.dart';
import 'package:reha_nutrition_app/widget/reha/reha_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RehasPage extends StatelessWidget {
  const RehasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContext(context));
  }

  BlocProvider<RehasBloc> _buildContext(BuildContext context) {
    return BlocProvider<RehasBloc>(
      create: (context) => RehasBloc(),
      child: BlocConsumer<RehasBloc, RehasState>(
        buildWhen: (_, currState) => currState is RehasInitial,
        builder: (context, state) {
          return RehaContent();
        },
        listenWhen: (_, currState) => currState is CardTappedState,
        listener: (context, state) {
          if (state is CardTappedState) {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (_) => RehaDetailsPage(reha: state.Reha),
              ),
            );
          }
        },
      ),
    );
  }
}