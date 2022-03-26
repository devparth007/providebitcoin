import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:providebitcoin/screens/homePage.dart';

class DataSearch extends SearchDelegate<String> {
  DataSearch({
    Key? key,
  });

  final Items = [
    'parth',
    'hardik',
    'jaimin',
    'gunjan',
    'paras',
    'jayeep',
    'rahul',
    'smit',
    'kaushik',
    'satish',
    'vruti',
    'madhvi',
    'axita',
    'pooja',
    'komal',
  ];
  final recentItems = [
    'paras',
    'jayeep',
    'rahul',
    'komal',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.to(() => const HomePage());
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    bool value = false;
    return ListView(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.grey,
            ),
            child: Checkbox(
              onChanged: (value) {},
              value: null,
            ))
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentItems
        : Items.where((e) => e.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: const Icon(Icons.attach_money_outlined),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index],
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
