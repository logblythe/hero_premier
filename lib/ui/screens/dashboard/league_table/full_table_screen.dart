import 'package:flutter/material.dart';
import 'package:hero_premier/ui/screens/dashboard/league_table/table_screen.dart';

class FullTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom:20.0),
        child: TableScreen(fullTable: true),
      ),
    );
  }
}
