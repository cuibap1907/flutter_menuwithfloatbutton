import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navbar/custom/FABBottomAppBar.dart';
import 'package:flutter_bottom_navbar/custom/FABwithicons.dart';

void main()
{
  runApp(MainHomeView());
}

class MainHomeView extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView("Bottom Navigation"),
    );
  }
}

class HomeView extends StatefulWidget {
  final String _title;
  HomeView(this._title);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
      bottomNavigationBar: FABottomAppBar(
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: "This"),
          FABBottomAppBarItem(iconData: Icons.layers, text: "is"),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: "Bottom"),
          FABBottomAppBarItem(iconData: Icons.info, text: "Bar")
        ],
      ),
      );
      }
        
    void _selectedTab(int value) {
      print("Tabbed in $value");
    }

    Widget _buildFab(BuildContext context)
    {
      final icons = [Icons.sms, Icons.mail, Icons.phone];
      return FabWithIcons(icons: icons, onIconTapped: (index) {},);
    }
}