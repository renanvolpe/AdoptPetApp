import 'package:adopt_pet_app/features/cat/components/cat_image_component.dart';
import 'package:adopt_pet_app/models/cat_model/cat.dart';
import 'package:flutter/material.dart';

class CatShowComponent extends StatelessWidget {
  const CatShowComponent({
    Key? key,
    required this.listCats,
  }) : super(key: key);

  final Cat listCats;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1, color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
                width: 100,
                height: 80,
                color: const Color.fromRGBO(
                    255, 255, 255, 1),
                child: GetImageCat(
                  referenceImage: listCats
                      .reference_image_id,
                )
                //put bloc provider here to close calls after conclude execution
                //  BlocProvider(
                //   create: (context) => CatGetImageBloc(),
                //   child: GetImageStudyCat(
                //     cat: stateCatGet.listCats[index],
                //     functionList: (catImageURL) {
                //       stateCatGet.listCats[index].urlImage =
                //           catImageURL;
                //     },
                //   ),
                // )
                ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  listCats.name,
                  style: const TextStyle(
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context)
                          .size
                          .width *
                      0.5,
                  child: Text(
                    listCats.temperament,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
