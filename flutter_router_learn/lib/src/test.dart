// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("测试 hello world"),),
      body:  Container(
        child: Center(
            child: Text('Hello, world!',
                key: Key('title'), textDirection: TextDirection.ltr)),
      ),
    );
  }
}
