import 'package:flutter/material.dart';

void main() => runApp(BudgetTrackerApp());

class BudgetTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/expenses': (_) => ExpensesScreen(),
        '/new': (_) => NewEntryScreen()
      },
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        accentColor: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.indigo[800],
              onPressed: () {}),
        ),
        centerTitle: true,
        title: Text('Budget Tracker',
            style: TextStyle(
                color: Colors.indigo[800], fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_sharp,
                color: Colors.indigo[800], size: 58),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text('Welcome',
                        style: TextStyle(fontSize: 25, color: Colors.black)),
                    Text('Back!',
                        style: TextStyle(fontSize: 25, color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 320,
              height: 42,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text('Total:',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(width: 140),
                  Text('98750',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  SizedBox(width: 10),
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, '/expenses'),
                      child:
                          Icon(Icons.expand_circle_down, color: Colors.black)),
                ],
              ),
              decoration: ShapeDecoration(
                  color: Colors.indigo[100],
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.red, width: 2))),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
          child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.indigo[800])),
        ),
        centerTitle: true,
        title: Text('Budget Tracker',
            style: TextStyle(
                color: Colors.indigo[800], fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ExpenseItemRow(label: 'Groceries', amount: '300', onDelete: () {}),
            SizedBox(height: 20),
            ExpenseItemRow(label: 'Bills', amount: '650', onDelete: () {}),
            SizedBox(height: 20),
            ExpenseItemRow(label: 'Salary', amount: '75000', onDelete: () {}),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.pushNamed(context, '/new'),
        child: Icon(Icons.add, color: Colors.yellow),
      ),
    );
  }
}

class NewEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
          child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.indigo[800])),
        ),
        centerTitle: true,
        title: Text('Budget Tracker',
            style: TextStyle(
                color: Colors.indigo[800], fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New Entry',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black))
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 5),
                  Text('Price:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black))
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 5),
                  Text('Category:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black))
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.green),
                  SizedBox(width: 10)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseItemRow extends StatelessWidget {
  final String label;
  final String amount;
  final VoidCallback onDelete;

  const ExpenseItemRow(
      {required this.label, required this.amount, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 36,
          child: Row(
            children: [
              SizedBox(width: 10),
              Text(label,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              SizedBox(width: 85),
              Text(amount, style: TextStyle(fontSize: 17, color: Colors.black)),
              SizedBox(width: 5),
              Icon(Icons.expand_circle_down, color: Colors.black),
            ],
          ),
          decoration: ShapeDecoration(
              color: Colors.indigo[100],
              shape:
                  StadiumBorder(side: BorderSide(color: Colors.red, width: 2))),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(5),
          child: IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
        ),
      ],
    );
  }
}
