// MIT License

// Copyright (c) 2022 RednibCoding

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

enum MainAxisAlignment {
  start,
  end,
  center,
  spaceBetween,
  spaceAround,
  spaceEvenly,
}

enum CrossAxisAlignment {
  start,
  end,
  center,
  stretch,
  baseline,
}

enum Alignment {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

class EdgeInsets {
  final String leftValue;
  final String topValue;
  final String rightValue;
  final String bottomValue;

  EdgeInsets.all(
    String value,
  )   : leftValue = value,
        topValue = value,
        rightValue = value,
        bottomValue = value;

  EdgeInsets.only({
    String left = "0px",
    String top = "0px",
    String right = "0px",
    String bottom = "0px",
  })  : leftValue = left,
        topValue = top,
        rightValue = right,
        bottomValue = bottom;

  EdgeInsets.symmetric({
    String horizontal = "0px",
    String vertical = "0px",
  })  : leftValue = horizontal,
        topValue = vertical,
        rightValue = horizontal,
        bottomValue = vertical;

  EdgeInsets.fromLTRB({
    String left = "0px",
    String top = "0px",
    String right = "0px",
    String bottom = "0px",
  })  : leftValue = left,
        topValue = top,
        rightValue = right,
        bottomValue = bottom;
}

String crossAxisAlignmentToString(CrossAxisAlignment alignment) {
  switch (alignment) {
    case CrossAxisAlignment.start:
      return "flex-start";
    case CrossAxisAlignment.end:
      return "flex-end";
    case CrossAxisAlignment.center:
      return "center";
    case CrossAxisAlignment.stretch:
      return "stretch";
    case CrossAxisAlignment.baseline:
      return "baseline";
  }
}

String mainAxisAlignmentToString(MainAxisAlignment alignment) {
  switch (alignment) {
    case MainAxisAlignment.start:
      return "flex-start";
    case MainAxisAlignment.end:
      return "flex-end";
    case MainAxisAlignment.center:
      return "center";
    case MainAxisAlignment.spaceBetween:
      return "space-between";
    case MainAxisAlignment.spaceAround:
      return "space-around";
    case MainAxisAlignment.spaceEvenly:
      return "space-evenly";
  }
}
