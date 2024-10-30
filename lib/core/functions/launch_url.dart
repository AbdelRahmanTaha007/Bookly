import 'package:bookly/core/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(context, String linkUrl) async {
  Uri uri = Uri.parse(linkUrl);
  if (await launchUrl(uri)) {
    await launchUrl(uri);
  } else {
    customSnackBar(context,"Can't Launch $linkUrl" );
  }
}

