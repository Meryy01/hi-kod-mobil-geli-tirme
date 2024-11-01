
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farkında Ol',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showInfoCards = false; // Butona tıklandığında kartların görünmesini sağlar
  String? _selectedCard; // Seçilen kartın başlığı

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Farkında Ol')),
        backgroundColor: Colors.grey[600],
      ),
      body: Center(
        child: _selectedCard != null // Seçilen bir kart var mı?
            ? _buildCardInfo() // Eğer bir kart seçilmişse, bilgi göster
            : _showInfoCards
                ? _buildInfoCards() // Eğer butona tıklanmışsa, kartlar görünsün
                : _buildInitialContent(), // Başlangıçta yazılar ve buton görünsün
      ),
    );
  }

  Widget _buildInitialContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dijital Dünyada Hayatta Kalmak İçin bilgiler mi arıyorsun?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'O zaman butona tıkla!',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showInfoCards = true; // Butona tıklanınca kartlar gösterilsin, yazılar kalksın
            });
          },
          child: Text('Butona Tıkla'),
        ),
      ],
    );
  }

  Widget _buildInfoCards() {
    return ListView( // ListView kullanarak kartların kaymasını sağlıyoruz
      padding: EdgeInsets.all(16.0),
      children: [
        _buildInfoCard('Dijital Farkındalık Nedir?', Icons.info),
        SizedBox(height: 10),
        _buildInfoCard('Dijital Şiddet', Icons.security),
        SizedBox(height: 10),
        _buildInfoCard('Dijital Güvenlik', Icons.lock),
        SizedBox(height: 10),
        _buildInfoCard('Medya Okuryazarlığı', Icons.book),
        SizedBox(height: 10),
        _buildInfoCard('Mağdur Suçlayıcılık', Icons.warning),
        SizedBox(height: 10),
        _buildInfoCard('Nefret Söylemi', Icons.error),
        SizedBox(height: 10),
        _buildInfoCard('Body Shaming', Icons.remove_red_eye),
        SizedBox(height: 10),
        _buildInfoCard('Sanal Linç', Icons.group),
        SizedBox(height: 10),
        _buildInfoCard('Israrlı Takip', Icons.visibility_off),
      ],
    );
  }

  Widget _buildInfoCard(String title, IconData icon) {
    return Card( // Card widget'ını kullanıyoruz
      elevation: 4, // Gölge efekti
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell( // Dokunma algılayıcı
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          setState(() {
            _selectedCard = title; // Seçilen kartın başlığını sakla
          });
        },
        child: Container(
          width: double.infinity, // Kart genişliğini tam ekran yapıyoruz
          height: 100, // Kart yüksekliği
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Geçişli renkler
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(icon, size: 40, color: Colors.white),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardInfo() {
    String cardInfo;

    switch (_selectedCard) {
      case 'Dijital Farkındalık Nedir?':
        cardInfo = 'Dijital farkındalık, bireylerin dijital dünyada güvenli ve etkili bir şekilde nasıl hareket etmeleri gerektiğini anlamalarını ifade eder.';
        break;
      case 'Dijital Şiddet':
        cardInfo = 'Dijital şiddet kısaca teknolojik araçlar ve dijital ortamlar kullanılarak kişiye duygusal, sosyal ve ekonomik yönden zarar vermeyi amaçlayan eylemlerin bütünüdür.';
        break;
      case 'Dijital Güvenlik':
        cardInfo = 'İnternet ve bilgisayarlar programları ile kurulmuş bir ağdaki sağlık bilgileri, banka bilgileri, kişisel veriler, ulaşım ve lokasyon bilgilerinin korunmasında yönelik alınan önlemlerdir.';
        break;
      case 'Medya Okuryazarlığı':
        cardInfo = 'Yaygın kabul gören tanımıyla, çeşitli türden (görsel, işitsel, basılı, vb.) medya mesajlarına erişebilme, erişilen medyaları eleştirel bakış açısıyla çözümleyip değerlendirebilme ve kendi medya iletilerini üretebilme becerisidir.';
        break;
      case 'Mağdur Suçlayıcılık':
        cardInfo = 'Bir suç veya herhangi bir yanlış eylemden mağdurun sorumlu tutulması ve suçlanmasına denir. Mağdura yönelik önyargı ve suçluların eylemlerinden mağdurun sorumlu olduğu algısını oluşturmayı amaçlar.';
        break;
      case 'Nefret Söylemi':
        cardInfo = 'Irk, ulus, dini inanç, cinsel yönelim, etnik yapı vb. nedenleriyle bir grup insanı aşağılamak, korkutmak veya ön yargı oluşturmak amacıyla gerçekleştirilen eylemleri ifade eder.';
        break;
      case 'Body Shaming':
        cardInfo = 'Kişinin fiziksel görünüşü, kilosu, şekli, boyu vb özellikler üzerinden yapılan olumsuz yorumlara verilen addır.';
        break;
      case 'Sanal Linç':
        cardInfo = 'Bir kişinin veya grubun sosyal ağ üzerinden bir insanı toplumsal alanın dışına ittiği modern bir dışlama biçimidir.';
        break;
      case 'Israrlı Takip':
        cardInfo = 'Özel hayatın gizliliğini ihlal eden tehdit, korku, şantaj gibi yollarla kişiyi özgünlüğünden yoksun bırakan bir eylemdir.';
        break;
      default:
        cardInfo = 'Bilgi bulunamadı.';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _selectedCard!,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            cardInfo,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedCard = null; // Geri dönmek için seçili kartı sıfırla
            });
          },
          child: Text('Geri Dön'),
        ),
      ],
    );
  }
}