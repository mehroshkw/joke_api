import 'package:api_get/joke_api.dart';
import 'package:api_get/joke_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  JokeApi client = JokeApi();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TextEditingController keyword = TextEditingController();

    return Scaffold(
      body: FutureBuilder<Jokemodel?>(
        future: client.getJoke(keyword.text),
        builder: (context, snapshot) {
          var response = snapshot.data;
          return Container(
            height: height / 2,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: keyword,
                    validator: (value) {
                      if (keyword == "") {
                        return "Please Enter a Keyword";
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: "Enter Key",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.blue,
                        ))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      JokeApi().getJoke(keyword.text);
                    },
                    child: const Text("search")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '${response?.setup}',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '${response?.delivery}',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
