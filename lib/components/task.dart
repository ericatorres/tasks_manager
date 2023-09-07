import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int multiplicarDificuldade = 10;
  int numeroBarra = 1;
  Color corBarra = Colors.blue;
  Color barraDois = Colors.amber;
  Color? barraTres = Colors.red[200];
  Color barraQuatro = Colors.lightGreen;
  Color? barraCinco = Colors.purple[300];
  Color barraSeis = Colors.pink;
  Color barraSete = Colors.black12;
  Color barraOito = Colors.teal;

  atualizaCorBarra() {
    if (numeroBarra == 2) {
      setState(() {
        corBarra = barraDois;
      });
    } else if (numeroBarra == 3) {
      setState(() {
        corBarra = barraTres!;
      });
    } else if (numeroBarra == 4) {
      setState(() {
        corBarra = barraQuatro;
      });
    } else if (numeroBarra == 5) {
      setState(() {
        corBarra = barraCinco!;
      });
    } else if (numeroBarra == 6) {
      setState(() {
        corBarra = barraSeis;
      });
    } else if (numeroBarra == 7) {
      setState(() {
        corBarra = barraSete;
      });
    } else {
      setState(() {
        corBarra = barraOito;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: corBarra),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[200]),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 20, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.dificuldade),
                      ],
                    ),
                    SizedBox(
                        height: 60,
                        width: 65,
                        child: ElevatedButton(
                          onPressed: () {
                            if (nivel ==
                                widget.dificuldade * multiplicarDificuldade) {
                              setState(() {
                                multiplicarDificuldade =
                                    multiplicarDificuldade * 2;
                              });
                              setState(() {
                                numeroBarra++;
                              });
                              setState(() {
                                nivel = 0;
                              });
                              atualizaCorBarra();
                            } else {
                              setState(() {
                                nivel++;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Transform.scale(
                              scale: 1.5,
                              child: const Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                            const Text(
                              'UP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ]),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel /
                              (multiplicarDificuldade *
                                  (widget.dificuldade > 0
                                      ? widget.dificuldade
                                      : 1)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Nível $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
