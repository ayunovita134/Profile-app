import 'package:flutter/material.dart';

void main() {
  runApp(StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: StudentProfileScreen(),
    );
  }
}

class StudentProfileScreen extends StatefulWidget {
  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> 
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _showHobbies = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 380,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.5, -1),
                  end: Alignment(0.5, 1),
                  colors: [Color(0xFF667eea), Color(0xFF764ba2), Color(0xFFf093fb), Color(0xFFf5576c)],
                ),
                boxShadow: [BoxShadow(color: Colors.purple.withOpacity(0.3), blurRadius: 30, offset: Offset(0, 15))],
              ),
              child: SafeArea(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [Colors.white.withOpacity(0.4), Colors.white.withOpacity(0.1)]),
                          boxShadow: [
                            BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 40, spreadRadius: 10),
                            BoxShadow(color: Colors.pink.withOpacity(0.3), blurRadius: 20, spreadRadius: 5),
                          ],
                        ),
                        child: Icon(Icons.person, size: 80, color: Colors.white),
                      ),
                      SizedBox(height: 25),
                      Text('Novita Ayu', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 1.2)),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                        ),
                        child: Text('Informatika • Semester 5', 
                                 style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                        ),
                        child: Column(
                          children: [
                            Text('Universitas Mulawarman', 
                                 style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                            SizedBox(height: 4),
                            Text('Fakultas Teknik', 
                                 style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            Transform.translate(
              offset: Offset(0, -30),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _glassCard(Icons.school_outlined, 'NIM', '2309106134', [Color(0xFF11998e), Color(0xFF38ef7d)])),
                        SizedBox(width: 16),
                        Expanded(child: _glassCard(Icons.calendar_today_outlined, 'Angkatan', '2023', [Color(0xFF667eea), Color(0xFF764ba2)])),
                      ],
                    ),
                    
                    SizedBox(height: 30),
                    
                    _section('👤 Informasi Personal', [Color(0xFFff9a9e), Color(0xFFfecfef)], [
                      _infoRow(Icons.email_outlined, 'Novita@gmail.com', Color(0xFFff6b6b)),
                      _infoRow(Icons.phone_outlined, '+62 812-2222-1111', Color(0xFF4ecdc4)),
                      _infoRow(Icons.location_on_outlined, 'Jl. Anggur', Color(0xFFffe66d)),
                      _infoRow(Icons.cake_outlined, '10 Juli 2005', Color(0xFFa8e6cf)),
                    ]),
                    
                    SizedBox(height: 25),
                    
                    _section('🎯 Hobi & Minat', [Color(0xFF667eea), Color(0xFF764ba2)], [
                      GestureDetector(
                        onTap: () => setState(() => _showHobbies = !_showHobbies),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFF667eea).withOpacity(0.1), Color(0xFF764ba2).withOpacity(0.1)]),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xFF667eea).withOpacity(0.3), width: 1.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Lihat Hobi Saya', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF667eea))),
                              Icon(_showHobbies ? Icons.expand_less : Icons.expand_more, color: Color(0xFF667eea)),
                            ],
                          ),
                        ),
                      ),
                      if (_showHobbies) ...[
                        SizedBox(height: 20),
                        Row(children: [
                          Expanded(child: _hobbyCard('🎮 Gaming', 'Mobile Legends, Valorant', Color(0xFF667eea))),
                          SizedBox(width: 12),
                          Expanded(child: _hobbyCard('📸 Photography', 'Landscape, Portrait', Color(0xFF11998e))),
                        ]),
                        SizedBox(height: 12),
                        Row(children: [
                          Expanded(child: _hobbyCard('🎵 Music', 'Pop, Jazz, Indie', Color(0xFFf093fb))),
                          SizedBox(width: 12),
                          Expanded(child: _hobbyCard('📚 Reading', 'Tech, Fiction, Biography', Color(0xFFfa709a))),
                        ]),
                        SizedBox(height: 12),
                        Row(children: [
                          Expanded(child: _hobbyCard('📺 Watching', 'Movies, Series', Color(0xFF43e97b))),
                          SizedBox(width: 12),
                          Expanded(child: _hobbyCard('✈ Traveling', 'City Tour, Nature', Color(0xFF4facfe))),
                        ]),
                      ],
                    ]),
                    
                    SizedBox(height: 25),
                    
                    _section('💭 Motto Hidup', [Color(0xFF11998e), Color(0xFF38ef7d)], [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFF11998e).withOpacity(0.1), Color(0xFF38ef7d).withOpacity(0.1)]),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Color(0xFF11998e).withOpacity(0.3), width: 1.5),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.format_quote, size: 40, color: Color(0xFF11998e)),
                            SizedBox(height: 15),
                            Text('Code with passion, learn with curiosity, and never stop growing.',
                                 textAlign: TextAlign.center,
                                 style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600, color: Colors.grey[800], height: 1.5)),
                            SizedBox(height: 15),
                            Container(width: 50, height: 3, decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF11998e), Color(0xFF38ef7d)]), borderRadius: BorderRadius.circular(2))),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      _mottoItem('🎯 Vision', 'Menjadi software developer yang berdampak positif bagi masyarakat'),
                      SizedBox(height: 10),
                      _mottoItem('⚡ Mission', 'Terus belajar teknologi terbaru dan berbagi ilmu dengan sesama'),
                      SizedBox(height: 10),
                      _mottoItem('💡 Values', 'Integritas, inovasi, dan dedikasi dalam setiap karya'),
                    ]),
                    
                    SizedBox(height: 25),
                    
                    _section('🌐 Media Sosial', [Color(0xFFf093fb), Color(0xFFf5576c)], [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _socialButton(Icons.code, 'GitHub', [Color(0xFF2c3e50), Color(0xFF3498db)]),
                          _socialButton(Icons.work_outline, 'LinkedIn', [Color(0xFF0077b5), Color(0xFF00a0dc)]),
                          _socialButton(Icons.camera_alt_outlined, 'Instagram', [Color(0xFFf09433), Color(0xFFe6683c)]),
                        ],
                      ),
                    ]),
                    
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF667eea), Color(0xFF764ba2)]),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Color(0xFF667eea).withOpacity(0.4), blurRadius: 20, offset: Offset(0, 8))],
        ),
        child: FloatingActionButton(
          onPressed: () {_controller.reset(); _controller.forward();},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Icon(Icons.refresh_rounded, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  Widget _glassCard(IconData icon, String title, String value, List<Color> colors) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white.withOpacity(0.25), Colors.white.withOpacity(0.1)]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: Offset(0, 10))],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(gradient: LinearGradient(colors: colors), shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          SizedBox(height: 15),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w500)),
          SizedBox(height: 5),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.grey[800])),
        ],
      ),
    );
  }

  Widget _section(String title, List<Color> colors, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 25, offset: Offset(0, 15))],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.5)),
          ),
          Padding(padding: EdgeInsets.all(24), child: Column(children: children)),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.2), color.withOpacity(0.1)]), borderRadius: BorderRadius.circular(15)),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: 20),
          Expanded(child: Text(text, style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  Widget _hobbyCard(String title, String desc, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color.withOpacity(0.1), color.withOpacity(0.05)]),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: color)),
          SizedBox(height: 8),
          Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.3)),
        ],
      ),
    );
  }

  Widget _mottoItem(String title, String desc) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.1))),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF11998e))),
                SizedBox(height: 4),
                Text(desc, style: TextStyle(fontSize: 13, color: Colors.grey[700], height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton(IconData icon, String label, List<Color> colors) {
    return GestureDetector(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Membuka $label...'), backgroundColor: colors[0])),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 15, offset: Offset(0, 8))],
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          SizedBox(height: 12),
          Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[700], fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}