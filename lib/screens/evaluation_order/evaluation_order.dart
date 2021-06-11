import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/flutter_bottom_navigator.dart';

class EvaluationOrderScreen extends StatelessWidget {
  const EvaluationOrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar Pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreenEvaluationOrder(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildScreenEvaluationOrder(context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [_buildHeader(context), Container(height: 20), _buildDormEvaluation(context)],
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      child: Text(
        'Avaliar o Pedido: 1315dsfsa',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildDormEvaluation(context) {
    return Container(
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: 30,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              print(value);
            },
          ),
          Container(height: 12),
          TextFormField(
            autocorrect: true,
            style: TextStyle(color: Theme.of(context).primaryColor),
            cursorColor: Theme.of(context).primaryColor,
            onSaved: (value) {
              print(value);
            },
            decoration: InputDecoration(
                labelText: 'Comentário (ex: Muito Bom!!!)',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ))),
          ),
          Container(height: 10),
          Container(
            //margin: EdgeInsets.only(bottom: 30, top: 10),
            //padding: EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              onPressed: () {
                print('avaliar pedido');
              },
              color: Theme.of(context).primaryColor,
              elevation: 2.2,
              child: Text(
                'Avaliar Pedido',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
            ),
          )
        ],
      ),
    );
  }
}
