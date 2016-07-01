/**
 * @providesModule RCTDZNWebView
 * @flow
 */
'use strict';

var React = require('react-native');
var {
  NativeModules: {
    RCTDZNWebView,
  },
} = React;

var RCTDNZWebViewExport = {
  open: function(url, options={}) {
    RCTDNZWebView.openUrlWithParams(url, options);
  },
};

module.exports = RCTDNZWebViewExport;
