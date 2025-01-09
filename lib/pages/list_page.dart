import 'package:flutter/material.dart';
import 'package:flutter_databas/constants/spacing.dart';
import 'package:flutter_databas/services/database.dart';
import 'package:flutter_databas/widgets/card_widget.dart';
import 'package:flutter_databas/widgets/text_field.widget.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});
  @override
  State<StatefulWidget> createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void clearData() {
    nameController.clear();
    descController.clear();
    imageController.clear();
    countryController.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 22, 183, 198)
        ),
        body: FutureBuilder(
            future: Database().getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data![index];
                    return CardWidget(
                      id: item.id,
                      name: item.name,
                      country: item.country,
                      description: item.description,
                      image: item.image,
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("error"),
                );
              }
            }),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 22, 183, 198),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFieldWidget(controller: nameController, text: "name"),
                      height24,
                      TextFieldWidget(controller: countryController, text: "country"),
                      height24,
                      TextFieldWidget(
                          controller: descController, text: "descreption"),
                      height24,
                      TextFieldWidget(
                          controller: imageController, text: "image"),
                      height24,
                     ElevatedButton(
  onPressed: () async {
    try {
      // Pass the actual text from the controllers (not the controllers themselves)
      await Database().insertNewDest(
        name: nameController.text,            // Correct: passing text, not controller
        description: descController.text,     // Correct: passing text, not controller
        country: countryController.text,      // Correct: passing text, not controller
        image: imageController.text,          // Correct: passing text, not controller
      );
      if (context.mounted) {
        clearData();
        setState(() {});
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 71, 100, 124),
  ),
  child: const Text(
    "insert",
    style: TextStyle(fontSize: 18, color: Colors.white),
  ),
)

                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white,),),);
  }
}
