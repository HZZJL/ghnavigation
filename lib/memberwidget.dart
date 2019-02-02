/*
 * Copyright (c) 2019 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import 'package:flutter/material.dart';

import 'member.dart';

class MemberWidget extends StatelessWidget {
  final Member member;

  MemberWidget(this.member)  {
    if (member == null) {
      throw new ArgumentError("member of MemberWidget cannot be null. "
          "Received: '$member'");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text(member.login),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Column(
          children: [
            new Image.network(member.avatarUrl),
            new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.green, size: 48.0),
              onPressed: () { Navigator.pop(context); }
              ),
            new RaisedButton(
              child: new Text('PRESS ME'),
              onPressed: () { _showOKScreen(context); }
              )
          ]),
      )
    );
  }

  _showOKScreen(BuildContext context) async {
    bool value = await Navigator.of(context).push(new MaterialPageRoute<bool>(
      builder: (BuildContext context) {
        return new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Column(
          children: [
            new GestureDetector(
              child: new Text('OK'),
              onTap: () { Navigator.of(context).pop(true); }
            ),
            new GestureDetector(
              child: new Text('NOT OK'),
              onTap: () { Navigator.of(context).pop(false); }
            )
          ])
        );
      }
    ));
    var alert = new AlertDialog(
      content: new Text((value != null && value) ? "OK was pressed" : "NOT OK or BACK was pressed"),
      actions: <Widget>[
        new FlatButton(
          child: new Text('OK'),
          onPressed: () { Navigator.of(context).pop(); }
          )
      ],
    );
    showDialog(context: context, builder: (BuildContext context) { return alert; });
  }
}