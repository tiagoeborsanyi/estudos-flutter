import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_bloc.dart';
import 'package:carros/pages/carro/carros_listview.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarrosPage extends StatefulWidget {
  String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> with AutomaticKeepAliveClientMixin<CarrosPage> {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  final _bloc = CarrosBloc();

  String get tipo => widget.tipo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.fetch(tipo);
  }


  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possivel buscar os carros.");
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(carros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return Future.delayed(Duration(seconds: 3), () {
      return _bloc.fetch(tipo);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }

}
