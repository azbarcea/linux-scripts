#!/bin/bash

# tested with Debian (all), RH(all)
find /usr/share/nano/ -iname "*.nanorc" -exec echo include {} \; >> ~/.nanorc
