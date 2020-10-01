import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

class IntroPage extends StatelessWidget {
  final PageViewModel page;

  final bool imageFirst;

  const IntroPage({Key key, @required this.page, @required this.imageFirst})
      : super(key: key);

  Widget _getImage(BuildContext context) => Flexible(
        flex: page.decoration.imageFlex,
        child: Padding(
          padding: page.decoration.imagePadding,
          child: page.image,
        ),
      );

  Widget _getContent(BuildContext context) => Flexible(
        flex: page.decoration.bodyFlex,
        child: SingleChildScrollView(
          child: IntroContent(page: page),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: page.decoration.pageColor,
      decoration: page.decoration.boxDecoration,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imageFirst)
              if (page.image != null) _getImage(context),
            _getContent(context),
            if (!imageFirst)
              if (page.image != null) _getImage(context),
          ],
        ),
      ),
    );
  }
}
