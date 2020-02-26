set -e
wget --compression=auto -O aircraft.json https://raw.githubusercontent.com/Mictronics/readsb/master/webapp/src/db/aircrafts.json

rm -f db/*
cp airport-coords.json db/airport-coords.js
cp icao_aircraft_types.json db/icao_aircraft_types.js
./toJson.py aircraft.json db
gzip -9 -k db/*.js -f
git add db
