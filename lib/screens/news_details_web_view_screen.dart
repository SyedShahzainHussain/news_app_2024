import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:news_app_updates_2024/utils/extension/general_extension.dart';
import 'package:news_app_updates_2024/utils/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsWebViewScreen extends StatefulWidget {
  const NewsDetailsWebViewScreen({super.key});

  @override
  State<NewsDetailsWebViewScreen> createState() =>
      _NewsDetailsWebViewScreenState();
}

class _NewsDetailsWebViewScreenState extends State<NewsDetailsWebViewScreen> {
  late WebViewController controller;
  var loadingPercentage = 0.0;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress / 100;
          });
        },
      ))
      ..loadRequest(Uri.parse(
          "https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/"));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          if (await controller.canGoBack()) {
            controller.goBack();
          } else {
            if (context.mounted) {
              Navigator.pop(context);
            }
          }
        }
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(IconlyLight.arrow_left_2)),
            iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text("URL",
                style: GoogleFonts.lobster(
                    textStyle: Theme.of(context).textTheme.headlineMedium)),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialogFc(context);
                  },
                  icon: const Icon(Icons.more_vert))
            ],
          ),
          body: Column(
            children: [
              LinearProgressIndicator(
                color:
                    loadingPercentage == 1.0 ? Colors.transparent : Colors.blue,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                value: loadingPercentage,
              ),
              Expanded(
                child: WebViewWidget(
                  controller: controller,
                ),
              ),
            ],
          )),
    );
  }

  void showDialogFc(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                20.height,
                Center(
                  child: Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                20.height,
                const Text("More option",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    )),
                20.height,
                const Divider(
                  thickness: 2,
                ),
                20.height,
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text("Share"),
                  onTap: () async {
                    try {
                      await Share.share("URL", subject: 'Look what I made!');
                    } catch (error) {
                      if (context.mounted) {
                        Utils.alertDialog(context, error.toString());
                      }
                    }
                  },
                ),
                20.height,
                ListTile(
                  leading: const Icon(Icons.open_in_browser),
                  title: const Text("Open in browser"),
                  onTap: () async {
                    try {
                      await launchUrl(Uri.parse(
                          "https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/"));
                    } on PlatformException catch (error) {
                      if (context.mounted) {
                        if (context.mounted) {
                          Utils.alertDialog(context, error.toString());
                        }
                      }
                    }
                  },
                ),
                20.height,
                ListTile(
                  leading: const Icon(Icons.refresh),
                  title: const Text("Refresh"),
                  onTap: () async {
                    try {
                      await controller.reload();
                    } catch (error) {
                      if (context.mounted) {
                        Utils.alertDialog(context, error.toString());
                      }
                    } finally {
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
              ],
            ),
          );
        });
  }
}
