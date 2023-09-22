import 'package:flutter/material.dart';
import 'package:mume/src/models/song.dart';

import 'package:mume/src/ui/premium_screen.dart';
import 'package:mume/src/ui/songs_tab.dart';
import 'package:mume/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';

import 'package:mume/src/ui/suggested_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBottomBarTab = 0;

  int _selectedTab = 0;

  bool darkThemeToggleStatus = false;

  void _onBottomBarItemTapped(int index) {
    setState(() {
      _selectedBottomBarTab = index;
    });
  }

  final List<SongModel> songs = [
    SongModel(
        songName: "Shape of You",
        artistName: "Ed Sheeran",
        artistArt:
            "https://static.independent.co.uk/s3fs-public/thumbnails/image/2014/12/05/18/Ed-Sheeran.jpg",
        albumArt:
            "https://upload.wikimedia.org/wikipedia/en/b/b4/Shape_Of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png",
        duration: "2:55"),
    SongModel(
        songName: "Blinding Lights",
        artistName: "The Weeknd",
        artistArt:
            "https://thefader-res.cloudinary.com/private_images/w_760,c_limit,f_auto,q_auto:best/the-weeknd-name-change-abel-Tesfaye_yyfhyl/the-weeknd-photo-by-brian-ziff.jpg",
        albumArt:
            "https://upload.wikimedia.org/wikipedia/en/e/e6/The_Weeknd_-_Blinding_Lights.png",
        duration: "3:35"),
    SongModel(
        songName: "Uptown Funk",
        artistName: "Bruno Mars",
        artistArt:
            "https://lastfm.freetls.fastly.net/i/u/ar0/7253d5bd01c230ed133e235ead33d64b.jpg",
        albumArt:
            "https://i.scdn.co/image/ab67616d0000b273e419ccba0baa8bd3f3d7abf2",
        duration: "4:12"),
    SongModel(
        songName: "Bohemian Rhapsody",
        artistName: "Queen",
        artistArt:
            "https://www.japantimes.co.jp/uploads/imported_images/uploads/2019/01/p11-stmichel-wideangle-a-20190201.jpg",
        albumArt:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1ZsX7hIWSaqhUA4uDoD3EdwAX22fqSi1oZPfNPVebcxHs1DkNlTjPE3yrh4EKzDBooGI&usqp=CAU",
        duration: "3:29"),
    SongModel(
        songName: "LuCoZaDe",
        artistName: "Zayn",
        artistArt:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZBlmWVft_RAAs2LNl5WLpM1e4RH7Ch-Vq91eLa5LLikxJSHlkUj_eCi3GLs6JO8w1WI&usqp=CAU",
        albumArt:
            "https://m.media-amazon.com/images/I/81aqwOlV+LL._UF1000,1000_QL80_.jpg",
        duration: "2:45")
  ];

  final List<Tab> _tabList = [
    const Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Suggested",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    const Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Songs",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    const Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Artists",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    const Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Album",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    const Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Favourites",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Image.asset('assets/logo.png'),
          ),
          title: _selectedBottomBarTab == 0 ||
                  _selectedBottomBarTab == 1 ||
                  _selectedBottomBarTab == 2
              ? const Text(
                  'Mume',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              : const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  child: _selectedBottomBarTab == 0 ||
                          _selectedBottomBarTab == 1 ||
                          _selectedBottomBarTab == 2
                      ? const Icon(
                          Icons.search,
                          size: 26.0,
                        )
                      : const Icon(Icons.more_vert_outlined),
                )),
          ]),
      body: _selectedBottomBarTab == 0
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(children: [
                  DefaultTabController(
                    initialIndex: _selectedTab,
                    length: 5,
                    child: TabBar(
                      isScrollable: true,
                      onTap: (value) {
                        setState(() {
                          _selectedTab = value;
                        });
                      },
                      tabs: _tabList,
                      labelColor: Colors.orange, //<-- selected text color
                      unselectedLabelColor: Colors.grey,
                    ),
                  ),
                  _selectedTab == 0
                      ? SuggestedScreen(
                          songs: songs,
                        )
                      : _selectedTab == 1
                          ? SongsTab(songs: songs)
                          : Container(),
                ]),
              ),
            )
          : _selectedBottomBarTab == 3
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(40, 50)),
                              color: Colors.orange),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                const Text(
                                  'Enjoy All Benefits!',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  'Enjoy listening songs with better audio quality, without restrictions, and without adds',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 16),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return const PremiumScreen();
                                      }),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      child: Text(
                                        'Get Premium',
                                        style: TextStyle(
                                            color: Colors.orange, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Divider(
                          color: Colors.grey[400],
                          height: 2,
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.cloud_upload_sharp,
                                  ),
                                ),
                                Text('Backup')
                              ],
                            ),
                            Icon(
                              Icons.navigate_next_outlined,
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.notifications_active,
                                  ),
                                ),
                                Text('Notifications')
                              ],
                            ),
                            Icon(
                              Icons.navigate_next_outlined,
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.abc_outlined,
                                  ),
                                ),
                                Text('Language')
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text('English (US)'),
                                ),
                                Icon(
                                  Icons.navigate_next_outlined,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                                Text('Dark Mode')
                              ],
                            ),
                            Switch.adaptive(
                              inactiveThumbColor: Colors.grey,
                              activeTrackColor: Colors.orange,
                              activeColor: Colors.white,
                              value: darkThemeToggleStatus,
                              onChanged: (value) {
                                setState(() {
                                  darkThemeToggleStatus =
                                      !darkThemeToggleStatus;
                                  themeProvider.toggleTheme();
                                });
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.share,
                                  ),
                                ),
                                Text('Share App')
                              ],
                            ),
                            Icon(
                              Icons.navigate_next_outlined,
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.menu_book,
                                  ),
                                ),
                                Text('Changelog')
                              ],
                            ),
                            Icon(
                              Icons.navigate_next_outlined,
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.verified_user_sharp,
                                  ),
                                ),
                                Text('Privacy Policy')
                              ],
                            ),
                            Icon(
                              Icons.navigate_next_outlined,
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.info_outline,
                                  ),
                                ),
                                Text('FAQ')
                              ],
                            ),
                            Icon(
                              Icons.navigate_next_outlined,
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(
                                    Icons.exit_to_app,
                                  ),
                                ),
                                Text('Quit')
                              ],
                            ),
                            Icon(
                              Icons.navigate_next_outlined,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.favorite_border,
                color: Colors.orange,
              ),
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_rounded,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.list_alt_rounded,
                color: Colors.orange,
              ),
              label: 'Playlists'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.settings_outlined,
                color: Colors.orange,
              ),
              label: 'Settings')
        ],
        currentIndex: _selectedBottomBarTab,
        onTap: (value) {
          _onBottomBarItemTapped(value);
        },
      ),
    );
  }
}
