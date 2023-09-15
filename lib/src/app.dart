import 'package:flutter/material.dart';
import 'package:mume/src/ui/onboarding_screen.dart';
import 'package:mume/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode
          ? ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.black,
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(
                    titleSmall: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 11),
                  )
                  .apply(
                      bodyColor: Colors.white,
                      displayColor: Colors.grey,
                      fontFamily: 'Poppins'),
              switchTheme: SwitchThemeData(
                thumbColor: MaterialStateProperty.all(Colors.orange),
              ),
              listTileTheme: const ListTileThemeData(iconColor: Colors.orange),
              tabBarTheme: const TabBarTheme(
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.orange, width: 4),
                    ),
                  ),
                  labelStyle: TextStyle(fontFamily: 'Poppins')),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                titleTextStyle: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor:
                      themeProvider.isDarkMode ? Colors.black : Colors.white,
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey),
            )
          : ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(
                    titleSmall: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 11),
                  )
                  .apply(
                      bodyColor: Colors.black,
                      displayColor: Colors.grey,
                      fontFamily: 'Poppins'),
              switchTheme: SwitchThemeData(
                thumbColor: MaterialStateProperty.all(Colors.purple),
              ),
              listTileTheme: const ListTileThemeData(iconColor: Colors.purple),
              tabBarTheme: const TabBarTheme(
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.orange, width: 4),
                    ),
                  ),
                  labelStyle: TextStyle(fontFamily: 'Poppins')),
              appBarTheme: AppBarTheme(
                scrolledUnderElevation: 0,
                backgroundColor: Colors.white,
                titleTextStyle: const TextStyle(
                    color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                iconTheme: IconThemeData(
                    color:
                        themeProvider.isDarkMode ? Colors.white : Colors.black),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey),
            ),
      home: Scaffold(
        body: OnboardingScreen(),
      ),
    );
  }
}
