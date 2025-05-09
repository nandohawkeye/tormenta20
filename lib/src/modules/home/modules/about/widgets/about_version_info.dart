import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/url_utils.dart';

class AboutVersionInfo extends StatelessWidget {
  const AboutVersionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async =>
          await UrlUtils.lauch('https://github.com/nandohawkeye'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              'Desenvolvido por Nando HawkEye - v${GetIt.I<PackageInfo>().version} - ${DateTime.now().year}',
              maxLines: 2,
              style: TextStyle(
                color: palette.textDisable,
              ),
            ),
          ),
          T20UI.spaceWidth,
        ],
      ),
    );
  }
}
