import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  static const String routeName = "SearchBar";

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GFSearchBar(
          searchList: list,
          searchQueryBuilder: (query, list) {
            return list
                .where(
                    (item) => item.toLowerCase().contains(query.toLowerCase()))
                .toList();
          },
          overlaySearchListItemBuilder: (item) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                item,
                style: const TextStyle(fontSize: 18),
              ),
            );
          },
          onItemSelected: (item) {
            setState(() {
              print('$item');
            });
          },
        ),
      ),
    );
  }
}
