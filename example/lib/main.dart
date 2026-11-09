import 'package:flutter/material.dart';
import 'package:flutter_smooth_marquee/flutter_smooth_marquee.dart';

void main() {
  runApp(const MarqueeStudioApp());
}

/// Showcase studio demo application for flutter_smooth_marquee.
class MarqueeStudioApp extends StatelessWidget {
  /// Default constructor.
  const MarqueeStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Smooth Marquee Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090D16),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00E676),
          brightness: Brightness.dark,
        ),
      ),
      home: const MarqueeStudioScreen(),
    );
  }
}

/// Interactive studio screen with live sandbox tuning and realistic presets.
class MarqueeStudioScreen extends StatefulWidget {
  /// Default constructor.
  const MarqueeStudioScreen({super.key});

  @override
  State<MarqueeStudioScreen> createState() => _MarqueeStudioScreenState();
}

class _MarqueeStudioScreenState extends State<MarqueeStudioScreen> {
  // Sandbox parameters
  String _customText =
      'Experience butter-smooth 120Hz scrolling with zero CPU/GPU waste when content fits inside container bounds.';
  double _sandboxWidth = 420.0;
  double _velocity = 65.0;
  double _spacing = 40.0;
  double _fadeEdgeWidth = 28.0;
  MarqueeDirection _direction = MarqueeDirection.forward;
  Axis _axis = Axis.horizontal;
  bool _pauseOnHover = true;
  bool _pauseOnTouch = true;
  bool _autoDetectOverflow = true;

  // Selected preset tab
  int _selectedPresetIndex = 0;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = _customText;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _applyPreset(int index) {
    setState(() {
      _selectedPresetIndex = index;
      switch (index) {
        case 0: // Music
          _customText =
              'Queen — Bohemian Rhapsody (Remastered 2011) • A Night at the Opera (Super Deluxe Edition)';
          _velocity = 55.0;
          _fadeEdgeWidth = 32.0;
          _spacing = 44.0;
          _direction = MarqueeDirection.forward;
          _axis = Axis.horizontal;
          break;
        case 1: // Financial Stocks
          _customText =
              'BTC/USD \$91,420 (+4.8%)  •  ETH/USD \$3,450 (+2.1%)  •  NVDA \$142.10 (+5.2%)  •  AAPL \$228.45 (+1.4%)  •  TSLA \$260.80 (-0.8%)';
          _velocity = 75.0;
          _fadeEdgeWidth = 24.0;
          _spacing = 50.0;
          _direction = MarqueeDirection.forward;
          _axis = Axis.horizontal;
          break;
        case 2: // Breaking News
          _customText =
              'URGENT: Global high-throughput low-latency network deployed across 64 edge locations worldwide with zero packet loss.';
          _velocity = 60.0;
          _fadeEdgeWidth = 20.0;
          _spacing = 36.0;
          _direction = MarqueeDirection.forward;
          _axis = Axis.horizontal;
          break;
        case 3: // Reverse Sports Ticker
          _customText =
              'Champions League Final: Real Madrid 2 - 1 Manchester City (88\')  •  Bayern Munich 3 - 0 Arsenal (FT)  •  PSG 1 - 1 Inter Milan (74\')';
          _velocity = 65.0;
          _fadeEdgeWidth = 28.0;
          _spacing = 40.0;
          _direction = MarqueeDirection.reverse;
          _axis = Axis.horizontal;
          break;
        case 4: // Vertical Terminal Stream
          _customText =
              '[10:45:02] Deployment commit #719120d healthy\n[10:45:05] SSL Certificate renewed (*.is-a.dev)\n[10:45:09] Cache revalidated across 18 clusters\n[10:45:12] Latency benchmark stable at 1.4ms';
          _velocity = 40.0;
          _fadeEdgeWidth = 20.0;
          _spacing = 24.0;
          _direction = MarqueeDirection.forward;
          _axis = Axis.vertical;
          break;
      }
      _textEditingController.text = _customText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.view_carousel_rounded,
                color: Color(0xFF00E676), size: 24),
            SizedBox(width: 10),
            Text(
              'flutter_smooth_marquee',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF101726),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeroBanner(),
                const SizedBox(height: 28),
                _buildSectionHeader(
                  title: '1. Interactive Live Sandbox Studio',
                  subtitle:
                      'Type any text, adjust width, switch directions, or tune speed in real time.',
                ),
                const SizedBox(height: 12),
                _buildLiveSandboxCard(),
                const SizedBox(height: 28),
                _buildSectionHeader(
                  title: '2. One-Click Real World Presets',
                  subtitle:
                      'Test authentic UI components designed for music players, stock tickers, and news.',
                ),
                const SizedBox(height: 12),
                _buildPresetSelector(),
                const SizedBox(height: 16),
                _buildActivePresetCard(),
                const SizedBox(height: 28),
                _buildSectionHeader(
                  title: '3. Zero-Waste Auto-Overflow Verification',
                  subtitle:
                      'Observe how the engine eliminates CPU animations when text naturally fits.',
                ),
                const SizedBox(height: 12),
                _buildOverflowDemonstrator(),
                const SizedBox(height: 36),
                _buildFooterAttribution(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF141F32), Color(0xFF0C1322)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1E2D4A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0x2200E676),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'HIGH-PERFORMANCE TICKER',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: Color(0xFF00E676),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'v1.0.1 • 160/160 Pts',
                style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Butter-smooth marquee with auto-overflow detection.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Zero CPU/GPU ticker loops when content fits. Hardware gradient edge fading, bi-directional scrolling, touch/hover pausing, and support for any arbitrary rich Flutter widget.',
            style:
                TextStyle(fontSize: 14, color: Color(0xFF94A3B8), height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
      {required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
        ),
      ],
    );
  }

  Widget _buildLiveSandboxCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1F293D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Live Marquee Preview Box
          Center(
            child: Container(
              width: _axis == Axis.horizontal ? _sandboxWidth : 360,
              height: _axis == Axis.vertical ? 120 : 64,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF090D16),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF334155), width: 1.5),
              ),
              child: FlutterSmoothMarquee(
                velocity: _velocity,
                spacing: _spacing,
                fadeEdgeWidth: _fadeEdgeWidth,
                direction: _direction,
                scrollAxis: _axis,
                pauseOnHover: _pauseOnHover,
                pauseOnTouch: _pauseOnTouch,
                autoDetectOverflow: _autoDetectOverflow,
                child: Text(
                  _customText,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Realtime Metrics Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF161F30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.speed, size: 16, color: Color(0xFF38BDF8)),
                    const SizedBox(width: 6),
                    Text(
                      'Speed: ${_velocity.round()} px/s',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.sync_alt,
                        size: 16, color: Color(0xFF00E676)),
                    const SizedBox(width: 6),
                    Text(
                      'Direction: ${_direction == MarqueeDirection.forward ? "Forward (R→L)" : "Reverse (L→R)"}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.crop_free,
                        size: 16, color: Color(0xFFFBBF24)),
                    const SizedBox(width: 6),
                    Text(
                      'Width: ${_sandboxWidth.round()}px',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Text Input Box
          TextField(
            controller: _textEditingController,
            style: const TextStyle(fontSize: 14, color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Edit Live Marquee Text',
              labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
              filled: true,
              fillColor: const Color(0xFF090D16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF334155)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF00E676)),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear, size: 18),
                onPressed: () {
                  _textEditingController.clear();
                  setState(() => _customText = '');
                },
              ),
            ),
            onChanged: (val) => setState(() => _customText = val),
          ),
          const SizedBox(height: 20),

          // Controls Grid
          _buildControlsGrid(),
        ],
      ),
    );
  }

  Widget _buildControlsGrid() {
    return Column(
      children: [
        // Slider: Sandbox Container Width
        Row(
          children: [
            const SizedBox(
              width: 140,
              child: Text(
                'Container Width:',
                style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              ),
            ),
            Expanded(
              child: Slider(
                value: _sandboxWidth,
                min: 160.0,
                max: 760.0,
                divisions: 30,
                activeColor: const Color(0xFF00E676),
                onChanged: (val) => setState(() => _sandboxWidth = val),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                '${_sandboxWidth.round()}px',
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),

        // Slider: Velocity Speed
        Row(
          children: [
            const SizedBox(
              width: 140,
              child: Text(
                'Velocity (px/sec):',
                style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              ),
            ),
            Expanded(
              child: Slider(
                value: _velocity,
                min: 15.0,
                max: 240.0,
                divisions: 15,
                activeColor: const Color(0xFF38BDF8),
                onChanged: (val) => setState(() => _velocity = val),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                '${_velocity.round()}',
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),

        // Slider: Fade Edge Width
        Row(
          children: [
            const SizedBox(
              width: 140,
              child: Text(
                'Gradient Fade Width:',
                style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              ),
            ),
            Expanded(
              child: Slider(
                value: _fadeEdgeWidth,
                min: 0.0,
                max: 60.0,
                divisions: 12,
                activeColor: const Color(0xFFA855F7),
                onChanged: (val) => setState(() => _fadeEdgeWidth = val),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                '${_fadeEdgeWidth.round()}px',
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Direction & Orientation Segmented Buttons
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Scroll Direction',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  const SizedBox(height: 6),
                  SegmentedButton<MarqueeDirection>(
                    segments: const [
                      ButtonSegment(
                          value: MarqueeDirection.forward,
                          label: Text('Forward (R→L)')),
                      ButtonSegment(
                          value: MarqueeDirection.reverse,
                          label: Text('Reverse (L→R)')),
                    ],
                    selected: {_direction},
                    onSelectionChanged: (set) =>
                        setState(() => _direction = set.first),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Scroll Axis',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                  const SizedBox(height: 6),
                  SegmentedButton<Axis>(
                    segments: const [
                      ButtonSegment(
                          value: Axis.horizontal, label: Text('Horizontal')),
                      ButtonSegment(
                          value: Axis.vertical, label: Text('Vertical')),
                    ],
                    selected: {_axis},
                    onSelectionChanged: (set) =>
                        setState(() => _axis = set.first),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Toggles Row
        Wrap(
          spacing: 24,
          runSpacing: 10,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _pauseOnHover,
                  activeTrackColor: const Color(0xFF00E676),
                  onChanged: (v) => setState(() => _pauseOnHover = v),
                ),
                const Text('Pause on Hover',
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _pauseOnTouch,
                  activeTrackColor: const Color(0xFF00E676),
                  onChanged: (v) => setState(() => _pauseOnTouch = v),
                ),
                const Text('Pause on Touch',
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: _autoDetectOverflow,
                  activeTrackColor: const Color(0xFF00E676),
                  onChanged: (v) => setState(() => _autoDetectOverflow = v),
                ),
                const Text('Auto-Detect Overflow',
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPresetSelector() {
    final presets = [
      {'name': 'Music Player', 'icon': Icons.music_note},
      {'name': 'Stock Ticker', 'icon': Icons.trending_up},
      {'name': 'Breaking News', 'icon': Icons.campaign},
      {'name': 'Sports Reverse', 'icon': Icons.sports_soccer},
      {'name': 'Vertical Logs', 'icon': Icons.terminal},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(presets.length, (i) {
          final isSelected = _selectedPresetIndex == i;
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ChoiceChip(
              avatar: Icon(
                presets[i]['icon'] as IconData,
                size: 16,
                color: isSelected ? Colors.black : const Color(0xFF94A3B8),
              ),
              label: Text(presets[i]['name'] as String),
              selected: isSelected,
              selectedColor: const Color(0xFF00E676),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.black : Colors.white,
              ),
              backgroundColor: const Color(0xFF161F30),
              onSelected: (_) => _applyPreset(i),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildActivePresetCard() {
    switch (_selectedPresetIndex) {
      case 0:
        return _buildMusicPlayerPreset();
      case 1:
        return _buildStockTickerPreset();
      case 2:
        return _buildBreakingNewsPreset();
      case 3:
        return _buildSportsScoreboardPreset();
      case 4:
        return _buildVerticalLogPreset();
      default:
        return _buildMusicPlayerPreset();
    }
  }

  Widget _buildMusicPlayerPreset() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1F293D)),
      ),
      child: Row(
        children: [
          // Album Art Cover
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.music_note, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),

          // Marquee Song Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FlutterSmoothMarquee(
                  velocity: 50.0,
                  fadeEdgeWidth: 28.0,
                  child: const Text(
                    'Queen — Bohemian Rhapsody (Remastered 2011) • A Night at the Opera (Super Deluxe Edition)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Text('Queen',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                    SizedBox(width: 8),
                    Text('•', style: TextStyle(color: Color(0xFF475569))),
                    SizedBox(width: 8),
                    Text('1975',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                    SizedBox(width: 12),
                    Text(
                      'HI-RES LOSSLESS',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF38BDF8),
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.play_circle_fill,
                size: 36, color: Color(0xFF00E676)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildStockTickerPreset() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1F293D)),
      ),
      child: FlutterSmoothMarquee(
        velocity: 70.0,
        spacing: 40.0,
        fadeEdgeWidth: 28.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStockChip('BTC', '\$91,420.00', '+4.8%', true),
            const SizedBox(width: 24),
            _buildStockChip('ETH', '\$3,450.50', '+2.1%', true),
            const SizedBox(width: 24),
            _buildStockChip('NVDA', '\$142.10', '+5.2%', true),
            const SizedBox(width: 24),
            _buildStockChip('AAPL', '\$228.45', '+1.4%', true),
            const SizedBox(width: 24),
            _buildStockChip('TSLA', '\$260.80', '-0.8%', false),
            const SizedBox(width: 24),
            _buildStockChip('GOOGL', '\$178.90', '-0.3%', false),
          ],
        ),
      ),
    );
  }

  Widget _buildStockChip(
      String symbol, String price, String change, bool isPositive) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(symbol,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 13)),
        const SizedBox(width: 6),
        Text(price,
            style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color:
                isPositive ? const Color(0x2200E676) : const Color(0x22EF4444),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            change,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isPositive
                  ? const Color(0xFF00E676)
                  : const Color(0xFFF87171),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBreakingNewsPreset() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1014),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF4C1D24)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEF4444),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'LIVE NEWS',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: SmoothMarqueeText(
              'GLOBAL EDGE NETWORK: High-throughput ultra-low-latency CDN deployed across 64 edge zones worldwide with zero packet loss.',
              velocity: 60.0,
              fadeEdgeWidth: 24.0,
              style: TextStyle(
                  color: Color(0xFFFECACA),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSportsScoreboardPreset() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF1F293D)),
      ),
      child: FlutterSmoothMarquee(
        velocity: 65.0,
        direction: MarqueeDirection.reverse,
        fadeEdgeWidth: 28.0,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('UEFA Champions League',
                style: TextStyle(
                    color: Color(0xFFFBBF24), fontWeight: FontWeight.bold)),
            SizedBox(width: 14),
            Text('Real Madrid 2 - 1 Manchester City (88\')',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
            SizedBox(width: 24),
            Text('•', style: TextStyle(color: Color(0xFF475569))),
            SizedBox(width: 24),
            Text('Bayern Munich 3 - 0 Arsenal (FT)',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
            SizedBox(width: 24),
            Text('•', style: TextStyle(color: Color(0xFF475569))),
            SizedBox(width: 24),
            Text('PSG 1 - 1 Inter Milan (74\')',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalLogPreset() {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF090D16),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: FlutterSmoothMarquee(
        scrollAxis: Axis.vertical,
        velocity: 35.0,
        spacing: 20.0,
        fadeEdgeWidth: 20.0,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('[10:45:02] System kernel initialized in 42ms',
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Color(0xFF00E676))),
            SizedBox(height: 6),
            Text('[10:45:05] SSL Certificate renewed (*.is-a.dev)',
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Color(0xFF38BDF8))),
            SizedBox(height: 6),
            Text('[10:45:09] Cache revalidated across 18 edge clusters',
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Color(0xFFE2E8F0))),
            SizedBox(height: 6),
            Text('[10:45:12] Latency benchmark stable at 1.4ms',
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Color(0xFFFBBF24))),
          ],
        ),
      ),
    );
  }

  Widget _buildOverflowDemonstrator() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1F293D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0x2200E676),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text('0% CPU • IDLE',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00E676))),
              ),
              const SizedBox(width: 10),
              const Text('Short Text Fits In Container Width (Static Render):',
                  style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF090D16),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: const SmoothMarqueeText(
              'System Status: All 12 Services Operational ✓',
              style: TextStyle(
                  color: Color(0xFF00E676),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0x22FBBF24),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text('120Hz TICKER ACTIVE',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFBBF24))),
              ),
              const SizedBox(width: 10),
              const Text('Long Text Overflows Container (Hardware Loop):',
                  style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF090D16),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF1E293B)),
            ),
            child: const SmoothMarqueeText(
              'BREAKING: Distributed edge computing clusters synced across North America, Europe, Asia-Pacific, and South America with zero synchronization drift.',
              style: TextStyle(
                  color: Color(0xFFFBBF24),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterAttribution() {
    return const Center(
      child: Column(
        children: [
          Text(
            'Built with ❤️ by Govind Tank',
            style: TextStyle(
                fontSize: 13,
                color: Color(0xFF94A3B8),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Text(
            'Zero external dependencies • Pure Flutter • 160/160 pub points',
            style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }
}
