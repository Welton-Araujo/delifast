import './widgets/RestaurantCard.dart';

import '../../models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantsPage extends StatefulWidget {
  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  List<Restaurant> _restaurants = [
    new Restaurant(
        name: 'Especializati',
        image: '',
        contact: 'contato@especializati.com.br',
        uuid: '16513135135'),
    new Restaurant(
        name: 'fisica',
        image: '',
        contact: 'contato@especializati.com.br',
        uuid: '16513135135'),
    new Restaurant(
        name: 'cachorro',
        image: '',
        contact: 'contato@especializati.com.br',
        uuid: '16513135135'),
    new Restaurant(
        name: 'apart',
        image: '',
        contact: 'contato@especializati.com.br',
        uuid: '16513135135'),
    new Restaurant(
        name: 'casa',
        image: '',
        contact: 'contato@especializati.com.br',
        uuid: '1651313'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildRestaurants(context),
    );
  }

  Widget _buildRestaurants(context) {
    return Container(
      child: ListView.builder(
        itemCount: _restaurants.length,
        itemBuilder: (context, index) {
          final Restaurant restaurant = _restaurants[index];
          return RestaurantCard(
            uuid: restaurant.uuid,
            name: restaurant.name,
            image: restaurant.image,
            contact: restaurant.contact,
          );
        },
      ),
    );
  }
}
