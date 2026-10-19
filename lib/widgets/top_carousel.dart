import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';

class TopCarousel extends StatelessWidget {
  const TopCarousel({super.key, required this._expenses});

  final List<Expense> _expenses;

  double amountThisMonth() {
    final DateTime now = DateTime.now();
    final int currentMonth = now.month;
    final int currentYear = now.year;

    return _expenses
        .where(
          (expense) =>
              expense.date.month == currentMonth &&
              expense.date.year == currentYear,
        )
        .fold(0, (total, current) => total + current.amount);
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.orientationOf(context);
    final String thisMonthAmount = amountThisMonth().toString();
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: 240,
      child: orientation == Orientation.portrait
          ? CarouselView(
              scrollDirection: Axis.horizontal,
              itemExtent: screenWidth,
              shrinkExtent: screenWidth,
              itemSnapping: true,
              padding: EdgeInsets.zero,
              onTap: (index) {
                print(index);
                print("Registered tap");
              },
              children: [
                Chart(expenses: _expenses),
                //Text(amountThisMonth().toString()),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        Theme.of(context).colorScheme.primary.withOpacity(0.0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$$thisMonthAmount',
                        style: TextStyle(
                          fontSize: thisMonthAmount.length >= 7 ? 60 : 84,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('spent this month', style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
            child: Column(
                children: [
                  Chart(expenses: _expenses),
                  //Text(amountThisMonth().toString()),
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          Theme.of(context).colorScheme.primary.withOpacity(0.0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$$thisMonthAmount',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('spent this month', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ],
              ),
          ),
    );
  }
}
