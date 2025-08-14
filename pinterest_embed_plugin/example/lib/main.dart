import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pinterest_embed_plugin/pinterest_embed_plugin.dart';
import 'package:pinterest_embed_plugin_example/device_resolutions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _boardWidth = 1440;
  final _scaleWidth = 200;
  final _scaleHeight = 600;

  final _boardWidthMobile = 400;
  final _scaleWidthMobile = 80;
  final _scaleHeightMobile = 1080;

  final _boardWidthTablet = 900;
  final _scaleWidthTablet = 80;
  final _scaleHeightTablet = 600;

  @override
  void initState() {
    super.initState();
  }

  Widget _displayMobile() {
    return PinterestEmbedPlugin(
      boardUrl:
          'https://za.pinterest.com/botiqmagazine/b-o-t-i-q-n-a-i-l-i-n-s-p-o/',
      boardWidth: _boardWidthMobile,
      scaleHeight: _scaleHeightMobile,
      scaleWidth: _scaleWidthMobile,
    );
  }

  Widget _displayTablet() {
    return PinterestEmbedPlugin(
      boardUrl:
          'https://za.pinterest.com/botiqmagazine/b-o-t-i-q-n-a-i-l-i-n-s-p-o/',
      boardWidth: _boardWidthTablet,
      scaleHeight: _scaleHeightTablet,
      scaleWidth: _scaleWidthTablet,
    );
  }

  Widget _displayDesktop() {
    return PinterestEmbedPlugin(
      boardUrl:
          'https://za.pinterest.com/botiqmagazine/b-o-t-i-q-n-a-i-l-i-n-s-p-o/',
      boardWidth: _boardWidth,
      scaleHeight: _scaleHeight,
      scaleWidth: _scaleWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child:
                AppDeviceResolution.isMobile(context)
                    ? _displayMobile()
                    : AppDeviceResolution.isTablet(context)
                    ? _displayTablet()
                    : _displayDesktop(),
          ),
        ),
      ),
    );
  }
}
