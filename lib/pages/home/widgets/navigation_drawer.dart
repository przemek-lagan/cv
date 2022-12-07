part of '../home_page.dart';

class _NavigationDrawer extends StatelessWidget {
  const _NavigationDrawer({
    this.isDrawer = true,
    Key? key,
  }) : super(key: key);
  final bool isDrawer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, coreState) {
        return Container(
          color: Colors.blue.shade500.withOpacity(.15),
          width: 250,
          alignment: Alignment.center,
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 32),
                  ...ContentList.pages
                      .map((page) => ListTile(
                            leading: page.icon,
                            selected: context
                                .read<CoreCubit>()
                                .state
                                .visiblePages
                                .contains(ContentList.pages.indexOf(page)),
                            // se
                            // selectedTileColor:
                            //     Theme.of(context).backgroundColor,

                            title: Text(
                              page.title,
                              // style: Theme.of(context).textTheme.bodyText1,
                            ),
                            onTap: () {
                              int targetIndex = ContentList.pages.indexOf(page);
                              int currentIndex = coreState.visiblePages[0];
                              int distance = (targetIndex - currentIndex).abs();
                              context
                                  .read<CoreCubit>()
                                  .state
                                  .itemScrollController!
                                  .scrollTo(
                                      index: targetIndex,
                                      duration: Duration(
                                          milliseconds: 200 * distance + 1),
                                      curve: Curves.linear);
                              if (isDrawer) Navigator.of(context).pop();
                            },
                          ))
                      .toList(),
                ],
              ),
              const Spacer(),
              Wrap(
                  alignment: WrapAlignment.center,
                  children: ContactList.buttonActions),
              const SizedBox(height: 32)
            ],
          ),
        );
      },
    );
  }
}
