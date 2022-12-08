part of '../projects.dart';

class _RepositoryButton extends StatelessWidget {
  final String? repositoryUrl;
  const _RepositoryButton(
    this.repositoryUrl, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
      ),
      onPressed: repositoryUrl == ''
          ? null
          : () async => await launchUrlString(repositoryUrl!),
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(t!.projects_repository_button),
      ),
      icon: const Icon(CarbonIcons.logo_github),
    );
  }
}
