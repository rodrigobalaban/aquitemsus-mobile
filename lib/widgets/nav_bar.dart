import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Expanded(
            child: IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: null,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.schedule_outlined),
              onPressed: null,
            ),
          ),
          Expanded(child: Text('')),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.event_outlined),
              onPressed: null,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }
}
