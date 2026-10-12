import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveDashboard(),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // 🔥 Proper breakpoint usage
    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1000;
    final bool isDesktop = width >= 1000;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Dashboard"),
      ),

      // 📱 Drawer only for mobile
      drawer: isMobile ? const Drawer(child: Sidebar()) : null,

      body: Row(
        children: [

          // 💻 Sidebar for Tablet & Desktop
          if (isTablet || isDesktop)
            const SizedBox(
              width: 220,
              child: Sidebar(),
            ),

          // 🔷 Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // 🔥 Header section (shows device type)
                  Text(
                    isMobile
                        ? "Mobile View"
                        : isTablet
                        ? "Tablet View"
                        : "Desktop View",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  // 🔷 Responsive Grid
                  Expanded(
                    child: GridView.builder(
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isDesktop
                            ? 4
                            : isTablet
                            ? 2
                            : 1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade400,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "Card ${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListView(
        children: const [
          DrawerHeader(
            child: Text(
              "Menu",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.white),
            title: Text("Dashboard", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text("Profile", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text("Settings", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}


/*
🔷 🔥 What this dashboard includes
📱 Mobile → Drawer + vertical layout
📲 Tablet → Sidebar + 2-column grid
💻 Desktop → Sidebar + 4-column grid
🔄 Fully responsive using breakpoints



🔷 🔥 How it works
✅ MediaQuery (Device Type)

< 600      → Mobile
600 - 1000 → Tablet
> 1000     → Desktop


✅ LayoutBuilder (Grid Layout)

Mobile   → 1 column
Tablet   → 2 columns
Desktop  → 4 columns

MediaQuery → decides device type
LayoutBuilder → decides layout inside screen

*/
