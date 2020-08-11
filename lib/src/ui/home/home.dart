import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_covid19/src/ui/common/widget.dart';
import 'package:flutter_covid19/src/ui/home/covid_in_viet_nam.dart';
import 'package:flutter_covid19/src/ui/home/covid_in_world.dart';
import 'package:flutter_covid19/src/ui/home/list_case_country.dart';
import 'package:flutter_covid19/src/ui/widgets/page_indicator.dart';
import 'package:flutter_covid19/utils/utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController(initialPage: 0);
  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Utils.getColorFromHex("#f7f7f7"),
      body: Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Container(
                      color: Colors.grey,
                      child: PageView(
                        controller: _controller,
                        children: <Widget>[
                          Image.asset(
                            'ic_banner_01.png',
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            'ic_banner_02.png',
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            color: Utils.getColorFromHex("#f6f6f6"),
                            child: Image.asset(
                              'ic_contact.png',
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.all(20.0),
                    child: new DotsIndicator(
                      controller: _controller,
                      itemCount: 3,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: _kDuration,
                          curve: _kCurve,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ViewCovidWorldList(),
              SizedBox(
                height: 10.0,
              ),
              ViewCovidVietNam(),
              TextWidgetCommon(const EdgeInsets.only(top: 10.0), "Top Country",
                  Colors.green, 20.0, FontStyle.normal),
              ViewCaseCountryList(),
            ],
          ),
        ),
      ),
    );
  }
}
