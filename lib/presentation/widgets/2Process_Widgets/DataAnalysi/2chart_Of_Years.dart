import 'package:acb/business_logic/Process_Cubit/Get_Process_Cubit.dart';
import 'package:acb/business_logic/Process_Cubit/Process_State.dart';
import 'package:acb/shared/Tooles/DateTimePickerWidget2.dart';
import 'package:acb/shared/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart_Of_Years extends StatelessWidget {
  const Chart_Of_Years({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<Get_Process_Cubit, ProcessStates>(
      builder: (context, state) {
        Get_Process_Cubit get_process_cubit = Get_Process_Cubit.get(context);

        return Container(
          color: secondaryColor,
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    " تحليل بيانات لسنه اختار السنه ",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(child: DateTimePickerWidget2()),
                    Expanded(
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            print(get_process_cubit.selectedDate2.year
                                .toString());
                            get_process_cubit.getDataAboutOneYear(
                              CompanyID: get_process_cubit
                                  .company_model!.CompanyID
                                  .toString(),
                              EYear: get_process_cubit.selectedDate2.year
                                  .toString(),
                            );
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 400,
                    width: 600,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        majorGridLines: MajorGridLines(
                          color: Color(0xFFFFC727),
                          // Set the desired color for the major grid lines
                        ),
                        labelStyle: TextStyle(
                          color: Color(
                              0xFFFFC727), // Set the desired color for the labels
                        ),
                      ),
                      primaryYAxis: NumericAxis(
                        majorGridLines: MajorGridLines(
                          color: Color(
                              0xFFFFC727), // Set the desired color for the major grid lines
                        ),
                        labelStyle: TextStyle(
                          color: Color(
                              0xFFFFC727), // Set the desired color for the labels
                        ),
                      ),
                      series: <ChartSeries>[
                        ColumnSeries<ChartData, String>(
                          dataSource: <ChartData>[
                            ChartData('يناير',
                                get_process_cubit.AllMonthesOfYears[0]),
                            ChartData('فبراير ',
                                get_process_cubit.AllMonthesOfYears[1]),
                            ChartData('مارس ',
                                get_process_cubit.AllMonthesOfYears[2]),
                            ChartData('ابريل  ',
                                get_process_cubit.AllMonthesOfYears[3]),
                            ChartData('مايو ',
                                get_process_cubit.AllMonthesOfYears[4]),
                            ChartData('يونيو ',
                                get_process_cubit.AllMonthesOfYears[5]),
                            ChartData('يوليو ',
                                get_process_cubit.AllMonthesOfYears[6]),
                            ChartData('أغسطس ',
                                get_process_cubit.AllMonthesOfYears[7]),
                            ChartData('سبتمبر ',
                                get_process_cubit.AllMonthesOfYears[8]),
                            ChartData('أكتوبر ',
                                get_process_cubit.AllMonthesOfYears[9]),
                            ChartData('نوفمبر ',
                                get_process_cubit.AllMonthesOfYears[10]),
                            ChartData('ديسمبر ',
                                get_process_cubit.AllMonthesOfYears[11]),
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          animationDelay: 220.0,
                          borderColor: Colors.red,
                          color: Colors.blue,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            // color: Colors.white, // Display labels on the columns
                            labelAlignment: ChartDataLabelAlignment
                                .top, // Position labels at the top of the columns
                            labelPosition: ChartDataLabelPosition
                                .inside, // Place labels inside the columns
                            showCumulativeValues: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Create a data model class for chart data
class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
