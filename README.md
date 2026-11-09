# flutter_smooth_marquee

[![Pub Version](https://img.shields.io/pub/v/flutter_smooth_marquee)](https://pub.dev/packages/flutter_smooth_marquee)
[![Pub Points](https://img.shields.io/pub/points/flutter_smooth_marquee)](https://pub.dev/packages/flutter_smooth_marquee/score)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Donate-orange.svg)](https://buymeacoffee.com/govindtanko)
[![GitHub Sponsors](https://img.shields.io/badge/GitHub-Sponsor-ff69b4.svg)](https://github.com/sponsors/govindtank)

A performance-first marquee and auto-scrolling ticker for Flutter. Features smart overflow detection to eliminate CPU and battery waste when text fits inside container bounds, hardware gradient edge fading, and interactive touch/hover controls.

---

## ✨ Features

- **🧠 Zero-Waste Auto-Overflow Detection:** Automatically measures child bounds. If the content fits within the available width, it renders as a static widget with **zero CPU/GPU ticker loops**.
- **🧩 Arbitrary Widget Support:** Scroll rich layouts, stock ticker cards, music track items with equalizer icons, and badges—not just plain strings.
- **🎨 Hardware Alpha Gradient Edge Fading:** Built-in `ShaderMask` gradient edge feathering eliminates harsh text cutoffs at container borders.
- **⚡ 60 / 120Hz ProMotion Sync:** Driven by `SingleTickerProviderStateMixin` and linear interpolation without timer skips.
- **👆 Interactive Pause & Hover:** Automatically pauses when a user hovers with a mouse or holds a touch, resuming smoothly with inertia.
- **🔄 Bi-directional:** Support for both left-to-right (`forward`) and right-to-left (`reverse`) marquee flows.
- **📦 Zero External Dependencies:** Pure Flutter widget layer. Full compatibility across Android, iOS, Web, macOS, Windows, and Linux.

---

## 🚀 Getting Started

Add `flutter_smooth_marquee` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_smooth_marquee: ^1.0.0
```

Import the package:

```dart
import 'package:flutter_smooth_marquee/flutter_smooth_marquee.dart';
```

---

## 💡 Usage

### 1. Simple Typography Marquee (`SmoothMarqueeText`)

Drop it in anywhere you would normally use a `Text` widget. If the text fits on screen, it stays completely static. If it overflows, it scrolls smoothly:

```dart
SmoothMarqueeText(
  'Now Playing: Bohemian Rhapsody — Queen (Super Deluxe Remaster)',
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  velocity: 60.0,
  fadeEdgeWidth: 24.0,
)
```

### 2. Rich Widget Marquee (`FlutterSmoothMarquee`)

Wrap complex layouts, badges, and icon buttons:

```dart
FlutterSmoothMarquee(
  velocity: 45.0,
  spacing: 36.0,
  fadeEdgeWidth: 32.0,
  pauseOnHover: true,
  pauseOnTouch: true,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.trending_up, color: Colors.green),
      SizedBox(width: 8),
      Text('NVDA \$142.10 (+4.2%)'),
      SizedBox(width: 16),
      Icon(Icons.trending_up, color: Colors.green),
      SizedBox(width: 8),
      Text('AAPL \$228.45 (+1.8%)'),
    ],
  ),
)
```

---

## ⚙️ Configuration

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `child` | `Widget` | *required* | The widget content to scroll. |
| `velocity` | `double` | `50.0` | Scroll speed in logical pixels per second. |
| `spacing` | `double` | `40.0` | Blank distance between loop repetitions. |
| `autoDetectOverflow` | `bool` | `true` | When true, renders static if content fits within container. |
| `fadeEdgeWidth` | `double` | `24.0` | Width in pixels of the alpha gradient fade at edges. |
| `pauseOnHover` | `bool` | `true` | Pauses scrolling when mouse enters the widget bounds. |
| `pauseOnTouch` | `bool` | `true` | Pauses scrolling while touch pointer is held down. |
| `direction` | `MarqueeDirection` | `.forward` | `.forward` (right-to-left) or `.reverse` (left-to-right). |
| `delayBeforeScroll` | `Duration` | `600ms` | Initial delay before starting the scrolling animation. |

---

## 🧪 Testing

Run package tests:

```bash
flutter test
```

---

## 📄 License

Licensed under the [Apache 2.0 License](LICENSE).
