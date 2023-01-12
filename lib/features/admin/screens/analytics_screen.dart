import 'package:app4/common/widget/loader.dart';
import 'package:app4/features/account/widgets/top_buttons.dart';
import 'package:app4/features/admin/models/sales.dart';
import 'package:app4/features/admin/services/admin_services.dart';
import 'package:app4/features/admin/widget/category_products_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              const SizedBox(height: 30),
              const TopButtons(),
              const SizedBox(height: 50),
              Text(
                '\$$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: CategoryProductsChart(seriesList: [
                  charts.Series(
                    id: 'Sales',
                    data: earnings!,
                    domainFn: (Sales sales, _) => sales.label,
                    measureFn: (Sales sales, _) => sales.earning,
                  ),
                ]),
              )
            ],
          );
  }
}
