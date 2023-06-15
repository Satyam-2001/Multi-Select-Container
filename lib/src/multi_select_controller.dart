import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///  `MultiSelectController` provides a powerful and convenient way to implement and manage
/// multi-select functionality in a Flutter application. It simplifies the handling of selected
/// items, offers flexibility in working with different data types, and can be customized to
/// suit specific requirements.
///
/// Example: ```MultiSelectController<String>();```
///
/// To use [String] as the type for selectedTags.
class MultiSelectController<T> extends ValueNotifier<MultiSelectValue<T>> {
  MultiSelectController() : super(MultiSelectValue<T>());

  List<T> get selectedTags => value.selectedTags;
  bool get isAnySelected => value.selectedTags.isNotEmpty;

  set selectedTags(List<T>? tagsList) {
    value = MultiSelectValue<T>(selectedTags: tagsList ?? []);
  }

  bool conatins(T tag) {
    return value.selectedTags.contains(tag);
  }

  void toggleTag(T tag) {
    if (conatins(tag)) {
      _removeTag(tag);
    } else {
      _addTag(tag);
    }
  }

  void _addTag(T tag) {
    value = MultiSelectValue<T>(
      selectedTags: [...value.selectedTags, tag],
    );
  }

  void _removeTag(T tag) {
    List<T> newTagsList = [...value.selectedTags];
    newTagsList.remove(tag);
    value = MultiSelectValue<T>(
      selectedTags: newTagsList,
    );
  }
}

@immutable
class MultiSelectValue<T> {
  const MultiSelectValue({
    this.selectedTags = const [],
  });

  ///
  ///  The `selectedTags` list is a crucial component of the MultiSelectController,
  ///  It represents the collection of items that are currently selected or marked
  ///  as chosen by the user.
  ///
  final List<T> selectedTags;
}
