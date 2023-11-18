import 'package:example/src/constants/colors.dart';
import 'package:example/src/features/movies/providers/search_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieSearchField extends ConsumerStatefulWidget {
  const MovieSearchField({super.key});

  @override
  ConsumerState<MovieSearchField> createState() => _MovieSearchFieldState();
}

class _MovieSearchFieldState extends ConsumerState<MovieSearchField> {
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => searchQuery = value,
      onSubmitted: (value) => _onSubmit(),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Enter a movie name...',
        hintStyle: const TextStyle(color: Colors.white38),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: _onSubmit,
        ),
      ),
      style: const TextStyle(color: tertiaryColor),
    );
  }

  void _onSubmit() {
    ref.read(searchMoviesProvider.notifier).setQueryFilter(searchQuery);
  }
}
