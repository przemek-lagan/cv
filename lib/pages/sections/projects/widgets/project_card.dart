part of '../projects.dart';

class _ProjectCard extends StatelessWidget {
  final String title;
  final String? badge;
  final String? repositoryUrl;
  final String? appUrl;
  final Widget? child;
  const _ProjectCard(
    this.title, {
    this.badge,
    this.repositoryUrl,
    // ignore: unused_element
    this.appUrl,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.startTitle,
                ),
                if (child != null) ...[
                  const SizedBox(height: 16),
                  child!,
                ],
                if (repositoryUrl != null || appUrl != null)
                  const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (repositoryUrl != null)
                      _RepositoryButton(repositoryUrl!),
                    if (repositoryUrl != null && appUrl != null)
                      const SizedBox(width: 16),
                    if (appUrl != null) _AppButton(appUrl!),
                  ],
                )
              ],
            ),
            if (badge != null)
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/badges/$badge.png',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
