import 'package:flutter/material.dart';
import 'package:mume/src/ui/subscription_dialog.dart';
import 'package:mume/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Subscribe to Premium',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Enjoy listening songs with better audio quality, without restriction, without ads',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SubscriptionDialog();
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(50, 40)),
                      color: Colors.orange),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(
                          Icons.workspace_premium_outlined,
                          size: 36,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$9.99',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              ' /month',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Divider(
                          color: Colors.white,
                          height: 2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'Listening with better audio quality',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'Listening without restrictions and ads',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'Unlimited skips and shuffles play',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(50, 40)),
                    color: Colors.purple),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Icon(
                        Icons.workspace_premium_outlined,
                        size: 36,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$19.99',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            ' /3 month',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(
                        color: Colors.white,
                        height: 2,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Listening with better audio quality',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Listening without restrictions and ads',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Unlimited skips and shuffles play',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
