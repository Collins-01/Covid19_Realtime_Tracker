import 'package:flutter/material.dart';

double calculatePercentageGrowth(int newCases, int existingCases) {
  var percentageGrowth = (newCases / existingCases) * 100;
  return percentageGrowth.isInfinite || percentageGrowth.isNaN
      ? 0.0
      : percentageGrowth;
}

Icon showGrowthIcon(int newCases, int existingCases) {
  Icon icon;
  if (newCases > existingCases) {
    icon = Icon(
      Icons.arrow_upward,
      color: Colors.red,
    );
  } else {
    icon = Icon(
      Icons.arrow_downward,
      color: Colors.red,
    );
  }
  return icon;
}

// Percentage Change
// Percentage
// Percentage Change ==((Existing-new)/Existing)*100
//  What if new case ==0?
// Total==Deaths+Unresolved
// Params==
//
//
//
//
//
//
