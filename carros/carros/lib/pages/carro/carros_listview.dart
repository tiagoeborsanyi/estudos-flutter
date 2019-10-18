import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
class CarrosListView extends StatelessWidget {
  List<Carro> carros;

  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros != null ? carros.length : 0,
          itemBuilder: (context, index) {
            Carro c = carros[index];

            return Container(
              height: 280,
              child: InkWell(
                onTap: () {
                  _onClickCarro(context, c);
                },
                onLongPress: () {
                  _onLongClickCarro(context, c);
                },
                child: Card(
                  color: Colors.grey[100],
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: _imageListView(c),
                        ),
                        Text(
                          c.nome ?? "ALGUM NOME",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          "Descrição",
                          style: TextStyle(fontSize: 16),
                        ),
                        ButtonTheme.bar(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: Text("Detalhes"),
                                onPressed: () => _onClickCarro(context, c),
                              ),
                              FlatButton(
                                child: Text("Share"),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  _imageListView(Carro c) {
    return c.urlFoto != null
            ? CachedNetworkImage(
                      imageUrl: c.urlFoto,
                      width: 250,
                    )
            : Image.asset("assets/images/carro.jpg", width: 250);
  }

  _onClickCarro(context, c) {
    push(context, CarroPage(c));
  }

  void _onLongClickCarro(BuildContext context, Carro c) {
    showModalBottomSheet(context: context, builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(c.nome, style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold,
            ),),
          ),
          ListTile(
            title: Text("Detalhes"),
            leading: Icon(Icons.directions_car),
            onTap: () {
              pop(context);
              _onClickCarro(context, c);
            },
          ),
          ListTile(
            title: Text("Share"),
            leading: Icon(Icons.share),
            onTap: () {
              pop(context);
              _onClickShare(context, c);
            },
          )
        ],
      );
    });
  }

  void _onClickShare(BuildContext context, Carro c) {
    print("SHARE: ${c.nome}");

    Share.share(c.urlFoto);
  }
}
