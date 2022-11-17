import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
    @override
    Widget build(BuildContext context) {
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
          ],
        ),
      ),
      body: Center(
       child: ListView.builder(
         itemCount: DataBudget.budgets.length,
         itemBuilder: (BuildContext context, int index) {
          return Card(
          elevation: 3,
          margin: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // Text Judul
             Container(
               padding: const EdgeInsets.only(
                 top: 8, left: 15, right: 15, bottom: 8),
                 child: Text(
                  DataBudget.budgets[index].judul,
                  style: const TextStyle(
                   fontSize: 32,
                    ),
                ),
             ),
             Row(
              children: [
               Container(
                padding: const EdgeInsets.only(
                 top: 8, left: 15, right: 15, bottom: 8),
                 child: Text(
                   DataBudget.budgets[index].nominal.toString(),
                   style: const TextStyle(
                     fontSize: 18,
                    ),
                   ),
                ),
                const Flexible(fit: FlexFit.tight, child: SizedBox()),
                 Container(
                  padding: const EdgeInsets.only(
                   top: 8, left: 15, right: 15, bottom: 8),
                   child: Text(
                    DataBudget.budgets[index].tipe,
                    style: const TextStyle(
                     fontSize: 18,
                    ),
                   ),
                  ),
                 ],
                ),
               ],
             ),
           );
        }),
      ),
    );
  }
}