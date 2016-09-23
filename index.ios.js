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
  processColor,
} = React;

var RCTDZNWebViewExport = {
  open: function(url, options={}) {
    var parsedOptions = {};

    if(options.tintColor)
      parsedOptions.tintColor = processColor(options.tintColor);

    DZNWebView.openURLWithParams(url, parsedOptions);
  },
};

module.exports = RCTDZNWebViewExport;
