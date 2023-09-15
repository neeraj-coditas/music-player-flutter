import 'package:flutter/material.dart';
import 'package:mume/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class SubscriptionDialog extends StatelessWidget {
  const SubscriptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 430,
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Colors.black : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 36,
            ),
            const SizedBox(
              height: 120,
              width: 125,
              child: Image(
                image: AssetImage('assets/premium.png'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              'Congratulations!',
              style: TextStyle(color: Colors.orange, fontSize: 20),
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              'You have successfully subcscribed 1 month premium. Enjoy the benefits',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32))))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
