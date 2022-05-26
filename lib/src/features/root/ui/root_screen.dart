import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/app_colors.dart';
import 'package:moviedb/src/constants/text/movie_text.dart';
import 'package:moviedb/src/constants/text/profile_text.dart';
import 'package:moviedb/src/constants/text/tv_show_text.dart';
import 'package:moviedb/src/features/movie/ui/movie_screen.dart';
import 'package:moviedb/src/features/tv_show/ui/tv_show_screen.dart';

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
          TVShowScreen(),
          MovieScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onIndexTap,
        currentIndex: _page,
        selectedItemColor: AppColors.kLightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: MovieText.movie,
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: TVShowText.tvShow,
            icon: Icon(Icons.tv),
          ),
          BottomNavigationBarItem(
            label: ProfileText.profile,
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
