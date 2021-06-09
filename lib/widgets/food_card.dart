import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FoodCard extends StatelessWidget {
  String identify;
  String title;
  String description;
  String price;
  String image;
  bool notShowIconCart;

  FoodCard(
      {this.identify, this.title, this.description, this.price, this.image, this.notShowIconCart});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.5,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[100]),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                _buildImageFood(),
                _buildInfoFood(),
                _buildButtonCart(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageFood() {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.only(right: 8),
      child: ClipOval(
        //child: Image.asset('assets/images/IconeFlutterFood.png'),
        child: CachedNetworkImage(
          imageUrl: image != ''
              ? image
              : 'https://blog.praticabr.com/wp-content/uploads/2020/01/314771-8-passos-essenciais-para-montar-um-cardapio-de-pizzaria.jpg',
          placeholder: (context, url) => Container(
            height: 80,
            width: 80,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoFood() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Container(height: 5),
          Text(description,
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontWeight: FontWeight.normal)),
          Container(height: 7),
          Text("R\$ $price",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget _buildButtonCart(context) {
    return notShowIconCart ? Container() : Container(
      child: IconTheme(
        data: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
