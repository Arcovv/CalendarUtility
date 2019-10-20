# CalendarUtility

🗓 CalendarUtility is a Foundation.Calendar tool. You can use it to create your own calendar App internal logic.

## How to use

```swift
let startDate = createDate(year: 2019, month: 01, day: 01)
let endDate = createDate(year: 2019, month: 12, day: 31)
let engine = CalendarEngine(startDate: startDate, endDate: endDate)

engine.run()
engine.prettyPrint()
```

Then you can see the result in console:

```
JANUARY
      01 02 03 04 05
06 07 08 09 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31
==================
FEBRUARY
               01 02
03 04 05 06 07 08 09
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28
==================
MARCH
               01 02
03 04 05 06 07 08 09
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
==================
APRIL
   01 02 03 04 05 06
07 08 09 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30
==================
MAY
         01 02 03 04
05 06 07 08 09 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31
==================
JUNE
                  01
02 03 04 05 06 07 08
09 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30
==================
JULY
   01 02 03 04 05 06
07 08 09 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31
==================
AUGUST
            01 02 03
04 05 06 07 08 09 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31
==================
SEPTEMBER
01 02 03 04 05 06 07
08 09 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30
==================
OCTOBER
      01 02 03 04 05
06 07 08 09 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31
==================
NOVEMBER
               01 02
03 04 05 06 07 08 09
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
==================
DECEMBER
01 02 03 04 05 06 07
08 09 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
==================
```

## Relation Object

### CalendarEngine

The core engine to gernerate calendar components ([DateContext] and [MonthContext]).

### DateContext

A simple helper to get some date info by combine `Date` with `DateComponenets`.

### DateContextGenerator

A DateContext generator to generate `[DateContext]` by `startDate` and `endDate`.

### MonthInfo

Some month info container (like month name, weeks count in a month).

### MonthInfoGenerator

A `MonthInfo` generator to to generate `[MonthInfo]` with `startDate`.

### MonthContext

A container with `MonthInfo` and weeks info (`ArraySlice<ArraySlice<DateContext>>`).


## How to install

### Swift Package Manager

Just clone the git url and add to your xcode project.

Or in your `Package.swift` add these code:

```
...
dependencies: [
  .package(url: URL(string: https://github.com/Arcovv/CalendarUtility)!, from: "0.0.1")
]
...

```
