import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HymnCoverImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const HymnCoverImage({Key key, this.imageUrl, this.size = 55.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(500.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/hymn_default_cover.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        width: size,
        height: size,
        child: imageUrl != null && imageUrl.startsWith("http") ? FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 300),
          fadeOutDuration: Duration(milliseconds: 300),
          image: imageUrl,
          placeholder: kTransparentImage.toString(),
        ) : SizedBox(),
      ),
    );
  }
}
