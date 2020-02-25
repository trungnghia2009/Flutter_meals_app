import 'package:flutter/material.dart';
import '../main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = 'fliters_screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen({this.saveFilters, this.currentFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  Widget _buildSwitchListTile(
      bool switchValue, String text, Function updateValue) {
    return SwitchListTile(
      value: switchValue,
      onChanged: updateValue,
      title: Text(text),
      subtitle: Text('Only include $text meals'),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1,
      height: 1,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildDivider(),
                _buildSwitchListTile(_isGlutenFree, 'Gluten-free', (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                }),
                _buildDivider(),
                _buildSwitchListTile(_isLactoseFree, 'Lactose-free', (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                }),
                _buildDivider(),
                _buildSwitchListTile(_isVegan, 'Vegan', (value) {
                  setState(() {
                    _isVegan = value;
                  });
                }),
                _buildDivider(),
                _buildSwitchListTile(_isVegetarian, 'Vagetarian', (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                }),
                _buildDivider(),
                SizedBox(
                  height: 50,
                ),
                // TODO: reset button
                IconButton(
                  autofocus: false,
                  iconSize: 20,
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.pink,
                    size: 40,
                  ),
                  onPressed: () {
                    Map<String, bool> selectedFilters = {
                      'gluten': false,
                      'lactose': false,
                      'vegan': false,
                      'vegetarian': false,
                    };
                    widget.saveFilters(selectedFilters);
                    setState(() {
                      _isGlutenFree = false;
                      _isLactoseFree = false;
                      _isVegan = false;
                      _isVegetarian = false;
                    });
                  },
                ),
                Center(
                    heightFactor: 1,
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
