enum PageWidthType {
  tooSmall,
  standard,
  wide,
}

enum PageLayout {
  tooSmall(
    textScale: 1.0,
    textCorrection: 1.0,
    flex: 0,
    widthfactor: 1,
    pageType: PageWidthType.tooSmall,
  ),
  narrow4(
    textScale: 1.0,
    textCorrection: 1.0,
    flex: 0,
    widthfactor: 0.6,
    pageType: PageWidthType.standard,
  ),
  narrow3(
    textScale: 1.0,
    textCorrection: 1.0,
    flex: 0,
    widthfactor: 0.7,
    pageType: PageWidthType.standard,
  ),
  narrow2(
    textScale: 1.0,
    textCorrection: 1.0,
    flex: 0,
    widthfactor: 0.8,
    pageType: PageWidthType.standard,
  ),
  narrow1(
    textScale: 1.0,
    textCorrection: 1.0,
    flex: 5,
    widthfactor: 0.9,
    pageType: PageWidthType.standard,
  ),
  standard(
    textScale: 1.0,
    textCorrection: 1.0,
    flex: 10,
    widthfactor: 1.0,
    pageType: PageWidthType.standard,
  ),
  wide1(
    textScale: 1.1,
    textCorrection: 1.01,
    flex: 15,
    widthfactor: 1.0,
    pageType: PageWidthType.standard,
  ),
  wide2(
    textScale: 1.2,
    textCorrection: 1.0,
    flex: 20,
    widthfactor: 1.0,
    pageType: PageWidthType.wide,
  ),
  wide3(
    textScale: 1.3,
    textCorrection: 1.0,
    flex: 25,
    widthfactor: 1.0,
    pageType: PageWidthType.wide,
  ),
  wide4(
    textScale: 1.4,
    textCorrection: 1.0,
    flex: 30,
    widthfactor: 1.0,
    pageType: PageWidthType.wide,
  );

  const PageLayout({
    required this.textScale,
    required this.textCorrection,
    required this.flex,
    required this.widthfactor,
    required this.pageType,
  });
  final double textScale;
  final double textCorrection;
  final int flex;
  final double widthfactor;
  final PageWidthType pageType;
}
