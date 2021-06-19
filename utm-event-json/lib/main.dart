import 'package:flutter/material.dart';
import 'router.dart';

void main() => runApp(
      MaterialApp(
        title: 'UTM EVENT - Group LIM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        initialRoute: '/',
        onGenerateRoute: createRoute,
      ),
    );

