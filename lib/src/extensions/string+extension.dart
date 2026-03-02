// ------------------------------------------------------------ //
//  string_extensions.dart
//
//  Created by Siva Sankar on 2025-11-12.
// ------------------------------------------------------------ //

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// UI-focused extensions on [String].
///
/// These helpers are designed to improve readability and reduce
/// boilerplate when working with text in user interfaces.
///
/// This extension intentionally avoids business logic and keeps
/// behavior predictable for public usage.
extension DString on String {
  // ---------------------------------------------------------------------------
  // Basic checks
  // ---------------------------------------------------------------------------

  /// Returns `true` if the string is empty or contains only whitespace.
  bool get isBlank => trim().isEmpty;

  /// Returns `true` if the string contains non-whitespace characters.
  bool get isNotBlank => !isBlank;

  // ---------------------------------------------------------------------------
  // Safe display helpers
  // ---------------------------------------------------------------------------

  /// Returns a safe, displayable version of the string.
  ///
  /// If the string is blank, [fallback] is returned instead.
  ///
  /// Useful for UI labels, titles, and placeholders.
  String display({String fallback = '—'}) {
    return isBlank ? fallback : this;
  }

  /// Returns the string truncated to [maxLength] characters.
  ///
  /// Adds an ellipsis (`…`) if truncation occurs.
  String truncate(int maxLength, {String ellipsis = '…'}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength) + ellipsis;
  }

  // ---------------------------------------------------------------------------
  // Capitalization helpers
  // ---------------------------------------------------------------------------

  /// Capitalizes the first letter of the string.
  ///
  /// Example:
  /// `'hello world'.capitalize()` → `Hello world`
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Converts the string to title case.
  ///
  /// Example:
  /// `'hello world'.titleCase()` → `Hello World`
  String titleCase() {
    return split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word.capitalize())
        .join(' ');
  }

  // ---------------------------------------------------------------------------
  // UI formatting helpers
  // ---------------------------------------------------------------------------

  /// Inserts a line break after every [wordsPerLine] words.
  ///
  /// Useful for dynamic titles or hero text.
  String wrapWords(int wordsPerLine) {
    if (wordsPerLine <= 0) return this;

    final words = split(' ');
    final buffer = StringBuffer();

    for (int i = 0; i < words.length; i++) {
      buffer.write(words[i]);
      if ((i + 1) % wordsPerLine == 0 && i != words.length - 1) {
        buffer.write('\n');
      } else if (i != words.length - 1) {
        buffer.write(' ');
      }
    }

    return buffer.toString();
  }

  /// Adds a prefix only if the string is not blank.
  ///
  /// Example:
  /// `'John'.withPrefix('@')` → `@John`
  String withPrefix(String prefix) {
    if (isBlank) return this;
    return '$prefix$this';
  }

  /// Adds a suffix only if the string is not blank.
  ///
  /// Example:
  /// `'10'.withSuffix(' km')` → `10 km`
  String withSuffix(String suffix) {
    if (isBlank) return this;
    return '$this$suffix';
  }

  // ---------------------------------------------------------------------------
  // Widget helpers (UI sugar)
  // ---------------------------------------------------------------------------

  /// Converts the string into a [Text] widget.
  ///
  /// This is intended for quick UI usage and prototyping.
  ///
  /// Example:
  /// ```dart
  /// 'Hello'.text(style: TextStyle(fontSize: 18))
  /// ```
  Text text({
    TextStyle? style,
    TextAlign? align,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      this,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

extension DTimestamp on String {
  // ---------------------------------------------------------------------------
  // Parsing
  // ---------------------------------------------------------------------------

  /// Attempts to parse the string into a [DateTime].
  ///
  /// Supports:
  /// - ISO 8601 strings
  /// - Epoch milliseconds (as string)
  ///
  /// Returns `null` if parsing fails.
  DateTime? toDate() {
    if (trim().isEmpty) return null;

    // Try ISO first
    try {
      return DateTime.parse(this);
    } catch (_) {}

    // Try epoch milliseconds
    final epoch = int.tryParse(this);
    if (epoch != null) {
      return DateTime.fromMillisecondsSinceEpoch(epoch);
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // Formatting
  // ---------------------------------------------------------------------------

  /// Formats the timestamp as a date.
  ///
  /// Default format: `dd MMM yyyy`
  ///
  /// Example:
  /// `2025-03-02` → `02 Mar 2025`
  String formatDate({String pattern = 'dd MMM yyyy'}) {
    final date = toDate();
    if (date == null) return this;
    return DateFormat(pattern).format(date);
  }

  /// Formats the timestamp as time.
  ///
  /// Default format: `hh:mm a`
  ///
  /// Example:
  /// `2025-03-02T07:30:00` → `07:30 AM`
  String formatTime({String pattern = 'hh:mm a'}) {
    final date = toDate();
    if (date == null) return this;
    return DateFormat(pattern).format(date);
  }

  /// Formats the timestamp as date and time.
  ///
  /// Default format: `dd MMM yyyy, hh:mm a`
  String formatDateTime({
    String pattern = 'dd MMM yyyy, hh:mm a',
  }) {
    final date = toDate();
    if (date == null) return this;
    return DateFormat(pattern).format(date);
  }

  // ---------------------------------------------------------------------------
  // Relative time
  // ---------------------------------------------------------------------------

  /// Returns a human-readable relative time string.
  ///
  /// Example:
  /// - `5 minutes ago`
  /// - `2 days ago`
  /// - `Just now`
  String timeAgo() {
    final date = toDate();
    if (date == null) return this;

    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 10) {
      return 'Just now';
    } else if (difference.inMinutes < 1) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months months ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years years ago';
    }
  }
}
