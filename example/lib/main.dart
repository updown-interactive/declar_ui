import 'package:declar_ui/declar_ui.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

Widget MyApp() => Declar((context) {
  return MaterialApp().home(MyHomePage(title: 'Flutter Demo Home Page'));
});

Widget MyHomePage({required String title}) => Declar((context) {
  
  return Scaffold()
      .appBar(
        AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
      )
      .body(
        Column([
              const Text('Hello this is declar').size(20),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                ),
              ),

              Container()
                  .size(width: 200, height: 200)
                  .backgroundColor(Colors.green)
                  .radius(topLeft: 20),
            ])
            .align(
              main: MainAxisAlignment.center,
              cross: CrossAxisAlignment.center,
            )
            .frame(width: double.infinity)
            .background(Colors.blue),
      );
});

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text("", style: Theme.of(context).textTheme.headlineMedium),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
