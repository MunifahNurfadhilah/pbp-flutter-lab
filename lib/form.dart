import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/watchlist.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}
class DataBudget {
    String judul;
    int nominal;
    String tipe;
    static List<DataBudget> budgets = [];
    DataBudget(String this.judul, int this.nominal, String this.tipe);
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = '';
  int _nominal = 0;
  String? _tipe;
  List<String> _tipeBudget = ['Pemasukan', 'Pengeluaran'];

  bool _isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ), // Menambahkan drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman data
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
              },
            ),
            ListTile(
              title: const Text('My Watchlist'),
              onTap: () {
                // Route menu ke halaman data
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchList()),
                );
              },
            ),
          ],
        ),
      ),
      body:Form(
        key: _formKey,
         child: SingleChildScrollView(
          child: Container(
           padding: const EdgeInsets.all(20.0),
           child: Column(
            children: [
              // input judul
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                 decoration: InputDecoration(
                   hintText: "Contoh: Beli Sate Pacil",
                   labelText: "Judul",
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    ),
                ),
                onChanged: (String? value) {
                    setState(() {
                    _judul = value!;
                    });
                },
                onSaved: (String? value) {
                    setState(() {
                    _judul = value!;
                    });
                },
                validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                    }
                    return null;
                },
               ),
              ),
              // input nominal
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   hintText: "Contoh: 15000",
                   labelText: "Nominal",
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    ),
                ),
                onChanged: (String? value) {
                    setState(() {
                    if (_isNumeric(value)) {
                        _nominal = int.parse(value!);
                        }
                    });
                },
                onSaved: (String? value) {
                    setState(() {
                    if (_isNumeric(value)) {
                        _nominal = int.parse(value!);
                        }
                    });
                },
                validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                    } else if (!_isNumeric(value)) {
                        return 'Nominal tidak boleh nol!';
                    }
                    return null;
                },
               ),
              ),
              // dropdown tipe budget
              Container(
                //width: width / 4,
                child: ButtonTheme(
                 alignedDropdown: true,
                 child: DropdownButtonFormField(
                   hint: const Text("Pilih Tipe Budget"),
                   value: _tipe,
                   icon: const Icon(Icons.keyboard_arrow_down),
                   items: _tipeBudget.map((String items) {
                    return DropdownMenuItem(
                     value: items,
                     child: Text(items),
                     );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                       _tipe = newValue!;
                     });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan Pilih Jenis!';
                    }
                    return null;
                    },
                  ),
                 ),
                ),
                SizedBox(
                 height: height / 1.9,
                ),
                // button submit
                TextButton(
                 style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DataBudget currentBudget = DataBudget(_judul, _nominal, _tipe!);
                      DataBudget.budgets.add(currentBudget);
                      _formKey.currentState?.reset();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            insetPadding: const EdgeInsets.all(10),
                            elevation: 15,
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: const <Widget>[
                                Center(
                                    child: Text('Budget Berhasil Ditambahkan')),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                child: const Text(
                 "Simpan",
                  style: TextStyle(color: Colors.white),
                ),  
              ),
            ],
           ),
         ),
        ),
      ),
    );
  }
}