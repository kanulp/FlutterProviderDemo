import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/src/model/units_model.dart';

class SimpleProviderPage extends StatelessWidget {
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple Provider Example'),
        ),
        body: ChangeNotifierProvider(
          builder: (context) => UnitModel(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new KGField(t1: t1),
                /*  IconButton(
                  icon: Icon(Icons.text_rotate_vertical),
                  onPressed: () {},
                ), */
                new LBSField(t2: t2),
                SizedBox(height: 15.0),
                new ConvertButton(),
                ShowText()
              ],
            ),
          ),
        ));
  }
}
//Consumer demo
class ShowText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Consumer<UnitModel>(
        builder: (context, unitData, _) => Text(
              'Converted value is ${unitData.unitval.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.black),
            ),
      ),
    );
  }
}

class KGField extends StatelessWidget {
  const KGField({
    Key key,
    @required this.t1,
  }) : super(key: key);

  final TextEditingController t1;

  @override
  Widget build(BuildContext context) {
    var unitData = Provider.of<UnitModel>(context);

    return TextField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: t1,
      onChanged: (s) {
        unitData.setUnitVal(double.parse(s));
      },
      decoration:
          InputDecoration(labelText: 'Enter KG', hintText: 'Enter in KG'),
    );
  }
}

class LBSField extends StatelessWidget {
  const LBSField({
    Key key,
    @required this.t2,
  }) : super(key: key);

  final TextEditingController t2;

  @override
  Widget build(BuildContext context) {
    var unitData = Provider.of<UnitModel>(context);
    t2.text = unitData.unitval.toString();
    return TextField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      controller: t2,
      decoration: InputDecoration(labelText: 'In LBS', hintText: 'In LBS'),
    );
  }
}

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var unitData = Provider.of<UnitModel>(context);

    return RaisedButton(
      child: Text('Convert'),
      onPressed: () {
        unitData.convertToKG();
      },
    );
  }
}
