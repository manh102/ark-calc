import 'package:flutter/material.dart';

class HandbooksPage extends StatefulWidget {
  const HandbooksPage({Key? key}) : super(key: key);

  @override
  State<HandbooksPage> createState() => _HandbooksPageState();
}

class _HandbooksPageState extends State<HandbooksPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
