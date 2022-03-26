import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:providebitcoin/model/chartModel.dart';
import 'package:providebitcoin/model/cointainer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataPage extends StatefulWidget {
  final List info;

  const DataPage({Key? key, required this.info}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isLoading = true;
  int groupValue = 0;

  List<ChartSampleData> chartData = [];

  Future<void> getChartData() async {
    var response = await http
        .get(Uri.parse('https://canvasjs.com/data/docs/ltcusd2018.json'));
    List<ChartSampleData> tempData = chartSampleDataFromJson(response.body);
    setState(() {
      chartData = tempData;
    });
  }

  late ZoomPanBehavior zoomPanBehavior;

  @override
  void initState() {
    zoomPanBehavior =
        ZoomPanBehavior(enablePinching: true, enablePanning: true);
    getChartData();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: SfCartesianChart(
                  zoomPanBehavior: zoomPanBehavior,
                  trackballBehavior: TrackballBehavior(
                      activationMode: ActivationMode.singleTap, enable: true),
                  primaryXAxis: DateTimeAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    axisLine: const AxisLine(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                      isVisible: true,
                      majorGridLines: const MajorGridLines(width: 0),
                      interval: 50,
                      minimum: 00,
                      maximum: 400),
                  series: <ChartSeries<ChartSampleData, DateTime>>[
                    CandleSeries<ChartSampleData, DateTime>(
                      showIndicationForSameValues: true,
                      animationDuration: 1500,
                      dataSource: chartData,
                      xValueMapper: (ChartSampleData data, _) => data.date,
                      lowValueMapper: (ChartSampleData data, _) => data.low,
                      highValueMapper: (ChartSampleData data, _) => data.high,
                      openValueMapper: (ChartSampleData data, _) => data.open,
                      closeValueMapper: (ChartSampleData data, _) => data.close,
                    ),
                  ],
                ),
              ),
              CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: CupertinoColors.white,
                  thumbColor: CupertinoColors.systemGrey,
                  groupValue: groupValue,
                  children: const {
                    0: Text("1H"),
                    1: Text("1D"),
                    2: Text("1W"),
                    3: Text("1M"),
                    4: Text("1Y"),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  }),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.info.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CoinInfo(
                          text2: 'Market',
                          text1: widget.info[index]["RAW"]["USD"]["MARKET"]
                              .toString(),
                        ),
                        const SizedBox(height: 20),
                        CoinInfo(
                          text1: 'SUPPLY',
                          text2: widget.info[index]['DISPLAY']["USD"]["SUPPLY"]
                              .toString(),
                        ),
                        const SizedBox(height: 20),
                        CoinInfo(
                          text1: "PRICE",
                          text2: widget.info[index]['RAW']["USD"]["PRICE"]
                              .toString(),
                        ),
                        const SizedBox(height: 20),
                        CoinInfo(
                            text1: "LOWDAY",
                            text2: widget.info[index]['RAW']["USD"]["LOWDAY"]
                                .toString()),
                        const SizedBox(height: 20),
                        CoinInfo(
                            text1: "HIGHDAY",
                            text2: widget.info[index]['RAW']["USD"]["HIGHDAY"]
                                .toString()),
                        const SizedBox(height: 20),
                        CoinInfo(
                            text1: "CHANGEDAY",
                            text2: widget.info[index]['DISPLAY']["USD"]
                                    ["CHANGEDAY"]
                                .toString()),
                        const SizedBox(height: 20),
                        CoinInfo(
                            text1: "CHANGEHOUR",
                            text2: widget.info[index]['DISPLAY']["USD"]
                                    ["CHANGEHOUR"]
                                .toString()),
                        const SizedBox(height: 20),
                        CoinInfo(
                            text1: "MKTCAP",
                            text2: widget.info[index]['DISPLAY']["USD"]
                                    ["MKTCAP"]
                                .toString()),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Image(
                                image: AssetImage('assets/deposit.png'),
                                height: 30,
                                width: 30,
                                color: Colors.white),
                            SizedBox(width: 5),
                            Text('Buy')
                          ]),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Image(
                                image: AssetImage('assets/withdraw.png'),
                                height: 30,
                                width: 30,
                                color: Colors.white),
                            SizedBox(width: 5),
                            Text('Sell')
                          ]),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
