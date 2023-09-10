import 'package:expense_tracker_flutter/widgets/chart/chart.dart';
import 'package:expense_tracker_flutter/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_flutter/modals/expense.dart';
import 'package:expense_tracker_flutter/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 1.9,
      title: "dumm1",
      category: Category.food,
      date: DateTime.now(),
    ),
    Expense(
      amount: 2.9,
      title: "dumm 2",
      category: Category.food,
      date: DateTime.now(),
    ),
    Expense(
      amount: 12.9,
      title: "dummy 3",
      category: Category.food,
      date: DateTime.now(),
    ),
  ];

  void _openExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddingExpense: _addExpenseToExpenseList),
    );
  }

  void _addExpenseToExpenseList(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenseFromList(int index) {
    Expense currentExpense = _registeredExpenses[index];
    setState(() {
      _registeredExpenses.removeAt(index);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text(
          "Expense Deleted.",
        ),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(
                index,
                currentExpense,
              );
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = const Text(
      "No expense found, please add from top right button ",
    );
    if (_registeredExpenses.isNotEmpty) {
      currentScreen = ExpensesList(
        onRemoveExpense: _removeExpenseFromList,
        expenses: _registeredExpenses,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expnese Tracker"),
        actions: [
          IconButton(
              onPressed: _openExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Chart(
            expenses: _registeredExpenses,
          ),
          Expanded(
            child: currentScreen,
          ),
        ],
      ),
    );
  }
}
