import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';

import '../models/scan_model.dart';
import '../providers/db_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () {
        print('Botó polsat!');
        String barcodeScanRes = 'geo:1235631231';
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nouScan(barcodeScanRes);
      },
    );
  }
}
