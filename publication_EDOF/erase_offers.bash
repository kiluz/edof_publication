#!/bin/bash

((nbr=1))

date="2022-07-22"
 
update_headers() {
	node src/offer_publication.js
	bash src/delete_request.bash
}

update_headers
while read p; do
	if ! ((nbr % 1000)); then
		update_headers
	fi
	sed "1 s/trainings.*?/trainings\/$p?/" -i src/archiv_request.bash
	bash src/archiv_request.bash
	echo $p
	((nbr+=1))
done <../logs/id_list.txt
