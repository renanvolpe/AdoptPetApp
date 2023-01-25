import 'package:adopt_pet_app/features/animals/components/animal_section.dart';
import 'package:flutter/material.dart';

class HomeAnimalsPage extends StatefulWidget {
  const HomeAnimalsPage({Key? key}) : super(key: key);

  @override
  State<HomeAnimalsPage> createState() => _HomeAnimalsPageState();
}

class _HomeAnimalsPageState extends State<HomeAnimalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("adote um animal"),
        ),
        body: Stack(
          children: [
            Image.asset(
              color: Colors.white.withOpacity(0.75),
              colorBlendMode: BlendMode.modulate,
              height: double.infinity,
              width: double.infinity,
              "assets/images/image_bulma.jpeg",
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Selecione a adoção"),
                const SizedBox(
                  height: 20,
                ),
                const AnimalSection(
                  image: "assets/images/dog_option.png",
                  text: "Adote um cachorro",
                ),
                const SizedBox(
                  height: 20,
                ),
                const AnimalSection(
                  image: "assets/images/cat_option.png",
                  text: "Adote um gato",
                ),
                const SizedBox(
                  height: 20,
                ),
                const AnimalSection(
                  image: "assets/images/dog_cat_option.png",
                  text: "Adote um cachorro ou gato",
                ),
                Row()
              ],
            )
          ],
        ));
  }
}
