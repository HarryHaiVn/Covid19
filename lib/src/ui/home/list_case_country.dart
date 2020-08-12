import 'package:flutter/material.dart';
import 'package:flutter_covid19/data/model/covid_model.dart';
import 'package:flutter_covid19/src/bloc/covid_bloc.dart';
import 'package:flutter_covid19/src/ui/common/widget.dart';
import 'package:flutter_covid19/src/ui/widgets/text_widget.dart';
import 'package:flutter_covid19/utils/utils.dart';
import 'package:intl/intl.dart';

class ViewCaseCountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewCaseCountryView();
  }
}

class ViewCaseCountryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewCaseCountryViewState();
  }
}

class ViewCaseCountryViewState extends State<ViewCaseCountryView>
    with WidgetsBindingObserver {
  final CovidBloc _covidBloc = new CovidBloc();

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  void dispose() {
    _covidBloc.closeObservable();
    super.dispose();
  }

  void refresh() {
    _covidBloc.getCaseCovidInCountry();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CovidModel>>(
      stream: _covidBloc.covidCountry,
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildCircularProgressIndicatorWidget();
        }
        if (snapshot.hasError) {
          Utils.showSnackBar(context, snapshot.error.toString());
          return buildViewNoDataWidget();
        }
        if (snapshot.connectionState == ConnectionState.active) {
          var caseCountry = snapshot.data;
          if (null != caseCountry)
            return buildListViewWidget(caseCountry);
          else
            return buildViewNoDataWidget();
        }
      },
    );
  }

  Widget buildListViewWidget(List<CovidModel> caseCountry) {
    final formatter = new NumberFormat("#,###");
    return ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: caseCountry.length,
        itemBuilder: (context, position) {
          return Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: TextWidgetCommon(
                      EdgeInsets.only(top: 10.0, bottom: 10.0),
                      caseCountry[position].title,
                      Color(0xff057203),
                      20.0,
                      FontStyle.normal,
                      FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'ic_virus.png',
                          width: 36.0,
                          color: Colors.red,
                          height: 36.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            formatter
                                .format(caseCountry[position].total_cases)
                                .toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'ic_deaths.png',
                          width: 36.0,
                          height: 36.0,
                          color: Colors.grey,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                          child: Text(
                            formatter
                                .format(caseCountry[position].total_deaths)
                                .toString(),
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'ic_recovered.png',
                          width: 36.0,
                          height: 36.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                          child: Text(
                            formatter
                                .format(caseCountry[position].total_recovered)
                                .toString(),
                            style: TextStyle(
                                color: Color(0xff057203),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'ic_active.png',
                          width: 36.0,
                          height: 36.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                          child: Text(
                            formatter
                                .format(
                                    caseCountry[position].total_serious_cases)
                                .toString(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
