import 'package:flutter/cupertino.dart';

/// NOTE: If using this to wrap a Scaffold() widget Scaffold backgroundColor to transparent:
/// ex: BackgroundImageWidget(image: ImageProvider(), child: Scaffold(..., backgroundColor: Colors.transparent,...));
class BackgroundImageWidget extends StatelessWidget {
  final Widget child;
  final ImageProvider image;
  const BackgroundImageWidget({
    Key? key,
    required this.child,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      );
}
