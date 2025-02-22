#!/bin/bash
hexaKey=$(grep -Eo -m 1 "0[xX][0-9a-fA-F]{15}+" Longvinter/Saved/Logs/Longvinter.log)
hexaKey=${hexaKey: 2}
echo Your Longvinter Server ID is $(( 16#$hexaKey ))