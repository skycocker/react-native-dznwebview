/**
 * @providesModule RCTDZNWebView
 * @flow
 */
'use strict';

var React = require('react-native');
var {
  NativeModules: {
    DZNWebView,
  },
} = React;

var RCTDZNWebViewExport = {
  open: function(url, options={}) {
    DZNWebView.openURLWithParams(url, options);
  },
};

module.exports = RCTDZNWebViewExport;
