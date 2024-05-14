// ignore_for_file: prefer_const_constructors

import 'package:fitness_centar_web/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../models/korisnik.dart';
import '../models/search_result.dart';
import '../models/uloga.dart';
import '../providers/korisnik_provider.dart';
import '../providers/uloga_provider.dart';
import 'zaposlenici_screen.dart';

class ZaposleniciDodajUrediScreen extends StatefulWidget {
  final Korisnik? korisnik;
  ZaposleniciDodajUrediScreen({Key? key, this.korisnik}) : super(key: key);

  @override
  State<ZaposleniciDodajUrediScreen> createState() =>
      _ZaposleniciDetaljiScreenState();
}

class _ZaposleniciDetaljiScreenState
    extends State<ZaposleniciDodajUrediScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _initialValue = {};

  late KorisnikProvider _korisnikProvider;
  late UlogaProvider _ulogaProvider;

  SearchResult<Uloga>? ulogaResult;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialValue = {
      'korisnickoIme': widget.korisnik?.korisnickoIme,
      'ime': widget.korisnik?.ime,
      'prezime': widget.korisnik?.prezime,
      'email': widget.korisnik?.email,
      'telefon': widget.korisnik?.telefon,
      'addresa': widget.korisnik?.addresa.toString(),
      'ulogaId': widget.korisnik?.ulogaId.toString(),
      'uloga': widget.korisnik?.uloga,
      'lozinka': widget.korisnik == null ? null : Authorization.password,
      'status': widget.korisnik?.status.toString(),
      'potvrdaLozinke': widget.korisnik == null ? null : Authorization.password,
    };
    _korisnikProvider = context.read<KorisnikProvider>();
    _ulogaProvider = context.read<UlogaProvider>();

    initForm();
  }

  Future initForm() async {
    ulogaResult = await _ulogaProvider.get();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f4f8),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "Dodaj/Uredi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 800,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isLoading ? Container() : _buildForm(),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                _formKey.currentState?.saveAndValidate();

                                var request =
                                    Map.from(_formKey.currentState!.value);

                                if (!_validateKorisnickoIme(
                                    request['korisnickoIme'])) {
                                  _showKorisnickoImeWarning();
                                  return;
                                }

                                if (!_validateIme(request['ime'])) {
                                  _showImeWarning();
                                  return;
                                }
                                if (!_validatePrezime(request['prezime'])) {
                                  _showPrezimeWarning();
                                  return;
                                }
                                if (!_validateTelefon(request['telefon'])) {
                                  _showTelefonWarning();
                                  return;
                                }

                                if (!_validateEmail(request['email'])) {
                                  _showEmailWarning();
                                  return;
                                }
                                if (!_validateLozinkuRegExp(
                                    request['lozinka'])) {
                                  _showLozinkaRegExpWarning();
                                  return;
                                }
                                if (!_validatePasswordAndConfirmPassword(
                                    request['lozinka'],
                                    request['potvrdaLozinke'])) {
                                  _showCompareLozinkeiPotvrduLozinkeWarning();
                                  return;
                                }

                                if (_formKey.currentState?.fields['ulogaId']
                                        ?.value ==
                                    null) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text("Upozorenje"),
                                      content: Text("Uloga je obavezna!"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("OK"),
                                        )
                                      ],
                                    ),
                                  );
                                  return;
                                }
                                if (_formKey.currentState?.fields['status']
                                        ?.value ==
                                    null) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text("Upozorenje"),
                                      content: Text("Status je obavezan!"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("OK"),
                                        )
                                      ],
                                    ),
                                  );
                                  return;
                                }
                                Map korisnik = {
                                  "ime": request['ime'],
                                  "prezime": request['prezime'],
                                  "korisnickoIme": request['korisnickoIme'],
                                  "email": request['email'],
                                  "telefon": request['telefon'],
                                  "password": request['lozinka'],
                                  "passwordPotvrda": request['potvrdaLozinke'],
                                  "ulogaId": int.tryParse(
                                      _formKey.currentState?.value['ulogaId']),
                                  "addresa": request['addresa'],
                                  "status": bool.parse(request['status'],
                                      caseSensitive: false)
                                };
                                try {
                                  Korisnik updatedEmployee;
                                  if (widget.korisnik != null) {
                                    updatedEmployee = (await _korisnikProvider
                                        .updateKorisnika(
                                            korisnik,
                                            widget.korisnik!.korisnikId!,
                                            "uposlenik"));
                                  } else {
                                    updatedEmployee = (await _korisnikProvider
                                        .registar(korisnik, "uposlenik"));
                                  }
                                  KorisnikData.korisnik = null;
                                  _formKey.currentState!.reset();
                                } on Exception catch (e) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Text("Error"),
                                            content: Text(e.toString()),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text("OK"))
                                            ],
                                          ));
                                }
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ZaposleniciScreen(),
                                ));
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 46, 92, 232)),
                              ),
                              child: Text(
                                "Sačuvaj",
                                style: TextStyle(color: Colors.white),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 46, 92, 232)),
                              ),
                              child: Text(
                                "Nazad",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FormBuilder _buildForm() {
    return FormBuilder(
        key: _formKey,
        initialValue: _initialValue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                            labelText: "Ime", hintText: "Unesite ime"),
                        name: "ime",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                            labelText: "Prezime", hintText: "Unesite prezime"),
                        name: "prezime",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        readOnly: widget.korisnik != null ? true : false,
                        decoration: InputDecoration(
                            labelText: "Korisničko ime",
                            hintText: "Unesite korisničko ime"),
                        name: "korisnickoIme",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                            labelText: "Email", hintText: "Unesite email"),
                        name: "email",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                            labelText: "Telefon", hintText: "Unesite email"),
                        name: "telefon",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                            labelText: "Adresa", hintText: "Unesite adresu"),
                        name: "addresa",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Lozinka", hintText: "Unesite password"),
                        name: "lozinka",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Potvrda lozinke",
                            hintText: "Unesite kopotvrdu passworda"),
                        name: "potvrdaLozinke",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Izaberite ulogu",
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Expanded(
                        child: FormBuilderDropdown<String>(
                      name: 'ulogaId',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            widget.korisnik == null ? 'Please Select' : 'Uloga',
                      ),
                      items: ulogaResult?.result
                              .map((item) => DropdownMenuItem(
                                    alignment: AlignmentDirectional.topStart,
                                    value: item.ulogaId.toString(),
                                    child: Text(item.naziv ?? ""),
                                  ))
                              .toList() ??
                          [],
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Izaberite status",
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Expanded(
                        child: FormBuilderDropdown<String>(
                      name: 'status',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: widget.korisnik == null
                            ? 'Please Select'
                            : 'Status',
                      ),
                      items: const [
                        DropdownMenuItem(
                          alignment: AlignmentDirectional.topStart,
                          value: 'true',
                          child: Text('true'),
                        ),
                        DropdownMenuItem(
                          alignment: AlignmentDirectional.topStart,
                          value: 'false',
                          child: Text('false'),
                        )
                      ],
                    )),
                  ],
                ),
              ]),
        ));
  }

  bool _validateKorisnickoIme(String? korisnickoIme) {
    return korisnickoIme != null &&
        korisnickoIme.isNotEmpty &&
        korisnickoIme.length >= 4;
  }

  bool _validateIme(String? ime) {
    return ime != null && ime.isNotEmpty && ime.length >= 2;
  }

  bool _validatePrezime(String? prezime) {
    return prezime != null && prezime.isNotEmpty && prezime.length >= 2;
  }

  bool _validateEmail(String? email) {
    return email != null && email.isNotEmpty;
  }

  bool _validateTelefon(String? telefon) {
    if (telefon == null ||
        telefon.isEmpty ||
        telefon.length < 8 ||
        telefon.length > 11) {
      return false;
    }
    try {
      int.parse(telefon);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool _validateLozinkuRegExp(String? lozinka) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$');
    return lozinka != null && regex.hasMatch(lozinka);
  }

  bool _validatePasswordAndConfirmPassword(
      String? lozinka, String? potvrdaLozinke) {
    return (lozinka != null && potvrdaLozinke != null) &&
        lozinka == potvrdaLozinke;
  }

  void _showKorisnickoImeWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text(
            "Korisničko ime je obavezno i mora imati minimalno 4 karaktera!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showImeWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text("Ime je obavezno i mora imati minimalno 2 karaktera!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showPrezimeWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content:
            Text("Prezime je obavezno i mora imati minimalno 2 karaktera!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showTelefonWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content:
            Text("Broj telefona je obavezan, mora imati tacno 8 karaktera"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showEmailWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text("Email je obavezan!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showCompareLozinkeiPotvrduLozinkeWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text(
            "Lozinka i potvrda lozinke se ne podudaraju. Molimo unesite iste vrijednosti u oba polja."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showLozinkaRegExpWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Upozorenje"),
        content: Text(
            "Lozinka je obavezna, treba sadrzavati minimalno 4 karaktera,  veliko i malo slovo, broj i specijalan karakter "),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
