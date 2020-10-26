import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboardscreen/styles.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController pageController = PageController(initialPage: 0);
  int _currentPage = 0;



  List<Widget> _buildPageIndicator() {
    List<Widget> list= [];
    for(int i = 0; i<_numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.all(8),
      height: 8,
      width: isActive?24:16,
      decoration: BoxDecoration(
        color: isActive?Colors.white:Color(0xFF7B51D3),
        borderRadius: BorderRadius.circular(12),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ],
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text('Skip',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Center(
                              child: Image(
                                image :AssetImage('images/onboarding0.png'),
                                height: 250,
                                width: 300,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text("Connect People\naround the world",
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Center(
                              child: Image(
                                image :AssetImage('images/onboarding1.png'),
                                height: 250,
                                width: 300,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text("Live your life\nsmarter with me",
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Center(
                              child: Image(
                                image :AssetImage('images/onboarding2.png'),
                                height: 250,
                                width: 300,
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text("Connect People\naround the world",
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),

                _currentPage != _numPages-1 ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          pageController.nextPage(duration: Duration(milliseconds: 500),
                              curve: Curves.ease
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 30,)
                          ],
                        ),
                      ),
                    )

                ): Text("")
              ],
            ),
          ),
        ),

      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 50.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: () => print('Get started'),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Color(0xFF5B16D0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : Text(''),

    );
  }
}
