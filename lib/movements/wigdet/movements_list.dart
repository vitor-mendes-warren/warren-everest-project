import 'package:flutter/material.dart';
import 'package:warren_task_one/movements/wigdet/dolar_value.dart';
import 'package:warren_task_one/movements/wigdet/entry_value.dart';
import 'package:warren_task_one/shared/utils/util.dart';

import '../model/movement_model.dart';

class MovementsList extends StatelessWidget {
  const MovementsList({
    super.key,
    required this.allMovements,
  });

  final List<MovementModel> allMovements;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: allMovements.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color.fromARGB(255, 227, 228, 235),
                width: 2,
              ),
            ),
          ),
          height: size.height * .1,
          child: Padding(
            padding: EdgeInsets.only(right: size.width * .04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          Util.getFormatedOutValue(allMovements[index]),
                          style: TextStyle(
                            fontFamily: "Mansny-light",
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 117, 118, 128),
                            fontSize: size.height * .022,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        allMovements[index].movementDate,
                        style: TextStyle(
                          fontFamily: "Mansny-light",
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 117, 118, 128),
                          fontSize: size.height * .019,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EntryValue(
                        value: Util.getFormatedEntryValue(allMovements[index])),
                    DolarValue(value: allMovements[index].dolarValue),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
