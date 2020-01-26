import 'dart:async';
import 'dart:io';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venty/tools/theme.dart';

class MultipleImageSelector extends StatefulWidget {
  final Function onChanged;
  final double height;

  MultipleImageSelector({this.onChanged, this.height});

  @override
  _MultipleImageSelectorState createState() =>
      _MultipleImageSelectorState(onChanged: onChanged);
}

class _MultipleImageSelectorState extends State<MultipleImageSelector> {
  List<File> _images = new List<File>();

  Function(List<File>) onChanged;

  _MultipleImageSelectorState({this.onChanged});

  deleteImage(int index) {
    var tempImages = _images;

    tempImages.removeAt(index);

    setState(() {
      _images = tempImages;
    });
  }

  Future getImage() async {
    var tempimages = _images;
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (tempimages != null) {
      if (image != null) {
        tempimages.add(image);
      }
      setState(() {
        _images = tempimages;
      });
    } else {
      setState(() {
        _images.add(image);
      });
    }
    if (onChanged != null) {
      onChanged(_images);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      child: _images == null
          ? IconButton(
              padding: EdgeInsets.all(28.0),
              icon: Icon(Icons.add),
              tooltip: 'Pick Image',
              onPressed: getImage,
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _images.length + 1,
              itemBuilder: (BuildContext buildContext, int index) {
                if (index < _images.length) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new ImageItem(
                        imageFile: _images[index],
                        imageIndex: index,
                        onDelete: deleteImage,
                        sizeFactor: widget.height,
                      ));
                } else {
                  return AddImageButton(
                    sizeFactor: widget.height,
                    onTap: getImage,
                  );
                }
              }),
    );
  }
}

class ImageItem extends StatefulWidget {
  final File imageFile;
  final Function onDelete;
  final int imageIndex;
  final double sizeFactor;

  ImageItem(
      {this.imageFile,
      this.imageIndex,
      this.onDelete,
      @required this.sizeFactor});
  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  bool _isDelete = false;
  _setDelete(bool) {
    setState(() {
      _isDelete = bool;
    });
  }

  _onLongPress() {
    print('Long press');
    _setDelete(!_isDelete);
  }

  _onTap() {
    print('onTap');
    if (_isDelete) {
      delete();
    } else {}
  }

  delete() {
    widget.onDelete(widget.imageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Animator(
          tween:Tween<double>(begin: 0.0, end: 1.0),
          curve: Curves.easeOutQuad,
          duration: Duration(milliseconds: 700),
          builder: (anim)=>Transform.scale(
            scale: anim.value,
            child: Container(
        height: widget.sizeFactor * 0.85,
        width: widget.sizeFactor * 0.85,
        child: Stack(
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 7.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: widget.sizeFactor * 0.85,
                  width: widget.sizeFactor * 0.85,
                  child: Image.file(
                    widget.imageFile,
                    fit: BoxFit.cover,
                    height: widget.sizeFactor * 0.85,
                    width: widget.sizeFactor * 0.85,
                  ),
                ),
              ),
            ),
            // ClipRRect(
            //     borderRadius: BorderRadius.all(Radius.circular(50.0)),
            //     child: Container(
            //       width: 25.0,
            //       height: 25.0,
            //       color: Colors.redAccent,
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.close,
            //           size: 20.0,
            //         ),
            //         onPressed: delete,
            //         padding: EdgeInsets.all(0),
            //         color: Colors.white,
            //         hoverColor: Colors.redAccent,
            //       ),
            //     )),
            GestureDetector(
                onTap:(){_onTap();
                _setDelete(false);
                }
               ,
                onLongPress: _onLongPress,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AnimatedOpacity(
                    opacity: _isDelete ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOutQuad,
                    child: Container(
                      height: widget.sizeFactor * 0.85,
                      width: widget.sizeFactor * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _isDelete ? Colors.black26 : Colors.transparent),
                      child: Center(
                        child: _isDelete
                            ? Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 34.0,
                              )
                            : SizedBox(),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
          ),
    );
  }
}

class AddImageButton extends StatelessWidget {
  final double sizeFactor;
  final Function onTap;

  AddImageButton({this.onTap, @required this.sizeFactor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 4.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: VentyColors.primaryDark.withOpacity(0.5),
                        width: 2.0),
                    gradient: new LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 250, 250, 1),
                        Color.fromRGBO(240, 240, 240, 1)
                      ],
                      begin: FractionalOffset.centerRight,
                      end: FractionalOffset.centerLeft,
                    ),
                  ),
                  height: sizeFactor * 0.85,
                  width: sizeFactor * 0.85,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: VentyColors.primaryDark,
                      size: 30.0,
                    ),
                  )),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            height: sizeFactor * 0.85,
            width: sizeFactor * 0.85,
          ),
        )
      ],
    );
  }
}
