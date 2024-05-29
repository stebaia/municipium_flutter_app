import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipium/services/network/dto/contact_point_dto.dart';
import 'package:municipium/services/network/dto/pnrr_body_dto.dart';
import 'package:municipium/utils/icons_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class RowContactPoint extends StatelessWidget {
  const RowContactPoint({super.key, this.contactsPoint});

  final List<ContentPnrr>? contactsPoint;

  Widget _buildContactPoints(List<ContentPnrr>? puntiDiContatto) {
    if (puntiDiContatto != null && puntiDiContatto.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: puntiDiContatto.length,
        itemBuilder: (context, index) {
          return Container(
            height: 40,
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit
                      .tight, // Usa 'tight' per consumare tutto lo spazio disponibile
                  child: Row(
                    children: [
                      Icon(PnnrUtils.getIconsFromContactPointPnnr(
                          puntiDiContatto[index].tipo!)),
                      const SizedBox(width: 10),
                      Text(puntiDiContatto[index].label!)
                    ],
                  ),
                ),
                // Usa 'loose' per permettere al widget di occupare solo lo spazio necessario
                Container(
                  width: 200,
                  child: InkWell(
                    child: Text(
                      puntiDiContatto[index].valore!,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      // Assicurati di invocare il metodo correttamente con il parametro
                      final url = PnnrUtils.getUrlFromContactPointPnnr(
                          puntiDiContatto[index].tipo!,
                          puntiDiContatto[index].valore!);
                      if (url != null) {
                        launchUrl(url);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContactPoints(contactsPoint);
  }
}
