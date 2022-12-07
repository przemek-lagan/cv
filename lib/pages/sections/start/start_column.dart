part of 'start.dart';

class _StartColumn extends StatelessWidget {
  final CrossAxisAlignment alignment;
  const _StartColumn({
    required this.alignment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Column(
          crossAxisAlignment: alignment,
          children: [
            Text(
              t!.start_hi,
              style: Theme.of(context).textTheme.startTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6 * coreState.pageLayout.textScale),
            Text(
              t.start_my_title,
              style: Theme.of(context).textTheme.startSubtitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18 * coreState.pageLayout.textScale),
            Text.rich(
              textAlign: TextAlign.justify,
              TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  indentSpan(coreState.pageLayout),
                  TextSpan(text: t.start_info),
                ],
              ),
            ),
            SizedBox(height: 32 * coreState.pageLayout.textScale),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                    horizontal: 24 * coreState.pageLayout.textScale,
                    vertical: 18 * coreState.pageLayout.textScale,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              onPressed: () {
                // final pdfController = PdfController(
                //   document: PdfDocument.openAsset('assets/Resume.pdf'),
                // );

                // Widget pdfView() => PdfView(
                //       controller: pdfController,
                //     );
              },
              child: Text(
                t.start_button,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            PDFView(),
          ],
        );
      },
    );
  }
}
