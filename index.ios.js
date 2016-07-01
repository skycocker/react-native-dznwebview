/**
 * @providesModule RCTDZNWebView
 * @flow
 */
'use strict';

var React = require('react-native');
var {
  NativeModules: {
    WebView,
  },
} = React;

var RCTDZNWebViewExport = {
  open: function(url, options={}) {
    WebView.openUrlWithParams(url, options);
  },
};

module.exports = RCTDZNWebViewExport;
