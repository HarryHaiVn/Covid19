import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_covid19/data/model/covid_model.dart';
import 'package:flutter_covid19/src/bloc/covid_bloc.dart';
import 'package:flutter_covid19/src/ui/common/widget.dart';
import 'package:flutter_covid19/utils/utils.dart';
import 'package:intl/intl.dart';

class ViewCovidVietNam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CovidVietNamView();
  }
}

class CovidVietNamView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CovidVietNamViewState();
  }
}

class CovidVietNamViewState extends State<CovidVietNamView>
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
    _covidBloc.getCaseCovidInVietNam();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CovidModel>>(
      stream: _covidBloc.covidVietNam,
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
          var covidModel = snapshot.data;
          if (null != covidModel)
            return buildDataViewWidget(covidModel);
          else
            return buildViewNoDataWidget();
        }
      },
    );
  }

  Widget buildDataViewWidget([List<CovidModel> covidModels]) {
    CovidModel covidModel = covidModels[0];
    final formatter = new NumberFormat("#,###");
    return Card(
      elevation: 10.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextWidgetCommon(const EdgeInsets.all(0.0), "Việt Nam",
                Colors.black, 20.0, FontStyle.normal, FontWeight.bold),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextWidgetCommon(const EdgeInsets.all(8.0), "Số ca nhiễm",
                        Colors.black, 20.0, FontStyle.normal),
                    TextWidgetCommon(
                        const EdgeInsets.all(8.0),
                        formatter.format(covidModel.total_cases).toString(),
                        Colors.red,
                        20.0,
                        FontStyle.normal),
                    TextWidgetCommon(const EdgeInsets.all(8.0), "Phục hồi",
                        Colors.black, 20.0, FontStyle.normal),
                    TextWidgetCommon(
                        const EdgeInsets.all(8.0),
                        formatter.format(covidModel.total_recovered).toString(),
                        Colors.green,
                        20.0,
                        FontStyle.normal),
                  ],
                ),
                SizedBox(
                  width: 60.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextWidgetCommon(const EdgeInsets.all(8.0), "Đang điều trị",
                        Colors.black, 20.0, FontStyle.normal),
                    TextWidgetCommon(
                        const EdgeInsets.all(8.0),
                        formatter
                            .format(covidModel.total_serious_cases)
                            .toString(),
                        Colors.blue,
                        20.0,
                        FontStyle.normal),
                    TextWidgetCommon(const EdgeInsets.all(8.0), "Tử vong",
                        Colors.black, 20.0, FontStyle.normal),
                    TextWidgetCommon(
                        const EdgeInsets.all(8.0),
                        formatter.format(covidModel.total_deaths).toString(),
                        Colors.grey,
                        20.0,
                        FontStyle.normal),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
