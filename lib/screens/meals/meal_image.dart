import 'package:flutter/material.dart';

class MealImage extends StatelessWidget {
  final String title;
  final String imageUrl;
  const MealImage(this.title, this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
