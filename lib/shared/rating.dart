import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          initialRating: 4,
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemSize: 25,
          itemPadding: EdgeInsets.symmetric(horizontal: 2),
          itemBuilder: (context, _) =>Icon(
            Icons.star,
            color: Color.fromARGB(255, 255, 191, 0),
          ),
          onRatingUpdate: (index){},
        )
      ],
    );
  }
}
