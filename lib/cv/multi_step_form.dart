import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watheq/cv/projects_screen.dart';
import 'package:watheq/cv/qualifications_screen.dart';

import 'awards_screen.dart';
import 'basic_information.dart';
import 'experience_screen.dart';

class MultiStepForm extends StatefulWidget {
  final isEdit = false;
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          BasicInformationScreen(formKey: _formKeys[0],onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease), isEdit: null,),
          AwardsScreen(formKey: _formKeys[1],onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease), isEdit: null),
          QualificationsScreen(formKey: _formKeys[2],onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease), isEdit: null,),
          ProjectsScreen(formKey: _formKeys[3],onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease), isEdit: null),
          ExperiencesScreen(formKey: _formKeys[4],onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease), isEdit: null),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Basic Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Awards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Qualifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Experience',
          ),
        ],
      ),
    );
  }
}
