curl 'https://www.of.moncompteformation.gouv.fr/edof-api/v1/api/private/trainings/#ID#/actions/01/sessions?wantedStatus=VALIDATED' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Authorization: Bearer wpP9J1r5f6tA71OuD3JDifFNQRHJtaBzSq031D3O21ftQTD73q0J4i' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'Cookie: mcf_cookie_consent_MATOMO=1; mcf_cookie_consent_AT_INTERNET=1; atuserid=%7B%22name%22%3A%22atuserid%22%2C%22val%22%3A%22a10379b8-b75b-46b0-baf7-602e4bce7372%22%2C%22options%22%3A%7B%22end%22%3A%222023-08-23T12%3A22%3A50.754Z%22%2C%22path%22%3A%22%2F%22%7D%7D; atidvisitor=%7B%22name%22%3A%22atidvisitor%22%2C%22val%22%3A%7B%22vrn%22%3A%22-554395-%22%7D%2C%22options%22%3A%7B%22path%22%3A%22%2F%22%2C%22session%22%3A15724800%2C%22end%22%3A15724800%7D%7D' \
  -H 'Current-Siret: 85133705500020' \
  -H 'Origin: https://www.of.moncompteformation.gouv.fr' \
  -H 'Referer: https://www.of.moncompteformation.gouv.fr/espace-prive/html/' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36' \
  -H 'X-ICDC-DGEFP-TOKEN: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTg1MDIxNzIsImlhdCI6MTY1ODQ5MjU3MiwiaXNzIjoidXJuOmNkYzpzb2NsZTpjb21tdW46aWRwIiwiYXVkIjoiMTk0NTc1MjYtZTA3Mi00ZTJjLWJjOTItZjA0MjdkNDM5YTgxIiwianRpIjoiNmI4MDAyN2UtMjEyZi00NzFlLTgzY2QtOWJkM2IzYTFmM2FiIiwidXJuOmNkYzpjbGFpbXM6dXNlcjpkb21haW5lIjoiQ1BGIiwiYXRfaGFzaCI6Im13ZzNGSzBDMTFkSVROcFpMZlBTN1EiLCJzdWIiOiJjb250YWN0QGtpbHV6LmNvbSIsInVybjpjZGM6Y2xhaW1zOmFwcGxpY2F0aW9uRW52IjoiWCIsInN0YXRlIjoiOUdlSG1Mbk0zVUhmTjdrd2pLOHV4RC1RT2hRNDhQUXhEYk54ckVaLVloblBwIiwibm9uY2UiOiI5R2VIbUxuTTNVSGZON2t3aks4dXhELVFPaFE0OFBReERiTnhyRVotWWhuUHAiLCJhdF9oYXNoX2ljZGMiOiJtd2czRkswQzExZElUTnBaTGZQUzdRIn0.9oxYlYop1UyUqOWSu7c4ks3mcVe18bRxSXOz5khVKs4' \
  -H 'X-ICDC-ORIGINE: SL7' \
  -H 'X-RequestID: dfb58dca-3025-6d41-dffb-31b6b72a5f16' \
  -H 'X-SessionID: ea49f3da-f46e-ba75-535c-46f60eada3f7' \
  -H 'sec-ch-ua: "/Not)A;Brand";v="24", "Chromium";v="104"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw '{"shortId":"01","guaranteed":true,"beginDate":null,"endDate":null,"subscriptionAddress":{"id":823059,"idAddress":"Bureaux Castelnau-le-lez","number":"1","corporateName":"Kiluz","residence":null,"postBox":" ","roadType":"PL","roadTypeLabel":"Place","roadName":"Pierre Mendès France","additionalAddress":null,"zipCode":"34170","city":"CASTELNAU LE LEZ","country":"FRANCE","countryCode":"FR","repetitionIndex":null,"repetitionIndexLabel":null,"reducedMobilityAccessModalities":null,"reducedMobilityAccessCompliant":true,"trainingSite":true,"informationSite":true,"subscriptionSite":true,"fullAddress":"1 Place Pierre Mendès France 34170 CASTELNAU LE LEZ"},"subscriptionContact":{"id":189585,"civility":null,"firstname":null,"lastname":null,"job":null,"homePhoneNumber":"0411934101","phoneNumber":"","email":"hello@kiluz.com","url":"https://kiluz.com/wordpress-a-a-z","trainingContact":true,"informationContact":true,"subscriptionContact":true}}' \
  --compressed

