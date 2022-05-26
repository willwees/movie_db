import 'package:flutter/material.dart';
import 'package:moviedb/src/features/movie/ui/movie_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final PageController _pageController = PageController();
  int _page = 0;

  void _onIndexTap(int page) {
    _pageController.jumpToPage(page);
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const <Widget>[
          MovieScreen(),
          MovieScreen(),
          MovieScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onIndexTap,
        currentIndex: _page,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Movie',
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: 'TV Show',
            icon: Icon(Icons.tv),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
