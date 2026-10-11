HAI 1.2
CAN HAS STDIO?

OBTW
  SEGWAY NAVIGASHUN SYSTEM
  STEM BILDING TO TEH DEANZ OFFIS

  HOW IT WERKS
  Teh Arduino cant run LOLCODE directly, so this program is teh brain.
  It runs on a laptop or Pi with lci and prints simple commands to stdout,
  one per line. Pipe stdout into teh Arduino serial port. A small sketch on
  teh Arduino reads each line and drives teh motors.

    TURN <degrees>       rotate in place, positive is clockwise
    DRIVE <ticks>        roll forward that many wheel encoder ticks
    MOTOR 0 0            stop both motors
    ESTOP                emergency stop, cut power

  Teh route is a pretend campus adventure. No actual dean was navigated to.
  STEM BILDING, then QUAD, then ADMIN HALL, then TEH DEANZ OFFIS.
TLDR

BTW shortest turn from wun heading to anuther, result is -180 to 180
HOW IZ I TURNIN YR frum AN YR too
  I HAS A d ITZ DIFF OF too AN frum
  DIFFRINT d AN SMALLR OF d AN 180, O RLY?
    YA RLY, d R DIFF OF d AN 360
  OIC
  DIFFRINT d AN BIGGR OF d AN -180, O RLY?
    YA RLY, d R SUM OF d AN 360
  OIC
  FOUND YR d
IF U SAY SO

BTW fake sonar, distance in cm. sumthin wanders in teh way at meter 7
BTW on a real build, ask teh Arduino for an ultrasonic reading instead
HOW IZ I SNIFF YR meter
  BOTH SAEM meter AN 7, O RLY?
    YA RLY, FOUND YR 30
  OIC
  FOUND YR 300
IF U SAY SO

BTW fake tilt sensor in degrees. real build reads teh IMU
HOW IZ I WOBBLE YR meter
  FOUND YR 3
IF U SAY SO

BTW drive wun leg of teh route, gives back teh new heading
HOW IZ I ROLL YR naem AN YR heading AN YR meterz AN YR curr
  I HAS A TICKZ_PER_METER ITZ 120
  I HAS A TOO_CLOSE ITZ 50
  I HAS A MAX_TILT ITZ 15

  VISIBLE SMOOSH "BTW LEG " AN naem MKAY
  I HAS A turn ITZ I IZ TURNIN YR curr AN YR heading MKAY
  DIFFRINT turn AN 0, O RLY?
    YA RLY, VISIBLE SMOOSH "TURN " AN turn MKAY
  OIC

  IM IN YR rollin UPPIN YR m TIL BOTH SAEM m AN meterz
    I HAS A dist ITZ I IZ SNIFF YR m MKAY
    IM IN YR waitin
      BOTH SAEM dist AN BIGGR OF dist AN TOO_CLOSE, O RLY?
        YA RLY, GTFO
      OIC
      VISIBLE "MOTOR 0 0"
      VISIBLE SMOOSH "BTW OH NOES, SUMTHIN " AN dist AN " CM AHED. WAITIN." MKAY
      dist R SUM OF dist AN 100
    IM OUTTA YR waitin

    I HAS A tilt ITZ I IZ WOBBLE YR m MKAY
    DIFFRINT tilt AN SMALLR OF tilt AN MAX_TILT, O RLY?
      YA RLY
        VISIBLE "ESTOP"
        VISIBLE "BTW 2 MUCH WOBBLE. I STOPPD."
        FOUND YR -1
    OIC

    VISIBLE SMOOSH "DRIVE " AN TICKZ_PER_METER MKAY
  IM OUTTA YR rollin

  VISIBLE "MOTOR 0 0"
  FOUND YR heading
IF U SAY SO

BTW TEH ROUTE. heading in degrees, 0 is north. distances in meters
I HAS A heading ITZ 0

heading R I IZ ROLL YR "1 STEM BILDING 2 QUAD" AN YR 270 AN YR 40 AN YR heading MKAY
BOTH SAEM heading AN -1, O RLY?
  YA RLY, VISIBLE "BTW ABORTD ON LEG 1"
  NO WAI
    heading R I IZ ROLL YR "2 QUAD 2 ADMIN HALL" AN YR 0 AN YR 120 AN YR heading MKAY
    BOTH SAEM heading AN -1, O RLY?
      YA RLY, VISIBLE "BTW ABORTD ON LEG 2"
      NO WAI
        heading R I IZ ROLL YR "3 ADMIN HALL 2 DEANZ OFFIS" AN YR 90 AN YR 25 AN YR heading MKAY
        BOTH SAEM heading AN -1, O RLY?
          YA RLY, VISIBLE "BTW ABORTD ON LEG 3"
          NO WAI, VISIBLE "BTW I HAS ARRIVD. OH HAI DEAN. KTHX."
        OIC
    OIC
OIC

KTHXBYE
