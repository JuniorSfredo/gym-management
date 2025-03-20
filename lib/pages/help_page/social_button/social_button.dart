import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {

  final IconData icon;
  final String socialUrl;

  const SocialButton({
    super.key,
    required this.icon,
    required this.socialUrl,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        launchURL(socialUrl);
      },
      icon: FaIcon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }

    Future<void> launchURL(String url) async {
    Uri uri = Uri.parse(url);
    launchUrl(uri).onError(
      (error, stackTrace) {
        print("Url is not valid!");
        return false;
      }
    );
  }
}
