import 'package:flutter/material.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/show_image_cached_network.dart';

class CartScreen extends StatelessWidget {
  const CartScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: Text('Carrinho'), centerTitle: true),
      body: _buildContentCart(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(2),
    );
  }

  Widget _buildContentCart(context) {
    return Column(
      children: [
        _buildHeader(),
        _buildCartList(context),
        //_buildFormComment(),
        //_buttonCheckout(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(16),
      child: Text(
        'Total (3) Itens',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildCartList(context) {
    return Container(
      //color: Colors.amber,
      height: (MediaQuery.of(context).size.height - 175),
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => _buildCartItem(context),
      ),
    );
  }

  Widget _buildCartItem(context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        child: Row(
          children: [
            ShowImageCachedNetwork(
                'https://blog.praticabr.com/wp-content/uploads/2020/01/314771-8-passos-essenciais-para-montar-um-cardapio-de-pizzaria.jpg'),
            _showDetailItemCart(context),
          ],
        ),
      ),
    );
  }

  Widget _showDetailItemCart(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 5, left: 6, right: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pizza Hut',
              maxLines: 2,
              style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
            ),
            Container(height: 6),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("R\$ 399,00", style: TextStyle(color: Colors.green)),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.remove, size: 24, color: Colors.grey.shade700),
                        Container(
                          padding: EdgeInsets.only(top: 4,bottom: 4, left: 12, right: 12),
                          color: Theme.of(context).primaryColor,
                          child: Text('2', style: TextStyle(color: Colors.white)),
                        ),
                        Icon(Icons.add, size: 24, color: Colors.grey.shade700),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
