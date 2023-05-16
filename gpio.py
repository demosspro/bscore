#!/usr/bin/python
import gpiod
import sys
import time
import os
chip = gpiod.chip(0)
gplFn = chip.get_line(10)
gpl1 = chip.get_line(46)
gpl2 = chip.get_line(45)
gpl3 = chip.get_line(44)
gpl4 = chip.get_line(43)
config = gpiod.line_request()
config.request_type = gpiod.line_request.DIRECTION_INPUT
gplFn.request(config)
gpl1.request(config)
gpl2.request(config)
gpl3.request(config)
gpl4.request(config)
flagFn_1 = -1
flagFn_2 = -1
while True:
    valFn = gplFn.get_value()
    val1 = gpl1.get_value()
    val2 = gpl2.get_value()
    val3 = gpl3.get_value()
    val4 = gpl4.get_value()
    if valFn == 0:
        flagFn_1 =1
    if valFn ==1 and flagFn_1==1:
        flagFn_2 =1
    if flag1 ==1 and flagFn_2 ==1:
        print('1')
        flagFn_1 = 0
        flagFn_2 = 0
    time.sleep(0.05)