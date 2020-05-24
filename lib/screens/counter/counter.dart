import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import './counter.bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        // Примечание: Мы используем виджет BlocProvider из flutter_bloc,
        // чтобы сделать экземпляр CounterBloc доступным для всего поддерева
        // (CounterPage). BlocProvider также автоматически закрывает
        // CounterBloc, поэтому нам не нужно использовать StatefulWidget.
        home: BlocProvider(
          create: (_) => CounterBloc(),
          child: CounterPage(),
        ),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  //  Примечание: мы можем получить доступ к экземпляру CounterBloc,
  //  используя BlocProvider.of<CounterBloc>(context),
  //  потому что мы обернули наш CounterPage в BlocProvider.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      // Примечание: Мы используем виджет BlocBuilder из flutter_bloc,
      // чтобы перестроить наш пользовательский интерфейс
      // в ответ на изменения состояния (изменения в значении счетчика).

      // Примечание: BlocBuilder принимает необязательный параметр bloc,
      // но мы можем указать тип блока и тип состояния так,
      // что BlocBuilder автоматически найдет блок,
      // поэтому нам не нужно в явном виде использовать
      // BlocProvider.of<CounterBloc>(context).
      body: BlocBuilder<CounterBloc, int>(
        builder: (ctx, state) {
          return Center(
            child: Text(
              '$state',
              style: const TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () =>
                  context.bloc<CounterBloc>().add(CounterEvent.increment),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () =>
                  context.bloc<CounterBloc>().add(CounterEvent.decrement),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(Icons.error),
              onPressed: () => context.bloc<CounterBloc>().add(null),
            ),
          ),
        ],
      ),
    );
  }
}
