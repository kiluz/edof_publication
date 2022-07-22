const puppeteer = require('puppeteer');
var fs = require("fs");

let offer_id;

function sleep(delay) {
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay);
}

function	update_file(file_name, headers)
{
	var text = fs.readFileSync(file_name);

	text = text.toString().replace(/Bearer.*'/, headers.authorization + "'");
	text = text.toString().replace(/Cookie: .*'/, "Cookie: " + headers.cookie + "'");
	text = text.toString().replace(/X-ICDC-DGEFP-TOKEN: .*'/, "X-ICDC-DGEFP-TOKEN: " + headers["x-icdc-dgefp-token"] + "'");
	text = text.toString().replace(/X-RequestID: .*'/, "X-RequestID: " + headers["x-requestid"] + "'");
	text = text.toString().replace(/X-SessionID: .*'/, "X-SessionID: " + headers["x-sessionid"] + "'");
	fs.writeFile(file_name, text, function (err) {
		if (err) throw err;
		// console.log('Replaced!');
	});
}

function	update_file_del_req(file_name, headers)
{
	var text = fs.readFileSync(file_name);

	text = text.toString().replace(/Bearer.*'/, headers.authorization + "'");
	text = text.toString().replace(/Cookie: .*'/, "Cookie: " + headers.cookie + "'");
	text = text.toString().replace(/X-ICDC-DGEFP-TOKEN: .*'/, "X-ICDC-DGEFP-TOKEN: " + headers["x-icdc-dgefp-token"] + "'");
	text = text.toString().replace(/X-RequestID: .*'/, "X-RequestID: " + headers["x-requestid"] + "'");
	text = text.toString().replace(/X-SessionID: .*'/, "X-SessionID: " + headers["x-sessionid"] + "'");
	text = text.toString().replace(/trainings.*'/, "trainings/" + offer_id + "'");
	fs.writeFile(file_name, text, function (err) {
		if (err) throw err;
	});
}

async function update_header() {

	const browser = await puppeteer.launch({headless: false});
	const page = await browser.newPage();
	page.setDefaultTimeout(40000)
	await page.goto('https://mesdemarches.emploi.gouv.fr/identification/login?service=https%3A%2F%2Fmesdemarches.emploi.gouv.fr%2Fidentification%2Foauth2.0%2FcallbackAuthorize%3Fclient_id%3Dprod-edof%26redirect_uri%3Dhttps%253A%252F%252Fwww.of.moncompteformation.gouv.fr%252Fidp%252Fedof%252Fcallback%26response_type%3Dcode%26client_name%3DCasOAuthClient');	
	
	await page.type('#username', "contact@kiluz.com")
	await page.type('#password', "azdzadazdaz554rf*Po")
	
	await page.click('#fm1 > div.line-eventual-delegation > div > div > div.connect-button > button');
	try {
		await page.waitForSelector('body > div.services-app > div > div > div:nth-child(5) > div > div:nth-child(1) > div > form:nth-child(2) > fieldset > div > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div.hiddenBlock');
	} catch {}
	await page.click('body > div.services-app > div > div > div:nth-child(5) > div > div:nth-child(1) > div > form:nth-child(2) > fieldset > div > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > div.hiddenBlock');

	try {
		await page.waitForSelector('#cdk-overlay-0 > mat-bottom-sheet-container > mcf-cm-banner > div.mcf-bottom-sheet-actions > button:nth-child(1) > span.mat-button-wrapper');
	} catch {}
	await sleep(1000);
	await page.click('#cdk-overlay-0 > mat-bottom-sheet-container > mcf-cm-banner > div.mcf-bottom-sheet-actions > button:nth-child(1) > span.mat-button-wrapper');

	try {
		await page.waitForSelector('#landing-task-section-id > div.landing__section__content > a');
	} catch {}
	await sleep(1000);
	await page.click('#landing-task-section-id > div.landing__section__content > a');

	try {
		await page.waitForSelector('body > sl7-app > sl7-home > div > sl7-navigation > perfect-scrollbar > div > div.ps-content > nav > sl7-navigation-link:nth-child(6) > button');
	} catch {}

	await page.goto("https://www.of.moncompteformation.gouv.fr/espace-prive/html/#/catalogue/nouvelle-formation/page1")
	try {
		await page.waitForSelector('body > sl7-app > sl7-add-training > main > div.row.footer--pusher > div > sl7-add-training-page1 > section > div > sl7-step-init-form > form > fieldset > sl7-form-field-wrapper > div > ul > li:nth-child(1) > label');
	} catch {}
	await sleep(1000);
	await page.click('body > sl7-app > sl7-add-training > main > div.row.footer--pusher > div > sl7-add-training-page1 > section > div > sl7-step-init-form > form > fieldset > sl7-form-field-wrapper > div > ul > li:nth-child(1) > label');


	await sleep(1000);
	await page.click('#training-selection-fieldset > sl7-form-field-wrapper:nth-child(2) > div > ul > li:nth-child(4) > label > span');

	await sleep(1000);
	await page.click('#training-selection-fieldset > sl7-form-field-wrapper:nth-child(3) > div > div > div.grid__column.training-code--container.column--6');


	await sleep(1000);
	await page.keyboard.type("104083");

	try {
		await page.waitForSelector('#addtraining-checkcode');
	} catch {}
	await sleep(1000);
	await page.click('#addtraining-checkcode');
	await sleep(2000);
	try {
		await page.waitForSelector('#addtraining-step1');
	} catch {}
	await sleep(1000);
	await page.click('#addtraining-step1');

	await sleep(1000);
	try {
		await page.waitForSelector('body > sl7-app > sl7-add-training > main > div.row.footer--pusher > div > sl7-add-training-page2 > div > section > sl7-step-details-form > form > fieldset.clearBoth.ng-star-inserted > sl7-form-field-wrapper > div > div.grid__row > div.grid__column.column--9');
	} catch {}

	await page.click('body > sl7-app > sl7-add-training > main > div.row.footer--pusher > div > sl7-add-training-page2 > div > section > sl7-step-details-form > form > fieldset.clearBoth.ng-star-inserted > sl7-form-field-wrapper > div > div.grid__row > div.grid__column.column--9');
	await sleep(1000);	

	let nbr_id = 100000
	while (1)
	{
		await page.keyboard.type(nbr_id.toString());
		try {
			await page.waitForSelector('#training-checkinternid');
			offer_id = nbr_id.toString();
			await sleep(1000);	
			await page.click('#training-checkinternid');
			await page.waitForSelector('#training-checkinternid');
			await sleep(4000);
			await page.type('[class="width--full form-control ng-untouched ng-pristine ng-valid"]', "NOM DE FORMATION");//Formation name
			await sleep(1000);			
			break ;
		}
		catch {
			await page.keyboard.down('Shift')
			await page.keyboard.press('Tab')
			await page.keyboard.up('Shift')
			for (let i = 0; i < 10; i++)
				await page.keyboard.press('Backspace');
		}
		nbr_id++;
	}	
	await page.click('[class="form-control ng-untouched ng-pristine ng-valid"]');

	await sleep(1000);	
	await page.keyboard.press('ArrowDown');
	await sleep(200);	
	await page.keyboard.press('ArrowDown');
	await sleep(200);	
	await page.keyboard.press('ArrowDown');
	await sleep(200);	
	await page.keyboard.press('ArrowDown');
	await sleep(200);
	await page.keyboard.press('Enter');
	
	await sleep(1000);
	let elHandleArray = await page.$$('[class="add-training__textarea form-control ng-untouched ng-pristine ng-valid"]');
	await sleep(200);
	await elHandleArray[0].type("TEST TEST TEST TEST");
	await sleep(200);
	await elHandleArray[1].type("TEST TEST TEST TEST");
	await sleep(200);
	await elHandleArray[2].type("TEST TEST TEST TEST");
	await sleep(200);
	await elHandleArray[3].type("TEST TEST TEST TEST"); 

	await sleep(1000);
	await page.click('[class="form-control ng-untouched ng-pristine ng-valid"]');
	await sleep(1000);
	await page.keyboard.press('ArrowDown');
	await sleep(200);
	await page.keyboard.press('Enter');


	await page.setRequestInterception(true);
	page.on('request', (request) => {
		if (request.url()== "https://www.of.moncompteformation.gouv.fr/edof-api/v1/api/private/trainings?wantedStatus=VALIDATED")
		{
			update_file_del_req("delete_request.bash", request.headers());
			update_file("1_add_offer.bash", request.headers());
			update_file("2_add_action.bash", request.headers());
			update_file("3_add_session.bash", request.headers());
			update_file("4_open_offer.bash", request.headers());
			update_file("archiv_request.bash", request.headers());
			
		}
		request.continue()
	})
	
	
	await page.waitForSelector('body > sl7-app > sl7-add-training > main > div.row.footer--pusher > div > sl7-add-training-page2 > div > section > div > button.button--primary.button--form.margin--medium-left');
	await sleep(1000);
	await page.click('body > sl7-app > sl7-add-training > main > div.row.footer--pusher > div > sl7-add-training-page2 > div > section > div > button.button--primary.button--form.margin--medium-left');
	await sleep(6000);
	  /////////////////////////////////////
	await browser.close();
}

update_header()
