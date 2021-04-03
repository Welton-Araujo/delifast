import 'package:flutter/material.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import './widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';

class FoodsScreen extends StatefulWidget {
  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  List<Category> _categories = [
    Category(name: 'Salgados', description: 'ssdd', identify: 'qqww'),
    Category(name: 'Refri', description: 'ssdd', identify: 'qqww'),
    Category(name: 'Doces', description: 'ssdd', identify: 'qqww'),
    Category(name: 'Pizza', description: 'ssdd', identify: 'qqww'),
  ];
  List<Food> _foods = [
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
        identify: 'asds3',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZTftMh1QqwJEljvbT0W7cZ2d9u9DeMMvskg&usqp=CAU',
        description: 'testando',
        price: '16.2',
        title: 'panqueca'),
    Food(
        identify: 'asds4',
        image:
            'https://gourmetjr.com.br/wp-content/uploads/2018/03/JPEG-image-B6230B799E47-1_1170x600_acf_cropped_490x292_acf_cropped.jpeg',
        description: 'testando',
        price: '16.2',
        title: 'Prato Feito'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comidas'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreen(),
      bottomNavigationBar: FlutterFoodBottomNavigator(0),
    );
  }

  Widget _buildScreen() {
    return Column(
      children: [Categories(_categories), _buildFoods()],
    );
  }

  Widget _buildFoods() {
    return Container(
      height: (MediaQuery.of(context).size.height - 190),
      width: MediaQuery.of(context).size.width,
      //color: Colors.black,
      child: ListView.builder(
        itemCount: _foods.length,
        itemBuilder: (context, index) {
          final Food food = _foods[index];
          return FoodCard(
            identify: food.identify,
            description: food.description,
            image: food.image,
            price: food.price,
            title: food.title,
          );
        },
      ),
    );
  }
}
