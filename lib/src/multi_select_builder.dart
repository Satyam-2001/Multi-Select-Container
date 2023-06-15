import 'package:flutter/material.dart';
import 'package:multi_select_container/src/multi_select_controller.dart';

/// It creates an instance of the `MultiSelectController` and provides it to
/// the builder function along with the BuildContext. This allows you to use
///  the MultiSelectController to manage the selection state within the builder
/// function and build your UI accordingly.
/// 
class MultiSelectBuilder<T> extends StatefulWidget {
  const MultiSelectBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(
      BuildContext context, MultiSelectController<T> controller) builder;

  @override
  State<MultiSelectBuilder<T>> createState() => _MultiSelectBuilderState<T>();
}

class _MultiSelectBuilderState<T> extends State<MultiSelectBuilder<T>> {
  ///
  /// The `controller` object in the `MultiSelectController` of Flutter plays a
  /// central role in managing and controlling the multi-select functionality.
  ///
  /// It serves as a bridge between the user interface and the underlying data,
  /// providing methods and properties to interact with the selection state.
  ///
  /// The controller object allows developers to access and manipulate the
  /// selection state of the MultiSelectController. It provides methods such as
  /// `toggleTag` to toggle the selection of individual items and `selectedTags`
  /// to retrieve the currently selected items. By using these methods, developers
  /// can easily update and query the selection state based on user interactions.
  ///
  late MultiSelectController<T> controller;
  late List<T> selectedTags;

  void onChnage() {
    setState(() {
      selectedTags = controller.selectedTags;
    });
  }

  @override
  void initState() {
    controller = MultiSelectController<T>();
    selectedTags = controller.selectedTags;
    controller.addListener(onChnage);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(onChnage);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      controller,
    );
  }
}
