import 'package:flutter/material.dart';
import 'package:flutter_smooth_marquee/flutter_smooth_marquee.dart';

void main() {
  runApp(const MarqueeShowcaseApp());
}

/// Showcase demo application for flutter_smooth_marquee.
class MarqueeShowcaseApp extends StatelessWidget {
  /// Default constructor.
  const MarqueeShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Smooth Marquee Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF38BDF8),
          brightness: Brightness.dark,
        ),
      ),
      home: const MarqueeShowcaseScreen(),
    );
  }
}

/// Main showcase screen for various marquee configurations.
class MarqueeShowcaseScreen extends StatefulWidget {
  /// Default constructor.
  const MarqueeShowcaseScreen({super.key});

  @override
  State<MarqueeShowcaseScreen> createState() => _MarqueeShowcaseScreenState();
}

class _MarqueeShowcaseScreenState extends State<MarqueeShowcaseScreen> {
  double _velocity = 60.0;
  bool _pauseOnHover = true;
  MarqueeDirection _direction = MarqueeDirection.forward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Smooth Marquee'),
        elevation: 0,
        backgroundColor: const Color(0xFF1E293B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeaderCard(),
                const SizedBox(height: 24),
                _buildSectionTitle(
                    '1. Music Player Track Bar (With Rich Icons)'),
                _buildCard(
                  child: FlutterSmoothMarquee(
                    velocity: _velocity,
                    fadeEdgeWidth: 28.0,
                    pauseOnHover: _pauseOnHover,
                    direction: _direction,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.music_note,
                            color: Color(0xFF38BDF8), size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Queen — Bohemian Rhapsody (Remastered 2011) • A Night at the Opera (Super Deluxe Edition)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 12),
                        Chip(
                          label: Text('LOSSLESS FLAC',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xFF0284C7),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('2. Live Stock Ticker (Rich Data Spans)'),
                _buildCard(
                  child: FlutterSmoothMarquee(
                    velocity: _velocity * 0.8,
                    spacing: 48.0,
                    direction: _direction,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildStockPill('AAPL', '\$228.45', '+1.8%', true),
                        const SizedBox(width: 24),
                        _buildStockPill('NVDA', '\$142.10', '+4.2%', true),
                        const SizedBox(width: 24),
                        _buildStockPill('GOOGL', '\$178.90', '-0.5%', false),
                        const SizedBox(width: 24),
                        _buildStockPill('MSFT', '\$424.30', '+0.9%', true),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle(
                    '3. Smart Overflow Detection (Static vs Scrolling)'),
                _buildCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Short text (fits completely, 0 CPU animation overhead):',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0B1329),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const SmoothMarqueeText(
                          'System Status: All Services Operational ✓',
                          style: TextStyle(
                              color: Color(0xFF4ADE80),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Long text (overflows container, automatically animates):',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0B1329),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const SmoothMarqueeText(
                          'BREAKING: Global high-throughput low-latency network update deployed across all 48 edge zones worldwide with zero downtime.',
                          style: TextStyle(color: Color(0xFFFBBF24)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                _buildControlsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'High-Performance Flutter Marquee',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Zero battery drain on static text. Hardware gradient edge masks. 60/120Hz smooth animation with touch and hover pausing.',
            style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF94A3B8),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: child,
    );
  }

  Widget _buildStockPill(
      String symbol, String price, String change, bool isPositive) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(symbol,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(width: 6),
        Text(price, style: const TextStyle(color: Color(0xFF94A3B8))),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color:
                isPositive ? const Color(0x2222C55E) : const Color(0x22EF4444),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            change,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isPositive
                  ? const Color(0xFF4ADE80)
                  : const Color(0xFFF87171),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControlsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Interactive Tuning',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('Velocity: ${_velocity.round()} px/s',
                  style: const TextStyle(color: Color(0xFF94A3B8))),
              Expanded(
                child: Slider(
                  value: _velocity,
                  min: 20.0,
                  max: 200.0,
                  divisions: 18,
                  onChanged: (val) => setState(() => _velocity = val),
                ),
              ),
            ],
          ),
          SwitchListTile(
            title: const Text('Pause on Hover / Touch',
                style: TextStyle(color: Colors.white, fontSize: 14)),
            value: _pauseOnHover,
            dense: true,
            contentPadding: EdgeInsets.zero,
            onChanged: (val) => setState(() => _pauseOnHover = val),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Scroll Direction',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              SegmentedButton<MarqueeDirection>(
                segments: const [
                  ButtonSegment(
                      value: MarqueeDirection.forward, label: Text('Forward')),
                  ButtonSegment(
                      value: MarqueeDirection.reverse, label: Text('Reverse')),
                ],
                selected: {_direction},
                onSelectionChanged: (set) =>
                    setState(() => _direction = set.first),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
