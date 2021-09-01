import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter App'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(CounterEvent.remove);
              },
            ),
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text('$state');
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                counterBloc.add(CounterEvent.add);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState);

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.add:
        yield state + 1;
        break;
      case CounterEvent.remove:
        yield state - 1;
        break;
    }
  }
}

enum CounterEvent { add, remove }
