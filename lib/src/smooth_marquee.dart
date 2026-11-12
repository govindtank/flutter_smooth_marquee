import 'dart:async';
import 'package:flutter/material.dart';

/// Direction in which the marquee content scrolls.
enum MarqueeDirection {
  /// Content moves from right to left (standard reading order).
  forward,

  /// Content moves from left to right.
  reverse,
}

/// A high-performance, smooth marquee widget with automatic overflow detection,
/// hardware gradient edge fading, and interactive pause controls.
///
/// If [autoDetectOverflow] is true and the [child] fits inside the available
/// container width, the marquee will remain completely static with zero animation
/// overhead, preventing unnecessary battery and CPU drain.
class FlutterSmoothMarquee extends StatefulWidget {
  /// Creates a smooth scrolling marquee.
  const FlutterSmoothMarquee({
    super.key,
    required this.child,
    this.velocity = 50.0,
    this.spacing = 40.0,
    this.scrollAxis = Axis.horizontal,
    this.direction = MarqueeDirection.forward,
    this.pauseOnHover = true,
    this.pauseOnTouch = true,
    this.autoDetectOverflow = true,
    this.fadeEdgeWidth = 24.0,
    this.fadeEdgeGradient,
    this.delayBeforeScroll = const Duration(milliseconds: 600),
    this.alignment = Alignment.centerLeft,
  })  : assert(velocity > 0, 'velocity must be greater than zero'),
        assert(spacing >= 0, 'spacing cannot be negative'),
        assert(fadeEdgeWidth >= 0, 'fadeEdgeWidth cannot be negative');

  /// The widget content to be scrolled.
  final Widget child;

  /// Scroll speed measured in logical pixels per second. Defaults to 50.0.
  final double velocity;

  /// Blank spacing between repeated copies of the [child]. Defaults to 40.0.
  final double spacing;

  /// The scroll axis. Defaults to [Axis.horizontal].
  final Axis scrollAxis;

  /// Direction of the marquee animation. Defaults to [MarqueeDirection.forward].
  final MarqueeDirection direction;

  /// Whether the marquee should pause when the user hovers with a pointer.
  final bool pauseOnHover;

  /// Whether the marquee should pause while the user holds their touch down.
  final bool pauseOnTouch;

  /// Whether the marquee should automatically measure itself and only scroll
  /// when the child content actually overflows its container.
  final bool autoDetectOverflow;

  /// Width of the gradient fade mask on the edges in logical pixels.
  /// Set to 0.0 to disable edge fading. Defaults to 24.0.
  final double fadeEdgeWidth;

  /// Custom gradient for edge fading. If null, a standard transparent-to-opaque
  /// alpha mask is applied automatically.
  final Gradient? fadeEdgeGradient;

  /// Delay duration before the animation starts when mounted or unpaused.
  final Duration delayBeforeScroll;

  /// Alignment of the child when content fits and does not overflow.
  final AlignmentGeometry alignment;

  @override
  State<FlutterSmoothMarquee> createState() => _FlutterSmoothMarqueeState();
}

class _FlutterSmoothMarqueeState extends State<FlutterSmoothMarquee>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final GlobalKey _measureKey = GlobalKey();

  double? _childExtent;
  double? _containerExtent;
  bool _isHovered = false;
  bool _isTouched = false;
  bool _isDelaying = false;
  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _scheduleMeasurement();
  }

  @override
  void didUpdateWidget(FlutterSmoothMarquee oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.velocity != widget.velocity ||
        oldWidget.spacing != widget.spacing ||
        oldWidget.direction != widget.direction ||
        oldWidget.scrollAxis != widget.scrollAxis) {
      _updateControllerDuration();
    }
  }

  void _scheduleMeasurement() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _measureChild();
    });
  }

  void _measureChild() {
    final renderBox =
        _measureKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final size = renderBox.size;
      final extent =
          widget.scrollAxis == Axis.horizontal ? size.width : size.height;

      if (_childExtent != extent) {
        setState(() {
          _childExtent = extent;
        });
        _updateControllerDuration();
      }
    }
  }

  void _updateControllerDuration() {
    if (_childExtent == null || _containerExtent == null) return;

    final overflows = _childExtent! > _containerExtent!;
    if (widget.autoDetectOverflow && !overflows) {
      _controller.stop();
      _controller.value = 0.0;
      return;
    }

    final totalDistance = _childExtent! + widget.spacing;
    final seconds = (totalDistance / widget.velocity).clamp(0.1, 3600.0);
    _controller.duration = Duration(
      milliseconds: (seconds * 1000).round(),
    );

    _delayTimer?.cancel();
    if (!_isHovered && !_isTouched && !_isDelaying) {
      if (widget.delayBeforeScroll > Duration.zero &&
          !_controller.isAnimating) {
        _isDelaying = true;
        _delayTimer = Timer(widget.delayBeforeScroll, () {
          if (!mounted) return;
          _isDelaying = false;
          if (!_isHovered && !_isTouched) {
            _controller.repeat();
          }
        });
      } else {
        _controller.repeat();
      }
    }
  }

  void _onHover(bool hovering) {
    if (!widget.pauseOnHover) return;
    _isHovered = hovering;
    _handlePauseResume();
  }

  void _onTouch(bool touching) {
    if (!widget.pauseOnTouch) return;
    _isTouched = touching;
    _handlePauseResume();
  }

  void _handlePauseResume() {
    final shouldPause = _isHovered || _isTouched;
    if (shouldPause) {
      if (_controller.isAnimating) {
        _controller.stop(canceled: false);
      }
    } else {
      if (!_controller.isAnimating && _shouldScroll()) {
        _controller.repeat();
      }
    }
  }

  bool _shouldScroll() {
    if (_childExtent == null || _containerExtent == null) return false;
    if (!widget.autoDetectOverflow) return true;
    return _childExtent! > _containerExtent!;
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  Widget _wrapWithEdgeFade(Widget child, double containerExtent) {
    if (widget.fadeEdgeWidth <= 0 ||
        containerExtent.isInfinite ||
        containerExtent <= widget.fadeEdgeWidth * 2) {
      return child;
    }

    final fadeFraction =
        (widget.fadeEdgeWidth / containerExtent).clamp(0.0, 0.45);

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        if (bounds.width.isInfinite ||
            bounds.height.isInfinite ||
            bounds.width <= 0 ||
            bounds.height <= 0) {
          return const LinearGradient(
            colors: [Colors.black, Colors.black],
          ).createShader(bounds);
        }

        return LinearGradient(
          begin: widget.scrollAxis == Axis.horizontal
              ? Alignment.centerLeft
              : Alignment.topCenter,
          end: widget.scrollAxis == Axis.horizontal
              ? Alignment.centerRight
              : Alignment.bottomCenter,
          stops: [
            0.0,
            fadeFraction,
            1.0 - fadeFraction,
            1.0,
          ],
          colors: const [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final rawExtent = widget.scrollAxis == Axis.horizontal
            ? constraints.maxWidth
            : constraints.maxHeight;

        final currentMax = rawExtent.isInfinite ? 600.0 : rawExtent;

        if (_containerExtent != currentMax) {
          _containerExtent = currentMax;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _updateControllerDuration();
          });
        }

        // If not overflowing, render child in natural single-axis scroll wrapper
        // and measure it via KeyedSubtree. Zero double-render, zero overflow.
        if (!_shouldScroll()) {
          final staticChild = SingleChildScrollView(
            scrollDirection: widget.scrollAxis,
            physics: const NeverScrollableScrollPhysics(),
            child: KeyedSubtree(
              key: _measureKey,
              child: widget.child,
            ),
          );

          return _wrapWithEdgeFade(staticChild, currentMax);
        }

        final unitDistance = (_childExtent ?? 0.0) + widget.spacing;

        final animatedLoop = AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final progress = _controller.value;
            final offsetMagnitude = progress * unitDistance;
            final double offset;
            if (widget.direction == MarqueeDirection.forward) {
              offset = -offsetMagnitude;
            } else {
              offset = offsetMagnitude - unitDistance;
            }

            final translation = widget.scrollAxis == Axis.horizontal
                ? Offset(offset, 0.0)
                : Offset(0.0, offset);

            return Transform.translate(
              offset: translation,
              child: SingleChildScrollView(
                scrollDirection: widget.scrollAxis,
                physics: const NeverScrollableScrollPhysics(),
                child: _buildRepetitiveSequence(unitDistance),
              ),
            );
          },
        );

        Widget content = ClipRect(
          child: _wrapWithEdgeFade(animatedLoop, currentMax),
        );

        if (widget.pauseOnHover) {
          content = MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            child: content,
          );
        }

        if (widget.pauseOnTouch) {
          content = Listener(
            onPointerDown: (_) => _onTouch(true),
            onPointerUp: (_) => _onTouch(false),
            onPointerCancel: (_) => _onTouch(false),
            child: content,
          );
        }

        return content;
      },
    );
  }

  Widget _buildRepetitiveSequence(double unitDistance) {
    final isHorizontal = widget.scrollAxis == Axis.horizontal;
    final space = isHorizontal
        ? SizedBox(width: widget.spacing)
        : SizedBox(height: widget.spacing);

    final safeExtent =
        (_containerExtent != null && !_containerExtent!.isInfinite)
            ? _containerExtent!
            : 600.0;

    final repeatCount =
        ((safeExtent / (unitDistance > 0 ? unitDistance : 300)).ceil() + 2)
            .clamp(2, 40);

    final children = <Widget>[];
    for (int i = 0; i < repeatCount; i++) {
      children.add(widget.child);
      children.add(space);
    }

    return isHorizontal
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: children,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
  }
}
