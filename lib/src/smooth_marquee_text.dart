import 'package:flutter/material.dart';
import 'smooth_marquee.dart';

/// A convenience widget that displays text and automatically animates as a
/// smooth marquee only when the text length overflows its container.
///
/// If the text fits within the given constraints, it behaves like a standard
/// high-performance [Text] widget with zero animation overhead.
class SmoothMarqueeText extends StatelessWidget {
  /// Creates a text marquee that automatically detects overflow.
  const SmoothMarqueeText(
    this.text, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textScaleFactor,
    this.velocity = 50.0,
    this.spacing = 32.0,
    this.fadeEdgeWidth = 20.0,
    this.pauseOnHover = true,
    this.pauseOnTouch = true,
    this.delayBeforeScroll = const Duration(milliseconds: 500),
    this.direction = MarqueeDirection.forward,
  });

  /// The text to display.
  final String text;

  /// The text styling to apply.
  final TextStyle? style;

  /// Strut style for typography line spacing.
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can be rendered
  /// differently, depending on the locale.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// Deprecated text scale factor.
  final double? textScaleFactor;

  /// Scroll speed in logical pixels per second. Defaults to 50.0.
  final double velocity;

  /// Spacing between consecutive repetitions of the text. Defaults to 32.0.
  final double spacing;

  /// Width of the gradient edge fade in logical pixels. Defaults to 20.0.
  final double fadeEdgeWidth;

  /// Whether to pause when hovered with a mouse pointer. Defaults to true.
  final bool pauseOnHover;

  /// Whether to pause while touch is held. Defaults to true.
  final bool pauseOnTouch;

  /// Initial delay before the scrolling starts. Defaults to 500ms.
  final Duration delayBeforeScroll;

  /// Scrolling direction. Defaults to [MarqueeDirection.forward].
  final MarqueeDirection direction;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.visible,
    );

    return FlutterSmoothMarquee(
      velocity: velocity,
      spacing: spacing,
      fadeEdgeWidth: fadeEdgeWidth,
      pauseOnHover: pauseOnHover,
      pauseOnTouch: pauseOnTouch,
      delayBeforeScroll: delayBeforeScroll,
      direction: direction,
      child: textWidget,
    );
  }
}
