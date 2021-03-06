import 'package:flutter/material.dart';
import 'package:Change/App/core/ui/change_ui.dart';
import 'package:Change/App/core/ui/formatter_helper.dart';
import 'package:Change/App/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://dartweek.academiadoflutter.com.br/images${product.image}'), fit: BoxFit.cover),
            )),
            Expanded(
                child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                // Alinhar da esqueda para a direita
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(product.name, style: ChangeUI.textBold),
                  Text(
                    FormatterHelper.formatCurrency(product.price),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
