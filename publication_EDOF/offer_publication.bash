#!/bin/bash

echo "start TIME: $(date +"%T")"
now=$(date +'%Y-%m-%d')
((nbr=10))

curl "https://api.airtable.com/v0/appgEyjazAEc4xSyN/formations%20EDOF" \
  -H "Authorization: Bearer keyQRkvThqRSWf4Go" > "airtbale_formations_$now.data"

CITY_EL_NBR=`cat city.json | jq length`
FORMATION_EL_NBR=`cat airtbale_formations_$now.data | jq '.records' | jq length`

update_headers() {
	node src/offer_publication.js
	bash src/delete_request.bash
}

publish_offer () {

	# FORMATION_CONTENT=`cat airtbale_formations_$now.data | jq ".records[$i].fields.FORMATION_CONTENT_PRICE_MAX" | sed 's/"//' | sed 's/"$//' | perl -pe 's|"|\\\\"|g' | perl -pe 's|"|\\\\\\\\"|g' | sed "s/'/\\\\\'/g" | sed "s/'/\\\\\'/g" | tr -d "\n"`
	# PRICE=`cat airtbale_formations_$now.data | jq ".records[$i].fields.PRICE" | sed 's/"//' | sed 's/"$//'`
	# LEARNINGTIME='30'
	# ID="$now-$nbr"

	# FIRST_REQU_VAR=`cat src/1_add_offer.bash | sed "s/#ID#/$ID/g" | perl -pe "s|#EXPECT_RES#|$EXPECT_RES|g" | perl -pe "s|#CERTIF_INFO#|$CERTIF_INFO|g" | perl -pe "s|#FORMATION_NAME#|$FORMATION_NAME|g" | perl -pe "s|#FORMATION_OBJ#|$FORMATION_OBJ|g" | perl -pe "s|#FORMATION_CONTENT#|$FORMATION_CONTENT|g" | perl -pe "s|#RESUME_CONTENT#|$RESUME_CONTENT|g" | perl -pe "s|#CERTIFORGANISM#|$CERTIFORGANISM|g" | tr -d "\n"`
	# echo "$FIRST_REQU_VAR" > "$ID.bash"
	# sed -i 's|\\"|\\\\"|g' "$ID.bash"
	# sed -i 's|\\  -|\\\n  -|g' "$ID.bash"
	# bash "$ID.bash"  > "out.data"
	# touch empty.txt
	# diff out.data empty.txt
	# if ! (($?)); then
	# 	update_headers
	# 	bash "$ID.bash"  > "out.data"
	# fi
	# OUT_ID=`cat out.data | jq '.id' | sed 's/"//' | sed 's/"$//' | sed 's/_.*$//g'`
	# rm "$ID.bash" out.data empty.txt

	# SECOND_REQU_VAR=`cat src/2_add_action.bash | sed "s/#ID#/$ID/g" | sed "s/#PRICE#/$PRICE/g" | sed "s/#LEARNINGTIME#/$LEARNINGTIME/g" | perl -pe "s|#CITY#|$CITY|g"`
	# echo "$SECOND_REQU_VAR" > "$ID.bash"
	# bash "$ID.bash"
	# rm "$ID.bash"

	# THIRD_REQU_VAR=`cat src/3_add_session.bash | sed "s/#ID#/$ID/g"`
	# echo "$THIRD_REQU_VAR" > "$ID.bash"
	# bash "$ID.bash"
	# rm "$ID.bash"

	# # FOURTH_REQU_VAR=`cat src/4_open_offer.bash | sed "s/#ID#/$ID/g" | sed "s/#OUT_ID#/$OUT_ID/g"`
	# # echo "$THIRD_REQU_VAR" > "$ID.bash"
	# # # bash "$ID.bash"
	# # rm "$ID.bash"
	# echo $ID >> ../logs/"$now"_id_list.txt
	# ((nbr++))

	FORMATION_CONTENT=`cat airtbale_formations_$now.data | jq ".records[$i].fields.FORMATION_CONTENT_PRICE_MIDDLE" | sed 's/"//' | sed 's/"$//' | perl -pe 's|"|\\\\"|g' | perl -pe 's|"|\\\\\\\\"|g' | sed "s/'/\\\\\'/g" | sed "s/'/\\\\\'/g" | tr -d "\n"`
	PRICE="990"
	LEARNINGTIME='20'
	ID="$now-$nbr"

	FIRST_REQU_VAR=`cat src/1_add_offer.bash | sed "s/#ID#/$ID/g" | perl -pe "s|#EXPECT_RES#|$EXPECT_RES|g" | perl -pe "s|#CERTIF_INFO#|$CERTIF_INFO|g" | perl -pe "s|#FORMATION_NAME#|$FORMATION_NAME|g" | perl -pe "s|#FORMATION_OBJ#|$FORMATION_OBJ|g" | perl -pe "s|#FORMATION_CONTENT#|$FORMATION_CONTENT|g" | perl -pe "s|#RESUME_CONTENT#|$RESUME_CONTENT|g" | perl -pe "s|#CERTIFORGANISM#|$CERTIFORGANISM|g" | tr -d "\n"`
	echo "$FIRST_REQU_VAR" > "$ID.bash"
	sed -i 's|\\"|\\\\"|g' "$ID.bash"
	sed -i 's|\\  -|\\\n  -|g' "$ID.bash"
	bash "$ID.bash" > "out.data"
	touch empty.txt
	diff out.data empty.txt
	if ! (($?)); then
		update_headers
		bash "$ID.bash"  > "out.data"
	fi
	OUT_ID=`cat out.data | jq '.id' | sed 's/"//' | sed 's/"$//' | sed 's/_.*$//g'`
	rm "$ID.bash" out.data empty.txt

	SECOND_REQU_VAR=`cat src/2_add_action.bash | sed "s/#ID#/$ID/g" | sed "s/#PRICE#/$PRICE/g" | sed "s/#LEARNINGTIME#/$LEARNINGTIME/g" | perl -pe "s|#CITY#|$CITY|g"`
	echo "$SECOND_REQU_VAR" > "$ID.bash"
	bash "$ID.bash"
	rm "$ID.bash"

	THIRD_REQU_VAR=`cat src/3_add_session.bash | sed "s/#ID#/$ID/g"`
	echo "$THIRD_REQU_VAR" > "$ID.bash"
	bash "$ID.bash"
	rm "$ID.bash"

	FOURTH_REQU_VAR=`cat src/4_open_offer.bash | sed "s/#ID#/$ID/g" | sed "s/#OUT_ID#/$OUT_ID/g"`
	echo "$FOURTH_REQU_VAR" > "$ID.bash"
	bash "$ID.bash"
	rm "$ID.bash"
	echo $ID >> ../logs/"$now"_id_list.txt
	((nbr++))

	# FORMATION_CONTENT=`cat airtbale_formations_$now.data | jq ".records[$i].fields.FORMATION_CONTENT_PRICE_MIN" | sed 's/"//' | sed 's/"$//' | perl -pe 's|"|\\\\"|g' | perl -pe 's|"|\\\\\\\\"|g' | sed "s/'/\\\\\'/g" | sed "s/'/\\\\\'/g" | tr -d "\n"`
	# PRICE="690"
	# LEARNINGTIME='10'
	# ID="$now-$nbr"

	# FIRST_REQU_VAR=`cat src/1_add_offer.bash | sed "s/#ID#/$ID/g" | perl -pe "s|#EXPECT_RES#|$EXPECT_RES|g" | perl -pe "s|#CERTIF_INFO#|$CERTIF_INFO|g" | perl -pe "s|#FORMATION_NAME#|$FORMATION_NAME|g" | perl -pe "s|#FORMATION_OBJ#|$FORMATION_OBJ|g" | perl -pe "s|#FORMATION_CONTENT#|$FORMATION_CONTENT|g" | perl -pe "s|#RESUME_CONTENT#|$RESUME_CONTENT|g" | perl -pe "s|#CERTIFORGANISM#|$CERTIFORGANISM|g" | tr -d "\n"`
	# echo "$FIRST_REQU_VAR" > "$ID.bash"
	# sed -i 's|\\"|\\\\"|g' "$ID.bash"
	# sed -i 's|\\  -|\\\n  -|g' "$ID.bash"
	# bash "$ID.bash"  > "out.data"
	# touch empty.txt
	# diff out.data empty.txt
	# if ! (($?)); then
	# 	update_headers
	# 	bash "$ID.bash"  > "out.data"
	# fi
	# OUT_ID=`cat out.data | jq '.id' | sed 's/"//' | sed 's/"$//' | sed 's/_.*$//g'`
	# rm "$ID.bash" out.data empty.txt

	# SECOND_REQU_VAR=`cat src/2_add_action.bash | sed "s/#ID#/$ID/g" | sed "s/#PRICE#/$PRICE/g" | sed "s/#LEARNINGTIME#/$LEARNINGTIME/g" | perl -pe "s|#CITY#|$CITY|g"`
	# echo "$SECOND_REQU_VAR" > "$ID.bash"
	# bash "$ID.bash"
	# rm "$ID.bash"

	# THIRD_REQU_VAR=`cat src/3_add_session.bash | sed "s/#ID#/$ID/g"`
	# echo "$THIRD_REQU_VAR" > "$ID.bash"
	# bash "$ID.bash"
	# rm "$ID.bash"

	# # FOURTH_REQU_VAR=`cat src/4_open_offer.bash | sed "s/#ID#/$ID/g" | sed "s/#OUT_ID#/$OUT_ID/g"`
	# # echo "$THIRD_REQU_VAR" > "$ID.bash"
	# # # bash "$ID.bash"
	# # rm "$ID.bash"
	# echo $ID >> ../logs/"$now"_id_list.txt
	# ((nbr++))
}

update_headers
for (( i=0; i<$FORMATION_EL_NBR; i++ ))
do 
	if ! ((nbr % 1000)); then
		update_headers
	fi
	CERTIF_INFO=`cat airtbale_formations_$now.data | jq ".records[$i].fields.CERTIF_INFO" | sed 's/"//' | sed 's/"$//' | tr -d "\n"`
	FORMATION_NAME=`cat airtbale_formations_$now.data | jq ".records[$i].fields.FORMATION_NAME" | sed 's/"//' | sed 's/"$//' | tr -d "\n"`
	FORMATION_OBJ=`cat airtbale_formations_$now.data | jq ".records[$i].fields.FORMATION_OBJ" | sed 's/"//' | sed 's/"$//'| sed "s/'/\\\\\'/g" | perl -pe 's|"|\\\\"|g' | perl -pe 's|"|\\\\"|g' | sed "s/'/\\\\\'/g" | tr -d "\n"`
	RESUME_CONTENT=`cat airtbale_formations_$now.data | jq ".records[$i].fields.RESUME_CONTENT" | sed 's/"//' | sed 's/"$//' | perl -pe 's|"|\\\\"|g' |perl -pe 's|"|\\\\"|g' | sed "s/'/\\\\\'/g" | sed "s/'/\\\\\'/g" | tr -d "\n"`
	CERTIFORGANISM=`cat airtbale_formations_$now.data | jq ".records[$i].fields.CERTIF_ORGA"  | sed 's/" "/""/g' | tr -d "\n" | sed "s/'/\\\\\'/g" | sed "s/'/\\\\\'/g"`
	EXPECT_RES=`cat airtbale_formations_$now.data | jq ".records[$i].fields.RESULTAT_ATTENDU" | sed 's/"//' | sed 's/"$//' | perl -pe 's|"|\\\\"|g' | perl -pe 's|"|\\\\"|g' | sed "s/'/\\\\\'/g"  | sed "s/'/\\\\\'/g" |  tr -d "\n"`
	echo $FORMATION_NAME
	if [ "$FORMATION_NAME" = "Webmarketing" ]; then
		continue
	fi

	for (( j=0; j<$CITY_EL_NBR; j++ ))
	do 
		ID="$now-$nbr"
		CITY=`cat city.json | jq ".[$j]" | jq tostring | sed 's/"//' | sed 's/"$//' | tr -d "\n"`
		publish_offer
	done
done

rm "airtbale_formations_$now.data"
echo "end TIME: $(date +"%T")"