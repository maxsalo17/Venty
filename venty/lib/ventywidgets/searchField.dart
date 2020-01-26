import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:venty/models/categoryModel.dart';


class SearchCategoryDialog extends StatefulWidget {
  final Function(Category) onItemSelected;
  SearchCategoryDialog({this.onItemSelected});
  @override
  _SearchCategoryDialogState createState() => _SearchCategoryDialogState();
}

class _SearchCategoryDialogState extends State<SearchCategoryDialog> {
  List<Category> categories = new List<Category>();
  List<Category> filteredCategory = new List<Category>();
  Category selectedCategory;

  changeText(value) {
    setState(() {
      filteredCategory = filter(value);
    });
  }

  List<Category> filter(String value) {
    List<Category> tempList = new List<Category>();
    if ((categories != null && categories.isNotEmpty)) {
      if ((value != null && value.isNotEmpty)) {
        for (Category category in categories) {
          if (category.categoryName.toLowerCase().startsWith(value.toLowerCase())) {
            tempList.add(category);
          }
        }
      } else {
        tempList = categories;
      }
    }
    return tempList;
  }

  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  _getCategories()async{
   QuerySnapshot snapshot = await Firestore.instance.collection("categories").getDocuments();
   List<DocumentSnapshot> documents = snapshot.documents;
   for(DocumentSnapshot document in documents){
     print(document.data.toString());
     setState(() {
       categories.add(Category(categoryName: document.data["categoryName"], uid:document.documentID));
       filteredCategory=categories;
     });
     
   }
  }

  _buildCategoryItem(Category category) {
    return ListTile(
      title: Text(category.categoryName),
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
        widget.onItemSelected(selectedCategory);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.60,
            child: (categories == null || categories.isEmpty)
                ? 
                Center(child:SizedBox(height:30.0, width: 30.0,child:CircularProgressIndicator()))
                : Column(
                    children: <Widget>[
                      TextField(
                        onChanged: changeText,
                        decoration: InputDecoration(
                            hintText: "Enter category name...",
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.4)),
                            border: OutlineInputBorder()),
                      ),
                      (filteredCategory != null && filteredCategory.isNotEmpty)
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: filteredCategory.length,
                                itemBuilder:
                                    (BuildContext buildContext, int index) {
                                  return _buildCategoryItem(filteredCategory[index]);
                                },
                              ),
                            )
                          : Padding(padding:EdgeInsets.all(8.0),child:Text("Oops! Category with this name is not found. If you want exactly this category, write us.", style: TextStyle(fontSize: 14, color: Colors.black54),),),
                    ],
                  )));
  }
}
