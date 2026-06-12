import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

class PortfolioAnalytics {
  const PortfolioAnalytics._();

  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  static Future<void> logPortfolioVisit() {
    return _logEvent(
      'portfolio_visit',
      parameters: {
        'platform': defaultTargetPlatform.name,
        if (kIsWeb) 'page_location': html.window.location.href,
        if (kIsWeb) 'page_referrer': html.document.referrer,
      },
    );
  }

  static Future<void> logSectionOpen(String sectionName) {
    return _logEvent(
      'section_open',
      parameters: {
        'section_name': sectionName,
      },
    );
  }

  static Future<void> logCvDownload() {
    return _logEvent(
      'cv_download',
      parameters: {
        'file_name': 'Waheed-Ashraf-cv.pdf',
      },
    );
  }

  static Future<void> logWhatsAppClick() {
    return _logEvent('whatsapp_click');
  }

  static Future<void> logSocialLinkClick({
    required String platform,
    required String url,
  }) {
    return _logEvent(
      'social_link_click',
      parameters: {
        'platform_name': platform,
        'url': url,
      },
    );
  }

  static Future<void> logProjectLinkClick({
    required String projectName,
    required String linkType,
    required String url,
  }) {
    return _logEvent(
      'project_link_click',
      parameters: {
        'project_name': projectName,
        'link_type': linkType,
        'url': url,
      },
    );
  }

  static Future<void> logGithubAchievementClick({
    required String achievementName,
    required String url,
  }) {
    return _logEvent(
      'github_achievement_click',
      parameters: {
        'achievement_name': achievementName,
        'url': url,
      },
    );
  }

  static Future<void> logMenuOpen() {
    return _logEvent('mobile_menu_open');
  }

  static Future<void> _logEvent(
    String name, {
    Map<String, Object?> parameters = const {},
  }) async {
    try {
      final sanitized = <String, Object>{};

      for (final entry in parameters.entries) {
        final value = entry.value;
        if (value == null) continue;

        sanitized[entry.key] = value is String ? _truncate(value) : value;
      }

      await _analytics.logEvent(
        name: name,
        parameters: sanitized,
      );
    } catch (_) {
      // Analytics should never block portfolio interactions.
    }
  }

  static String _truncate(String value) {
    const maxLength = 100;
    if (value.length <= maxLength) return value;
    return value.substring(0, maxLength);
  }
}
