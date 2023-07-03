import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.heightBetween,
  });

  final String image, title;
  final CrossAxisAlignment crossAxisAlignment;
  final double? heightBetween;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(
            image,
          ),
        ),
        SizedBox(height: heightBetween),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
