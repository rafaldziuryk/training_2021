import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_training/features/pokemons/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PokemonsPageWithPagination extends StatefulWidget {
  @override
  _PokemonsPageWithPaginationState createState() =>
      _PokemonsPageWithPaginationState();
}

class _PokemonsPageWithPaginationState
    extends State<PokemonsPageWithPagination> {
  static const _pageSize = 50;

  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var url = Uri.parse(
          'https://pokeapi.co/api/v2/pokemon?limit=$_pageSize&offset=$pageKey');
      var response = await http.get(url);
      final Map<String, dynamic> parsed = json.decode(response.body);
      final List<Pokemon> newItems =
          (parsed['results'] as List).map((e) => Pokemon.fromMap(e)).toList();
      final isLastPage = parsed['next'] == null;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final int nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Pokemon>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Pokemon>(
            itemBuilder: (context, item, index) {
          return ListTile(
            title: Text(item.name),
            leading: Image.network(item.image),
            trailing: Text(item.id),
          );
        }),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
