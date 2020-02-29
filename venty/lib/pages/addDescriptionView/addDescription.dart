
import 'package:flutter/material.dart';
import 'package:venty/bloc/descriptionBloc.dart';
import 'package:venty/tools/textStyles.dart';
import 'package:venty/ventywidgets/descriptionItemWidgets/textDescription.dart';
import 'package:venty/ventywidgets/descriptionItemWidgets/textTitledDescription.dart';
import 'package:venty/ventywidgets/descriptionItemWidgets/youtubeDescription.dart';
import 'package:venty/ventywidgets/descriptionToolItem.dart';

class AddDescriptionView extends StatefulWidget {
  DescriptionBloc bloc;
  AddDescriptionView({this.bloc});
  @override
  _AddDescriptionViewState createState() => _AddDescriptionViewState();
}

class _AddDescriptionViewState extends State<AddDescriptionView> {
  
  List<Widget> items = List<Widget>();
  var _controller = ScrollController();
  List<DescriptionToolItem> tools = List<DescriptionToolItem>();

  @override
  void initState() {
    tools = [
      DescriptionToolItem(
        assetName: "images/textEnum.png",
        onPressed: () {
          _addWidget(TextDescriptionWidget(
            index: items.length,
            onChanged: widget.bloc.onChanged,
          ));
        },
      ),
      DescriptionToolItem(
        assetName: "images/textTitled.png",
        onPressed: () {
          _addWidget(TextTitledDescriptionWidget(
            index: items.length,
            onChanged: widget.bloc.onChanged,
          ));
        },
      ),
      DescriptionToolItem(
        assetName: "images/youtubeItem.png",
        onPressed: () {
          _addWidget(YoutubeDescriptionWidget(
            index: items.length,
            onChanged: widget.bloc.onChanged,
          ));
        },
      ),
    ];
    super.initState();
  }

  _addWidget(Widget item) {
    setState(() {
      items.add(item ?? SizedBox());
    });
    _controller.animateTo(_controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 400), curve: Curves.easeOutCubic);
  }

  _submit() async {
    var res = await widget.bloc.submit();
    if(res == true){
      Navigator.pop(context, true);
    }
    else{
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("Create Description",style: TextStyles.appBarTitle,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done,color: Colors.black,),
            onPressed: _submit(),
          )
        ],
      ),
      body: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.75,
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [...items.map((t) => Padding(padding: EdgeInsets.all(12.0),
                child: t,
                )).toList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[IconButton(icon: Icon(Icons.add),onPressed: (){},)]),
                ],
              ),
            ),
          ),
           Container(
             child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tools
                      .map((t) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 26,vertical:16),
                            child: t,
                          ))
                      .toList(),
                ),
              ),
          ),
           )
        ]),
      ),
    );
  }
}
