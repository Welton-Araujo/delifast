import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RestaurantCard extends StatelessWidget {
  final String uuid;
  final String name;
  final String image;
  final String contact;

  const RestaurantCard({this.uuid, this.name, this.image, this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(name);
        Navigator.pushNamed(context, '/foods');
      },
      child: Container(
        padding: EdgeInsets.only(top: 4, right: 1, left: 1),
        child: Card(
          elevation: 2.5,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
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
                  ),
                  VerticalDivider(color: Colors.black54),
                  Expanded(
                      child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
