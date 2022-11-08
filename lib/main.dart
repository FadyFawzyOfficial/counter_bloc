import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'other_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Counter Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.counter == 3) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text('counter is ${state.counter}'),
                ),
              );
            } else if (state.counter == -1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const OtherScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            return Text(
              '${state.counter}',
              style: const TextStyle(fontSize: 100),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterBloc>(context)
                .add(DecrementCounterEvent()),
            heroTag: 'decrement',
            child: const Icon(Icons.remove_rounded),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(IncrementCounterEvent()),
            heroTag: 'increment',
            child: const Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
