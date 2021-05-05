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
    return ListView(
      shrinkWrap: false,
      children: [
        _buildHeader(),
        _buildCartList(context),
        _buildTextTotalCart(),
        _buildFormComment(context),
        _buttonCheckout(context),
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
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 6,
      itemBuilder: (context, index) => _buildCartItem(context),
    );
  }

  Widget _buildCartItem(context) {
    return Stack(
      children: [
        Container(
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
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(top: 2, right: 4),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: Icon(
              Icons.close,
              size: 20,
              color: Colors.white,
            ),
          ),
        )
      ],
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
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
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
                        Icon(Icons.remove,
                            size: 24, color: Colors.grey.shade700),
                        Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: Theme.of(context).primaryColor,
                          child:
                              Text('2', style: TextStyle(color: Colors.white)),
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

  Widget _buildTextTotalCart(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 26, bottom: 16),
      child: Text("Preço total: R\$ 499,99", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)));
  }

  Widget _buildFormComment(context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        autocorrect: true,
        style: TextStyle(color: Theme.of(context).primaryColor),
        cursorColor: Theme.of(context).primaryColor,
        onSaved: (value) {
          print(value);
        },
        decoration: InputDecoration(
            labelText: 'Comentário (ex: sem cebola)',
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ))),
      ),
    );
  }

  _buttonCheckout(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          print('checkout');
        },
        child: Text('Finalizar Pedido'),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange[600],
          onPrimary: Colors.white,
          shadowColor: Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
          elevation: 4,
          textStyle: TextStyle(
            fontSize: 20,
          )

          //shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
        //color: Colors.transparent,
        //elevation: 0,
      ),
    );
  }
}
