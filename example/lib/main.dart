import 'package:flutter/material.dart';
import 'package:multi_select_container/multi_select_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Select Container',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyExamplePage(),
    );
  }
}

class MyExamplePage extends StatefulWidget {
  const MyExamplePage({super.key});

  @override
  State<MyExamplePage> createState() => _MyExamplePageState();
}

class _MyExamplePageState extends State<MyExamplePage> {
  @override
  Widget build(BuildContext context) {
    return MultiSelectBuilder<int>(
      builder: ((context, controller) {
        bool isAnySelected = controller.selectedTags.isNotEmpty;
        int selectedLength = controller.selectedTags.length;

        AppBar appBar = AppBar(
          elevation: 4,
          title: const Text('Gallery'),
        );

        if (isAnySelected) {
          appBar = AppBar(
            elevation: 4,
            leading: IconButton(
              onPressed: () => controller.selectedTags = [],
              icon: const Icon(Icons.close),
            ),
            title: Text('$selectedLength Selected'),
          );
        }

        return Scaffold(
          appBar: appBar,
          body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 4 / 5,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            children: [
              for (int i = 1; i <= 21; i++)
                MultiSelectContainer.icon(
                  tag: i,
                  elevation: 4,
                  icon: const Icon(Icons.check),
                  controller: controller,
                  child:
                      Image.network('https://picsum.photos/400/500?random=$i'),
                ),
            ],
          ),
        );
      }),
    );
  }
}
