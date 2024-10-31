import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  
    final biodata = <String, String>{};

    MainApp({super.key}){
      biodata['name'] = 'RM Murmer';
      biodata['email'] = 'nazaizul@gmail.com';
      biodata['phone'] = '082328736837';
      biodata['image'] = 'resto.jpg';
      biodata['buka'] = '    12.00 - 00.00';
      biodata['list'] = '''    - Ayam Goreng
    - Nasi Goreng
    - Lalapan dan berbagai sambal ''';
      biodata['addr'] = '     Jl. Raya Desa Lenggerong Kecamatan Bantarbolang';
      biodata['desc'] = '''RM Murmer merupakan rumah makan yang menawarkan masakan nusantara dengan cita rasa lezat dan harga terjangkau. 
      Menyajikan beragam hidangan seperti nasi goreng, ayam goreng, lalapan, serta berbagai pilihan sambal, 
      RM ini berfokus pada konsep sederhana namun memuaskan. Suasana santai dan pelayanan cepat menjadikan RM Murmer pilihan tepat bagi pelanggan yang mencari hidangan berkualitas tanpa harus mengeluarkan biaya besar. ''';
    }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RM Murmer",
      home: Scaffold(
        appBar: AppBar(title: const Text("RM Murmer")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              teksKotak(Colors.black, biodata['name'] ?? ''),
                Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
                SizedBox(height: 10),
                Row(
                  children: [
                  btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent, "mailto: ${biodata['email']}"),
                  btnContact(Icons.phone, Colors.deepPurple, "https://wa.me/${biodata['phone']}"),
                  btnContact(Icons.map_sharp, Colors.green[900],"https://www.google.com/maps/@-6.9913361,109.3791598,3a,75y,262.93h,82.64t/data=!3m7!1e1!3m5!1sTjKQ0FV99nYJ14hJ6f6_jg!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D7.360720707491424%26panoid%3DTjKQ0FV99nYJ14hJ6f6_jg%26yaw%3D262.9320270828686!7i16384!8i8192?coh=205410&entry=ttu&g_ep=EgoyMDI0MTAyNy4wIKXMDSoASAFQAw%3D%3D"),  
                ],
                ),
                SizedBox(height: 10),
                teksKotak(Colors.black38, 'Deskripsi'),
                Text(biodata['desc'] ?? '', style: TextStyle(fontSize: 20)
                ),
                SizedBox(height: 10),
                textAttribute("List Menu", biodata['list'] ?? ''),
                textAttribute("Alamat", biodata['addr'] ?? ''),
                textAttribute("Jam Buka", biodata['buka'] ?? ''),
                SizedBox(height: 10),
                
            ]),
        ),
      ),
    );
  }

  Container teksKotak(Color backgroundColor, String teks) {
    return Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(color: backgroundColor),
              child: Text(
                teks,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                 fontSize: 20,
                  color: Colors.white),
                ), 
              );
  }

  Row textAttribute(String judul, String teks) {
    return Row(children: [
                Container(
                  width: 100,
                  child: Text("- $judul", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                Text(":", style: TextStyle(fontSize: 20)),
                Text(teks, style: TextStyle(fontSize: 20)),
              ],
              );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
                  child: ElevatedButton(onPressed: (){
                    launch(uri);
                  },
                   child: Icon(icon),
                   style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                   )
                   ),
                );
  }
  void launch(String uri) async{
    if(!await launchUrl(Uri.parse(uri))){
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }

}
