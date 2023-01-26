import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimalSection extends StatelessWidget {
  const AnimalSection({Key? key, required this.image, required this.text})
      : super(key: key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/dogs");
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 90,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
