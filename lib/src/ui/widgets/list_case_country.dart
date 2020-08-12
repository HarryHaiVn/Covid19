import 'package:flutter/material.dart';
import 'package:flutter_covid19/data/model/covid_model.dart';
import 'package:flutter_covid19/src/bloc/covid_bloc.dart';
import 'package:flutter_covid19/src/ui/common/widget.dart';
import 'package:flutter_covid19/src/ui/widgets/text_widget.dart';
import 'package:flutter_covid19/utils/appLocalizations.dart';
import 'package:flutter_covid19/utils/utils.dart';
import 'package:intl/intl.dart';

class ViewCaseCountryList extends StatefulWidget {
  ViewCaseCountryList({Key key}) : super(key: key);

  @override
  ViewCaseCountryViewState createState() => new ViewCaseCountryViewState();
}

class ViewCaseCountryViewState extends State<ViewCaseCountryList> {
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  final CovidBloc _covidBloc = new CovidBloc();

  Widget appBarTitle = TextWidgetCommon(const EdgeInsets.all(0.0),
      "Top Country", Colors.green, 20.0, FontStyle.normal);

  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.green,
  );

  // ignore: non_constant_identifier_names
  bool _IsSearching;
  String _searchText = "";

  ViewCaseCountryViewState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

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
    _IsSearching = false;
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
            return _IsSearching
                ? _buildSearchList(caseCountry)
                : _buildListViewWidget(caseCountry);
          else
            return buildViewNoDataWidget();
        }
      },
    );
  }

  Widget _buildListViewWidget(List<CovidModel> caseCountry) {
    final formatter = new NumberFormat("#,###");
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(child: this.appBarTitle),
                IconButton(
                  icon: actionIcon,
                  onPressed: () {
                    setState(() {
                      if (this.actionIcon.icon == Icons.search) {
                        this.actionIcon = new Icon(
                          Icons.close,
                          color: Colors.blue,
                        );
                        this.appBarTitle = Flexible(
                          child: new TextField(
                            controller: _searchQuery,
                            style: new TextStyle(
                              color: Colors.blue,
                            ),
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context).translate('search'),
                                hintStyle: new TextStyle(
                                    color: Colors.blue, fontSize: 20.0)),
                          ),
                        );
                        _handleSearchStart();
                      } else {
                        _handleSearchEnd();
                      }
                    });
                  },
                ),
              ]),
        ),
        ListView.builder(
            padding: EdgeInsets.only(top: 0.0, bottom: 10.0),
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
                                    .format(
                                        caseCountry[position].total_recovered)
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
                                    .format(caseCountry[position]
                                        .total_serious_cases)
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
            }),
      ],
    );
  }

  _buildSearchList(List<CovidModel> _caseCountrys) {
    if (_searchText.isEmpty) {
      return _buildListViewWidget(_caseCountrys);
    } else {
      List<CovidModel> _searchList = List();
      for (int i = 0; i < _caseCountrys.length; i++) {
        String name = _caseCountrys[i].title;
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(_caseCountrys[i]);
        }
      }
      return _buildListViewWidget(_searchList);
    }
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.green,
      );
      this.appBarTitle = TextWidgetCommon(const EdgeInsets.all(0.0),
          "Top Country", Colors.green, 20.0, FontStyle.normal);
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;

  ChildItem(this.name);

  @override
  Widget build(BuildContext context) {
    return new ListTile(title: new Text(this.name));
  }
}
