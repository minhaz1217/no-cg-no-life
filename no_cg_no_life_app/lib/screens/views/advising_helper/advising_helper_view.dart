
import 'package:flutter/material.dart';
import 'package:no_cg_no_life_app/screens/views/advising_helper/components/action_button.dart';
import 'package:no_cg_no_life_app/screens/views/advising_helper/components/expandable_fab.dart';

class AdvisingHelperView extends StatefulWidget {
  @override
  _AdvisingHelperViewState createState() => _AdvisingHelperViewState();
}

class _AdvisingHelperViewState extends State<AdvisingHelperView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () {},
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () {},
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed( "/create-advising-course" );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );

  }
}








