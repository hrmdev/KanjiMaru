import 'package:KanjiMaru/providers/characterProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingCharactersPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<Map> characterMap = watch(characters);

    return Scaffold(
      body: Container(
        child: characterMap.when(
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
            data: (data) {
              print(watch(dictionary)?.length);
              print(watch(dictionary)?.keys);
              SchedulerBinding.instance!.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, 'landing');
              });
              return Container();
            }),
      ),
    );
  }
}