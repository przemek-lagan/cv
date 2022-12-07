part of '../home_page.dart';

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (coreState.pageLayout.pageType == PageWidthType.wide) ...[
              const _NavigationDrawer(isDrawer: false),
            ],
            // if (coreState.pageLayout.flex > 0)
            //   Spacer(flex: coreState.pageLayout.flex),
            const Expanded(
              flex: 100,
              child: _HomePageContent(),
            ),
            // if (coreState.pageLayout.flex > 0)
            //   Spacer(flex: coreState.pageLayout.flex),
            if (coreState.pageLayout.pageType == PageWidthType.wide) ...[
              const RotatedBox(
                quarterTurns: -1,
                child: _HomeAppBar(rotated: true),
              ),
            ],
          ],
        );
      },
    );
  }
}
