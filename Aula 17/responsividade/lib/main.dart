import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicação responsiva com breakpoint",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MeuLayoutResponsivo(),
    );
  }
}

class MeuLayoutResponsivo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App responsiva")),
      body: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth <= 576 ? MobileLayout() : WebLayout();
      }),
    );
  }
}

class MobileLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MobileLayoutState();
  }
}

class MobileLayoutState extends State<MobileLayout>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext) {
    return Column(
      children: [
        TabBar(
            labelColor: Colors.black,
            controller: tabController,
            tabs: [Tab(text: "Aba 1"), Tab(text: "Aba 2")]),
        Expanded(
            child: TabBarView(
          controller: tabController,
          children: [
            Center(child: Text("Esse é o conteúdo da primeira aba.")),
            Center(child: Text("Esse é o conteúdo da segunda aba."))
          ],
        ))
      ],
    );
  }
}

class WebLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebLayoutState();
  }
}

class WebLayoutState extends State<WebLayout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Card(
                child:
                    Center(child: Text("Esse é o conteúdo da primeira aba.")))),
        Expanded(
            child: Card(
                child:
                    Center(child: Text("Esse é o conteúdo da segunda aba."))))
      ],
    );
  }
}
