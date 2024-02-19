import 'package:fitness_admin/providers/pregled_treninga_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetaljiTreningaScreen extends StatefulWidget {
  const DetaljiTreningaScreen({super.key});

  @override
  State<DetaljiTreningaScreen> createState() => _DetaljiTreningaScreenState();
}

class _DetaljiTreningaScreenState extends State<DetaljiTreningaScreen> {
  late PregledTreningaProvider pregledTreningaProvider;

  @override
  void initState() {
    pregledTreningaProvider = context.read<PregledTreningaProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return Scaffold(
    //   appBar: AppBar(
    //     foregroundColor: Colors.white,
    //     backgroundColor: Colors.blue,
    //     centerTitle: true,
    //     title: const Text(
    //       'Korisnici',
    //     ),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(15),
    //     child: Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             SizedBox(
    //               width: 300,
    //               child: TextFormField(
    //                 style: const TextStyle(
    //                   color: Colors.black,
    //                 ),
    //                 controller: upravljanjeKorisnicimaProvider.search,
    //                 decoration: const InputDecoration(
    //                   fillColor: Colors.white,
    //                   filled: true,
    //                   enabledBorder: OutlineInputBorder(
    //                     borderSide: BorderSide(color: Colors.black, width: 2.0),
    //                   ),
    //                   hintText: "Pretraga",
    //                   hintStyle: TextStyle(color: Colors.grey),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 20,
    //             ),
    //             SizedBox(
    //               width: 300,
    //               child: TextButton(
    //                 onPressed: () => upravljanjeKorisnicimaProvider.searchApi(),
    //                 child: Container(
    //                   height: 50,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: Colors.blue,
    //                   ),
    //                   child: const Center(
    //                       child: Text(
    //                     'Search',
    //                     style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 16.0,
    //                     ),
    //                   )),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 50,
    //         ),
    //         ValueListenableBuilder(
    //           valueListenable: upravljanjeKorisnicimaProvider.listItems,
    //           builder: (context, value, _) {
    //             return Provider<List<UserModel>>.value(
    //               value: value,
    //               child: Expanded(
    //                 child: value.isEmpty
    //                     ? const Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Center(
    //                             child: Text(
    //                               'Nema nijednog zaposlenog',
    //                               style: TextStyle(
    //                                 color: Colors.black,
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: 20,
    //                           ),
    //                         ],
    //                       )
    //                     : ListView.builder(
    //                         itemCount: value.length,
    //                         controller: ScrollController(),
    //                         itemBuilder: (BuildContext context, int index) {
    //                           return GestureDetector(
    //                             onTap: () => upravljanjeKorisnicimaProvider
    //                                 .goToIzmenaKorisnikaScreen(
    //                                     value[index], context),
    //                             child: Card(
    //                               elevation: 5,
    //                               color: Colors.blue,
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(15),
    //                                 child: Row(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceBetween,
    //                                   children: [
    //                                     Text(
    //                                       'Id: ${value[index].korisnikId}',
    //                                       style: const TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 16,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       'Ime: ${value[index].ime}',
    //                                       style: const TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 16,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       'Prezime: ${value[index].prezime}',
    //                                       style: const TextStyle(
    //                                         color: Colors.white,
    //                                         fontSize: 16,
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                           );
    //                         },
    //                       ),
    //               ),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
