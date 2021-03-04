import 'package:flutter/material.dart';
import 'package:flutter_quantos_widgets/src/widgets/center_loading.dart';
import 'package:flutter_quantos_widgets/src/widgets/no_content.dart';

class SearchingWidget extends StatelessWidget {

  /// Creates a searching widget.
  ///
  /// if [loadedAll] is true returns [noResultsWidget] or else [NoContentWidget]
  /// returns [loadinWidget] or [CenterLoading] otherwise

  final bool loadedAll;
  final Widget? noResultsWidget;
  final Widget? loadingWidget;
  final String? platform;

  const SearchingWidget({Key? key, required this.loadedAll, this.noResultsWidget, this.loadingWidget, this.platform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (loadedAll != null && loadedAll) 
    ? noResultsWidget ?? NoContentWidget(text: 'Nessun risultato trovato.')
    : loadingWidget ?? CenterLoading(platform: platform);
  }
}