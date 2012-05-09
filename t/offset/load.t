#!/usr/bin/env coffee
require("../proof") 5, ({ tz }) ->
  @equal tz("1945-08-14 18:59:00", "America/Detroit", "%Z"), "UTC", "Detroit not loaded"

  detroit = tz require("../../zones/America")
  @equal detroit("1945-08-14 18:59:00", "America/Detroit", "%Z"), "EWT", "Detroit loaded from America"
  @equal detroit("1916-01-03", "Europe/Vilnius", "%Z"), "UTC", "Vilnius missing from America"

  world = tz require("../../zones"), "America/Detroit"
  @equal world("1945-08-14 18:59:00", "America/Detroit", "%Z"), "EWT", "Detroit loaded from World"
  @equal world("1916-01-03", "Europe/Vilnius", "%Z"), "WMT", "Vilnius loaded from World"
