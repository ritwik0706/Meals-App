import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function filterHandler;
  final Map<String, bool> _initialFilterData;
  FiltersScreen(this._initialFilterData, this.filterHandler);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    super.initState();
    _isGlutenFree = widget._initialFilterData['glutenFree'];
    _isLactoseFree = widget._initialFilterData['lactoseFree'];
    _isVegan = widget._initialFilterData['vegan'];
    _isVegetarian = widget._initialFilterData['vegetarian'];
  }

  Widget _buildSwitchedTile(String title, String desciption, bool currentValue,
      Function upDateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(desciption),
      value: currentValue,
      onChanged: upDateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  widget.filterHandler({
                    'glutenFree': _isGlutenFree,
                    'lactoseFree': _isLactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegetarian,
                  });
                  Navigator.of(context).pushReplacementNamed('/');
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchedTile(
                    'Gluten-Free',
                    'Only include gluten-free meals',
                    _isGlutenFree,
                    (newVlaue) {
                      setState(() {
                        _isGlutenFree = newVlaue;
                      });
                    },
                  ),
                  _buildSwitchedTile(
                    'Lactose-Free',
                    'Only include lactose-free meals',
                    _isLactoseFree,
                    (newVlaue) {
                      setState(() {
                        _isLactoseFree = newVlaue;
                      });
                    },
                  ),
                  _buildSwitchedTile(
                    'Vegan',
                    'Only include vegan meals',
                    _isVegan,
                    (newVlaue) {
                      setState(() {
                        _isVegan = newVlaue;
                      });
                    },
                  ),
                  _buildSwitchedTile(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _isVegetarian,
                    (newVlaue) {
                      setState(() {
                        _isVegetarian = newVlaue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
