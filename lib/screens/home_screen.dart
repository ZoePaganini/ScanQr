import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/db_provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:qr_scan/screens/screens.dart';
import 'package:qr_scan/widgets/widgets.dart';

import '../models/scan_model.dart';
import '../providers/ui_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Canviar per a anar canviant entre pantalles
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider = Provider.of<ScanListProvider>(context);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByTipus('geo');
        return MapasScreen();

      case 1:
        scanListProvider.loadScansByTipus('http');
        return DireccionsScreen();

      default:
        scanListProvider.loadScansByTipus('geo');
        return MapasScreen();
    }
  }
}
