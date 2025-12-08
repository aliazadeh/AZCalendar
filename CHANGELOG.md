# Changelog

All notable changes to AZCalendar will be documented in this file.

## [2.0.0] - 2024-12-08

### Added
- **Swift Package Manager support** - Now installable via SPM
- **Unit tests** - Comprehensive test coverage for all features
- **`Sendable` conformance** - Thread-safe types for Swift concurrency
- **`Codable` conformance** - DateType can now be encoded/decoded to JSON
- **`CaseIterable` conformance** - All enums support iteration
- **New `DateType` properties**:
  - `isValid` - Validates date components
  - `isoFormat` - Returns date in YYYY/MM/DD format
  - `static zero` - Creates a zero date for error cases
- **New `CalendarType` properties**:
  - `displayName` - Human-readable calendar name
- **New `DayType` properties**:
  - `shortName` - Returns 3-letter day abbreviation
- **New `AZMonthManager` methods**:
  - `getAllMonthNames(for:)` - Returns all month names for a calendar
- **New `AZCalendar` methods**:
  - `getFullDayName(calendar:date:)` - Returns full weekday name
- **Month type properties**:
  - `daysInMonth` - Number of days in each month

### Changed
- **Minimum iOS version** raised to iOS 13.0 (from iOS 9.0)
- **Swift version** updated to Swift 5.9 (from Swift 3.0)
- **Xcode compatibility** updated to Xcode 15.0 (from Xcode 8.3)
- **DateType** changed from `class` to `struct` for better Swift semantics
- **All force unwraps removed** - Replaced with safe optional handling
- **Code modernization**:
  - Modern Swift syntax throughout
  - Removed deprecated APIs (`UIApplicationLaunchOptionsKey`, `didReceiveMemoryWarning`)
  - Updated to `@main` attribute (from `@UIApplicationMain`)
  - Improved code organization with MARK comments
- **Month type names corrected**:
  - Fixed "febuary" typo → "February"
  - Updated Hijri month names to standard transliterations

### Fixed
- **Crash bug** in `ConvertorViewController` - Force unwraps on text field values
- **Thread safety** issues with shared Calendar instances
- **Memory leaks** from unnecessary object allocations
- **Date conversion edge cases** - Now returns `.zero` instead of crashing

### Removed
- **Deprecated Info.plist keys** - Removed `UIRequiredDeviceCapabilities` (armv7)
- **Unnecessary break statements** in switch cases

### Migration Guide

#### From 1.x to 2.0

1. **Update minimum deployment target** to iOS 13.0
2. **Update Xcode** to version 15.0 or later
3. **DateType changes**: 
   - DateType is now a `struct` instead of `class`
   - Value semantics apply (copies instead of references)
4. **All existing API methods remain unchanged** - No code changes required for basic usage

#### Breaking Changes

- `DateType` is now a struct (value type) instead of class (reference type)
- Minimum iOS version is now 13.0
- Hijri month enum cases have been renamed:
  - `moharam` → `muharram`
  - `rabiAval` → `rabiAlAwwal`
  - `rabiSani` → `rabiAlThani`
  - `jamadiAval` → `jamadiAlAwwal`
  - `jamadiSani` → `jamadiAlThani`
  - `ramadhanKarim` → `ramadan`
  - `shoval` → `shawwal`
  - `ziGhade` → `dhuAlQidah`
  - `ziHaje` → `dhuAlHijjah`

## [1.0.0] - 2017-04-14

### Added
- Initial release
- Support for Gregorian, Persian, and Hijri calendars
- Date conversion between all calendar types
- Month and day name utilities
- Sample apps for Swift and Objective-C
