
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
        distance: 80.0,
        children: [
          // ActionButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.format_size),
          // ),
          ActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed( "/advising-course/list" );
            },
            icon: const Icon(Icons.view_list),
          ),
          ActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed( "/advising-course/create" );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );

  }
}








