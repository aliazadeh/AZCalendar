# AZCalendar

[![Swift 5.9](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![iOS 13.0+](https://img.shields.io/badge/iOS-13.0+-blue.svg)](https://developer.apple.com/ios/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

AZCalendar is a lightweight, modern Swift framework for iOS that provides support for **Gregorian**, **Persian (Solar Hijri)**, and **Hijri (Islamic)** calendars. Convert dates between any of these calendar systems with ease.

![Calendar Demo](https://user-images.githubusercontent.com/16123809/222925284-7a7b753b-eacc-4d62-b90b-de8ca2fc9a4b.png)
![Converter Demo](https://user-images.githubusercontent.com/16123809/222925305-b9a056db-0c67-475e-8b99-ee95684f0865.png)

## Requirements

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+
- Swift 5.9+
- Xcode 15.0+

## Installation

### Swift Package Manager (Recommended)

Add AZCalendar to your project using Swift Package Manager:

1. In Xcode, go to **File → Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/aliazadeh/AZCalendar
   ```
3. Select the version you want to use and click **Add Package**

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/aliazadeh/AZCalendar", from: "2.0.0")
]
```

### Manual Installation

Copy the files from the `Sources/AZCalendar` directory into your project.

## Usage

### Import the Library

```swift
import AZCalendar
```

### Getting Today's Date

```swift
// Get current date in different calendars
let gregorianDate = AZCalendar.getCurrentGregorianDate()
let persianDate = AZCalendar.getCurrentPersianDate()
let hijriDate = AZCalendar.getCurrentHijriDate()

// Access date components
print("Gregorian: \(gregorianDate.day)/\(gregorianDate.month)/\(gregorianDate.year)")
print("Persian: \(persianDate.day)/\(persianDate.month)/\(persianDate.year)")
print("Hijri: \(hijriDate.day)/\(hijriDate.month)/\(hijriDate.year)")
```

### Converting Dates

```swift
// Convert Persian date to Gregorian
let persianDate = DateType(day: 5, month: 8, year: 1395)
let gregorianDate = AZCalendar.convertDate(
    inputType: .persian,
    inputDate: persianDate,
    outputType: .gregorian
)
// Result: day = 26, month = 10, year = 2016

// Convert Gregorian to Hijri
let source = DateType(day: 25, month: 12, year: 2024)
let hijriDate = AZCalendar.convertDate(
    inputType: .gregorian,
    inputDate: source,
    outputType: .hijri
)
```

### Getting Month Names

```swift
let date = AZCalendar.getCurrentPersianDate()
let monthName = AZCalendar.getMonthName(calendar: .persian, date: date)
// Returns: "Azar", "Mehr", etc.

// Get all month names for a calendar
let persianMonths = AZMonthManager.getAllMonthNames(for: .persian)
// Returns: ["Farvardin", "Ordibehesht", ..., "Esfand"]
```

### Getting Day of Week

```swift
let date = AZCalendar.getCurrentGregorianDate()

// Get day index (0 = Sunday, 6 = Saturday)
let dayIndex = AZCalendar.getDayIndex(date: date, calendar: .gregorian)

// Get short day name (e.g., "Mon", "Tue")
let shortName = AZCalendar.getDayName(calendar: .gregorian, date: date)

// Get full day name (e.g., "Monday", "Tuesday")
let fullName = AZCalendar.getFullDayName(calendar: .gregorian, date: date)
```

### Working with DateType

```swift
// Create a date
let date = DateType(day: 15, month: 6, year: 2024)

// Check if valid
if date.isValid {
    print("Date is valid")
}

// Get formatted strings
print(date.description)  // "15/6/2024"
print(date.isoFormat)    // "2024/06/15"

// DateType is Codable
let encoder = JSONEncoder()
let data = try encoder.encode(date)
```

## Calendar Types

| Type | Description | Example Year |
|------|-------------|--------------|
| `.gregorian` | Western/International calendar | 2024 |
| `.persian` | Solar Hijri (Iranian) calendar | 1403 |
| `.hijri` | Islamic (Lunar) calendar | 1446 |

## API Reference

### AZCalendar

| Method | Description |
|--------|-------------|
| `getCurrentGregorianDate()` | Returns current Gregorian date |
| `getCurrentPersianDate()` | Returns current Persian date |
| `getCurrentHijriDate()` | Returns current Hijri date |
| `convertDate(inputType:inputDate:outputType:)` | Converts date between calendars |
| `getDayIndex(date:calendar:)` | Returns day of week (0-6) |
| `getDayName(calendar:date:)` | Returns short day name |
| `getFullDayName(calendar:date:)` | Returns full day name |
| `getMonthName(calendar:date:)` | Returns month name |

### DateType

| Property/Method | Description |
|-----------------|-------------|
| `day`, `month`, `year` | Date components |
| `isValid` | Returns true if date is valid |
| `description` | Returns "day/month/year" format |
| `isoFormat` | Returns "year/month/day" format |
| `static zero` | Returns a zero date (0/0/0) |

### Month Types

Each calendar has its own month type enum:
- `AZGregorianMonthType` - January through December
- `AZPersianMonthType` - Farvardin through Esfand
- `AZHijriMonthType` - Muharram through Dhu al-Hijjah

## Sample Apps

The repository includes two sample applications:
- **SwiftSample**: A Swift-based iOS app demonstrating all features
- **OBJCSample**: An Objective-C iOS app for legacy support

## Backward Compatibility

AZCalendar 2.0 maintains API compatibility with version 1.x while adding new features:
- All existing method signatures work unchanged
- New `DateType` struct can be used interchangeably with the old class
- Additional utility methods and properties are available

## License

AZCalendar is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## Author

**Ali Azadeh** - [GitHub](https://github.com/aliazadeh)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
