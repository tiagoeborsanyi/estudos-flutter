import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CachedNetworkImage(
                        imageUrl:
                        c.urlFoto ??
                            "https://www.google.com/imgres?imgurl=https%3A%2F%2Frussiansbrides.com%2Fwp-content%2Fuploads%2F2019%2F06%2FBulgarian-Women-2.jpg&imgrefurl=https%3A%2F%2Frussiansbrides.com%2Fbulgarian-women%2F&docid=RL8LMDbtbe8VjM&tbnid=lReTGAg_D_IAwM%3A&vet=10ahUKEwib8bmoz5DlAhUcK7kGHe0lCBYQMwg_KAEwAQ..i&w=1140&h=641&bih=936&biw=1381&q=women%20bulgarian&ved=0ahUKEwib8bmoz5DlAhUcK7kGHe0lCBYQMwg_KAEwAQ&iact=mrc&uact=8",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome,
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
            );
          }),
    );
  }

  _onClickCarro(context, c) {
    push(context, CarroPage(c));
  }

}
