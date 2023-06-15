import 'package:flutter/material.dart';
import 'package:multi_select_container/src/multi_select_controller.dart';

///
/// `MultiSelectContainer` widget provides a convenient and customizable way to implement
/// multi-select functionality in a Flutter application. With its ability to visually
/// represent the selection state, handle user interactions, and integrate with the
///  `MultiSelectController`, the MultiSelectContainer simplifies the process of building
///  interactive and intuitive multi-select interfaces.
///
/// ```dart
/// MultiSelectContainer({
///   super.key,
///   required this.tag,
///   required this.controller,
///   this.onTap,
///   this.colorOnSelected,
///   this.elevation = 0.0,
///   this.radius = 0.0,
///   this.widgetOnTop,
///   this.child,
/// });
/// ```
///
/// * `tag`: A unique identifier for the container.
/// * `controller`: An instance of MultiSelectController to control the selection.
/// * `colorOnSelected`: The color to apply when the container is selected.
/// * `onTap`: A callback function to handle the tap event on the container.
/// * `elevation`: The elevation of the container card.
/// * `radius`: The border radius of the container card.
/// * `widgetOnTop`: An optional widget to display on top of the container.
/// * `child`: The child widget to display within the container.
///
///
/// ```dart
///
/// ```
class MultiSelectContainer<T> extends StatefulWidget {
  const MultiSelectContainer({
    super.key,
    required this.tag,
    this.colorOnSelected,
    this.onTap,
    required this.controller,
    this.elevation = 0.0,
    this.radius = 0.0,
    this.widgetOnTop,
    this.child,
  });

  MultiSelectContainer.icon({
    super.key,
    required this.tag,
    this.child,
    this.colorOnSelected,
    this.onTap,
    required this.controller,
    this.elevation = 0.0,
    this.radius = 0.0,
    required final Icon icon,
  }) : widgetOnTop = Center(child: icon);

  final MultiSelectController? controller;
  final T tag;
  final Widget? child;
  final Color? colorOnSelected;
  final void Function()? onTap;
  final double elevation;
  final double radius;
  final Widget? widgetOnTop;

  @override
  State<MultiSelectContainer> createState() => _MultiSelectContainerState();
}

class _MultiSelectContainerState extends State<MultiSelectContainer> {
  late MultiSelectController _controller;
  late bool isSelected;
  late bool isAnySelected;

  @override
  void initState() {
    _controller = widget.controller ?? MultiSelectController();
    isAnySelected = _controller.isAnySelected;
    isSelected = _controller.conatins(widget.tag);
    _controller.addListener(onChange);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(onChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color? foregroundColor;
    if (isSelected) {
      foregroundColor = widget.colorOnSelected ??
          Theme.of(context).colorScheme.primary.withOpacity(0.4);
    }

    return Card(
      elevation: widget.elevation,
      child: InkWell(
        onTap: _handleTapEvent,
        onLongPress: _toggleTag,
        child: Stack(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                color: foregroundColor,
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              child: widget.child,
            ),
            if (isSelected && widget.widgetOnTop != null) widget.widgetOnTop!,
          ],
        ),
      ),
    );
  }

  void onChange() {
    setState(() {
      isAnySelected = _controller.isAnySelected;
      isSelected = _controller.conatins(widget.tag);
    });
  }

  void _handleTapEvent() {
    if (isAnySelected) {
      _toggleTag();
    } else if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _toggleTag() => _controller.toggleTag(widget.tag);
}
