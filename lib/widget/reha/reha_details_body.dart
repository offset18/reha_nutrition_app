import 'package:reha_nutrition_app/bloc/reha_details_event.dart';
import 'package:reha_nutrition_app/bloc/reha_details_state.dart';
import 'package:reha_nutrition_app/data/constants/pathconst.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:reha_nutrition_app/bloc/reha_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RehaDetailsBody extends StatelessWidget {
  final RehaData reha;
  RehaDetailsBody({required this.reha});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          _createImage(),
          _createBackButton(context),
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<RehaDetailsBloc>(context);
    return Positioned(
      child: SafeArea(
        child: BlocBuilder<RehaDetailsBloc, RehaDetailsState>(
          builder: (context, state) {
            return GestureDetector(
              child: Container(
                width: 30,
                height: 30,
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              onTap: () {
                bloc.add(BackTappedEvent());
              },
            );
          },
        ),
      ),
      left: 20,
      top: 14,
    );
  }

  Widget _createImage() {
    return Container(
      width: double.infinity,
      child: Image(
        image: AssetImage(reha.image),
        fit: BoxFit.cover,
      ),
    );
  }
}