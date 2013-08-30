#!/bin/bash
# codepage utf8
# script pour supprimer tous les geotags d'un sous dossier de photos
# hurson.gor@orange.fr
# licence GPL v3- feel free to redistribute and modify
# beta_version
# sur debian : # apt-get update && apt-get install libimage-exiftool-perl

# init :
LEDOSSIER=~/test

# lots of things should be done before : backup data, check file and directory names, man exiftool, if -d...
# not done yet. This is really BETA.

# actions
echo "Suppression des géotags dans le dossier "  "$LEDOSSIER"
echo   "-- Suppression des géotags dans  le dossier "  "$LEDOSSIER" > /tmp/geotag_moins.log
find "$LEDOSSIER" -type d | while read SOUSDOSSIER
	do
	# echo "$SOUSDOSSIER"
	for LEFICHIER in "$SOUSDOSSIER"/*.jpg
		do
		echo "	""$LEFICHIER" >> /tmp/geotag_moins.log
   		exiftool -gps:all= "$LEFICHIER" >> /tmp/geotag_moins.log
  		# exiftool -xmp:geotag= "$LEFICHIER"
	done
done
echo
echo "geotags supprimés de toutes les photos du répertoire:" "$LEDOSSIER"
echo
# cat /tmp/geotag_moins.log
