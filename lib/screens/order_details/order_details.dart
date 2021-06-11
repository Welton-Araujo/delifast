import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../models/Evaluation.dart';
import '../../widgets/food_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  Order _order = Order(
    identify: '1fasdfsa1',
    date: '30/02/2021',
    status: 'open',
    table: 'Mesa xY',
    total: (90).toDouble(),
    comment: 'Sem cebola',
    foods: [
      Food(
          identify: 'asds',
          image:
              'https://img.itdg.com.br/tdg/images/blog/uploads/2017/07/shutterstock_413580649-300x200.jpg',
          description: 'testando',
          price: '12.2',
          title: 'macarronada'),
      Food(
          identify: 'asds2',
          image:
              'https://cdn.peoople.app/image/recommendation/1971502/1971502_280620175125_opt_520.jpg',
          description: 'testando',
          price: '14.2',
          title: 'lasanha'),
      Food(
          identify: 'asds2',
          image:
              'https://cdn.peoople.app/image/recommendation/1971502/1971502_280620175125_opt_520.jpg',
          description: 'testando',
          price: '14.2',
          title: 'lasanha'),
    ],
    evaluation: [
     /*  Evaluation(
        comment: 'Pedido muito bom',
        nameUser: 'Carlos',
        stars: 4,
      ),
      Evaluation(
        comment: 'Pedido excelente',
        nameUser: 'Pedro',
        stars: 5,
      ) */
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(child: _buildOrderDetails(context)),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _makeTextOrde('Número', _order.identify),
          _makeTextOrde('Data', _order.date),
          _makeTextOrde('Status', _order.status),
          _makeTextOrde('Total', _order.total.toString()),
          _makeTextOrde('Mesa', _order.table),
          _makeTextOrde('Comentário', _order.comment),
          Container(height: 30),
          Text('Comidas:',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          _buildFoodsOrder(),
          Container(
            height: 30,
          ),
          Text('Avaliações:',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          _buildEvaluationsOrder(context)
        ],
      ),
    );
  }

  Widget _makeTextOrde(String textLabel, String textValue) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Text(
            textLabel + ': ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            textValue,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  _buildFoodsOrder() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _order.foods.length,
        itemBuilder: (context, index) {
          final Food food = _order.foods[index];
          return FoodCard(
            identify: food.identify,
            description: food.description,
            image: food.image,
            price: food.price,
            title: food.title,
            notShowIconCart: true,
          );
        });
  }

  _buildEvaluationsOrder(context) {
    return _order.evaluation.length > 0
        ? Container(
          padding: EdgeInsets.only(left: 10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _order.evaluation.length,
              itemBuilder: (context, index) {
                final Evaluation evaluation = _order.evaluation[index];
                return _buildEvaluationItem(evaluation, context);
              },
            ),
          )
        : Container(
          height: 40,
          margin: EdgeInsets.only(bottom: 30, top: 10),
            child: RaisedButton(onPressed: () {
              Navigator.pushNamed(context, '/evaluation_order');
            },
            color: Colors.orange,
            elevation: 2.2,
            child: Text('Avaliar Pedido'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(color: Colors.orangeAccent)
            ),
          ),
        );
  }

  _buildEvaluationItem(Evaluation evaluation, context) {
    return Card(
      elevation: 2.5,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(color: Colors.grey[100]),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: evaluation.stars,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 22,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: null,
            ),
            Row(
              children: [
                Text(
                  "${evaluation.nameUser} - ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  evaluation.comment,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
