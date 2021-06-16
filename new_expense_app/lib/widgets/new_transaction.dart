import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//This widget consists of the textbox to input the matter
//onpressed is inactive yet
class NewTransaction extends StatefulWidget {
  final Function txAdd;

  NewTransaction(this.txAdd);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime dateSelected;
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || dateSelected == null) {
      return;
    }
    widget.txAdd(
      enteredTitle,
      enteredAmount,
      dateSelected,
    );

    Navigator.of(context).pop();
  }

  void _newDatePicked() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        dateSelected = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    dateSelected == null
                        ? 'No Date Choosen!'
                        : 'Date choosen :' +
                            DateFormat.yMd().format(dateSelected),
                  ),
                ),
                FlatButton(
                  onPressed: _newDatePicked,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            color: Colors.green,
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: submitData,
          ),
        ],
      ),
    );
  }
}
