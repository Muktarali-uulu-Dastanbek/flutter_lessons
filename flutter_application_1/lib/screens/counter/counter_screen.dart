import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    final CounterBloc counterBloc = CounterBloc();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          bloc: counterBloc,
          builder: (context, state) {
            if (state is CounterLoadingState) {
              return CircularProgressIndicator();
            }

            if (state is CounterLoadedState) {
              counter = state.updatedCounter;
              return Text(
                counter.toString(),
                style: TextStyle(fontSize: 40),
              );
            }

            if (state is CounterRemoveState) {
              counter = state.updatedCounter;
              return Text(
                counter.toString(),
                style: TextStyle(fontSize: 40),
              );
            }

            if (state is CounterErrorState) {
              return Text("Произошла ошибка");
            }

            return SizedBox();
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(IncrementEvent(counter: counter));
            },
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(Decrement(counter: counter));
            },
            child: Icon(Icons.remove),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});

//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   int counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     print("build is worked");
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Text(
//           counter.toString(),
//           style: TextStyle(fontSize: 40),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             counter++;
//           });
//         },
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
