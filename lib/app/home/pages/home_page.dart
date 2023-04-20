import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime(2023);

  void subtractMonth() {
    int currentMonth = date.month - 1;
    if (currentMonth == 0) {
      currentMonth = 12;
    }

    if (currentMonth == 1 || currentMonth == 3 || currentMonth == 5 || currentMonth == 7 || currentMonth == 8 || currentMonth == 10 || currentMonth == 12) {
      date = date.subtract(const Duration(days: 31));
    } else if (currentMonth == 4 || currentMonth == 6 || currentMonth == 9 || currentMonth == 11) {
      date = date.subtract(const Duration(days: 30));
    } else if (currentMonth == 2 && isItaLeapYear()) {
      date = date.subtract(const Duration(days: 29));
    } else {
      date = date.subtract(const Duration(days: 28));
    }
  }

  void incrementMonth() {
    int currentMonth = date.month;

    if (currentMonth == 1 || currentMonth == 3 || currentMonth == 5 || currentMonth == 7 || currentMonth == 8 || currentMonth == 10 || currentMonth == 12) {
      date = date.add(const Duration(days: 31));
    } else if (currentMonth == 4 || currentMonth == 6 || currentMonth == 9 || currentMonth == 11) {
      date = date.add(const Duration(days: 30));
    } else if (currentMonth == 2 && isItaLeapYear()) {
      date = date.add(const Duration(days: 29));
    } else {
      date = date.add(const Duration(days: 28));
    }
  }

  bool isItaLeapYear() {
    int currentYear = date.year;
    bool leapYear = false;
    if (currentYear % 4 == 0 && currentYear % 100 != 0) {
      leapYear = true;
    } else if (currentYear % 400 == 0) {
      leapYear = true;
    }
    return leapYear;
  }

  String getCurrentMonthDescription() {
    String monthDescription = '';
    int currentMonth = date.month;
    switch (currentMonth) {
      case 1:
        monthDescription = 'Janeiro';
        break;
      case 2:
        monthDescription = 'Fevereiro';
        break;
      case 3:
        monthDescription = 'Março';
        break;
      case 4:
        monthDescription = 'Abril';
        break;
      case 5:
        monthDescription = 'Maio';
        break;
      case 6:
        monthDescription = 'Junho';
        break;
      case 7:
        monthDescription = 'Julho';
        break;
      case 8:
        monthDescription = 'Agosto';
        break;
      case 9:
        monthDescription = 'Setembro';
        break;
      case 10:
        monthDescription = 'Outubro';
        break;
      case 11:
        monthDescription = 'Novembro';
        break;
      case 12:
        monthDescription = 'Dezembro';
        break;
    }
    return monthDescription;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('E.E.E.M. Ernesto Alves de Oliveira'),
        actions: [
          Container(
            width: screenWidth * 0.2,
            // decoration: BoxDecoration(
            //   border: Border.all(),
            // ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    subtractMonth();
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '${getCurrentMonthDescription()} / ${date.year}',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    incrementMonth();
                    setState(() {});
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(DateFormat('dd/MM/yyyy').format(date)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
