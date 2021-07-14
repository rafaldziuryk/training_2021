import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_training/features/pokemons/model/pokemon.dart';
import 'package:flutter_training/features/rest/rest.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PokemonsPageWithPaginationAndDio extends StatefulWidget {
  @override
  _PokemonsPageWithPaginationAndDioState createState() =>
      _PokemonsPageWithPaginationAndDioState();
}

class _PokemonsPageWithPaginationAndDioState
    extends State<PokemonsPageWithPaginationAndDio> {
  
  Rest rest = Rest();

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
      final pokemonResponse = await rest.getPokemons(pageKey); 
      if (pokemonResponse.isLast) {
        _pagingController.appendLastPage(pokemonResponse.pokemons);
      } else {
        final int nextPageKey = pageKey + pokemonResponse.pokemons.length;
        _pagingController.appendPage(pokemonResponse.pokemons, nextPageKey);
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
