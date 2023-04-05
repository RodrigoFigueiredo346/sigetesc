import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();

  void subtractMonth() {
    int currentMonth = date.month;

    if (currentMonth == 1 ||
        currentMonth == 3 ||
        currentMonth == 5 ||
        currentMonth == 7 ||
        currentMonth == 8 ||
        currentMonth == 10 ||
        currentMonth == 12) {
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

    if (currentMonth == 1 ||
        currentMonth == 3 ||
        currentMonth == 5 ||
        currentMonth == 7 ||
        currentMonth == 8 ||
        currentMonth == 10 ||
        currentMonth == 12) {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('E.E.E.M. Ernesto Alves de Oliveira'),
        actions: [
          IconButton(
            onPressed: () {
              subtractMonth();
              setState(() {});
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Center(
            child: Text(
              '${getCurrentMonthDescription()} / ${date.year}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
