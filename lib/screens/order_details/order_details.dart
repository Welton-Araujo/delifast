import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../models/Evaluation.dart';

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
    ],
    evaluation: [],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildOrderDetails(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        children: [
          _makeTextOrde('Número', _order.identify),
          _makeTextOrde('Data', _order.date),
          _makeTextOrde('Status', _order.status),
          _makeTextOrde('Total', _order.total.toString()),
          _makeTextOrde('Mesa', _order.table),
          _makeTextOrde('Comentário', _order.comment),
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
            textValue + ': ',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
