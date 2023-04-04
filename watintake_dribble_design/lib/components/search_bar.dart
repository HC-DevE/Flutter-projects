//create a search input field
// Path: watintake_dribble_design\lib\components\search_bar.dart
// Compare this snippet from watintake_dribble_design\lib\components\search_bar.dart:
import 'package:flutter/material.dart';
import 'package:watintake_dribble_design/components/my_text_field.dart';

class SearchBar extends StatelessWidget {
  // final Function(String)? onChanged;
  // final Function()? onTap;
  SearchBar({super.key, 
  // this.onChanged, 
  // this.onTap
  });

  final _searchInputController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 10),
                Expanded(
                  child: MyTextField(
                    controller: _searchInputController,
                    hintText: 'Search foods',
                    isPassword: false,
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.filter_list),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
