enum PageWidthType {
  tooSmall,
  standard,
  wide,
}

enum PageLayout {
  tooSmall(1.0, 1.0, 1, 1, PageWidthType.tooSmall),
  narrow4(1.0, 1.0, 1, 0.6, PageWidthType.standard),
  narrow3(1.0, 1.0, 1, 0.7, PageWidthType.standard),
  narrow2(1.0, 1.0, 1, 0.8, PageWidthType.standard),
  narrow1(1.0, 1.0, 1, 0.9, PageWidthType.standard),
  standard(1.0, 1.0, 1, 1.0, PageWidthType.standard),
  wide1(1.1, 1.01, 1, 1.0, PageWidthType.wide),
  wide2(1.2, 1.0, 2, 1.0, PageWidthType.wide),
  wide3(1.3, 1.0, 3, 1.0, PageWidthType.wide),
  wide4(1.4, 1.0, 4, 1.0, PageWidthType.wide);

  const PageLayout(this.value, this.correctionValue, this.flex,
      this.widthfactor, this.pageWidthType);
  final double value;
  final double correctionValue;
  final int flex;
  final double widthfactor;
  final PageWidthType pageWidthType;
}
