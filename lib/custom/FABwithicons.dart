import 'package:flutter/material.dart';

class FabWithIcons extends StatefulWidget {

  final List<IconData> icons;
  ValueChanged<int> onIconTapped;
  FabWithIcons({this.icons, this.onIconTapped});

  @override
  _FabWithIconsState createState() => _FabWithIconsState();
}

class _FabWithIconsState extends State<FabWithIcons> with TickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.icons.length, (int index) {
        return _buildChild(index);
      }).toList() .. add(
        _buildFab(),
      ),
    );
  }

  Widget _buildChild(int index)
  {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).accentColor;
    return Container(
      height: 70.0,
      width: 56.0,
      alignment: FractionalOffset.topCenter,
      child: ScaleTransition(
        child: FloatingActionButton(
          backgroundColor: backgroundColor,
          mini: true,
          child: Icon(widget.icons[index], color: foregroundColor),
          onPressed: () => _onTapped(index),
        ),
        scale: CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 1.0 - index/ widget.icons.length/2.0, curve: Curves.easeOut)
        ),
      ),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      tooltip: "Increment",
      child: Icon(Icons.add),
      elevation: 2.0,
      onPressed: () {
        if(_controller.isDismissed) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
    );
  }

  void _onTapped(int index) {
    _controller.reverse();
    widget.onIconTapped(index);
  }

}