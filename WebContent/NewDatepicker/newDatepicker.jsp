
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Hotel Datepicker - A pure Javascript date range picker for hotels</title>
	<meta name="viewport" content="width=device-width, minimum-scale=1.0">
	<meta name="description" content="A pure Javascript date range picker standalone plugin for hotels or booking websites. Free and released under MIT license."/>

	<meta property="og:locale" content="en_US" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="Hotel Datepicker - A pure Javascript date range picker for hotels" />
	<meta property="og:description" content="A pure Javascript date range picker standalone plugin for hotels or booking websites. Free and released under MIT license." />
	<meta property="og:url" content="http://lopezb.com/hoteldatepicker/" />
	<meta property="og:site_name" content="Hotel Datepicker" />
	<meta property="og:image" content="http://static.lopezb.com/hoteldatepicker/datepicker_card.png" />
	<meta name="twitter:card" content="summary_large_image"/>
	<meta name="twitter:description" content="A pure Javascript date range picker standalone plugin for hotels or booking websites. Free and released under MIT license."/>
	<meta name="twitter:title" content="Hotel Datepicker - A pure Javascript date range picker for hotels"/>
	<meta name="twitter:site" content="@LopezBenito"/>
	<meta name="twitter:image" content="http://static.lopezb.com/hoteldatepicker/datepicker_card.png"/>
	<meta name="twitter:creator" content="@LopezBenito"/>

	<link rel="stylesheet" type="text/css" href="css/hotel-datepicker.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
	<script type="text/javascript" src="js/fecha.js"></script>
	<script type="text/javascript" src="js/fecha.min.js"></script>
	<script type="text/javascript" src="js/hotel-datepicker.min.js"></script>
</head>
<body>

<div class="page">
	<h1>Hotel Datepicker</h1>
	<p>A pure Javascript date range picker for hotels.</p>

	<div class="demo">
		<h3>Demo</h3>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo1" value="">
			</div>
			<p class="demo__description">Default settings with a predefined value in the input</p>
			<div class="demo__config">
				<pre id="pre-demo1">
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input);
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo2" value="">
			</div>
			<p class="demo__description">Default settings with an empty input</p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input);
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo3" value="">
			</div>
			<p class="demo__description">Custom format: <code>DD-MM-YYYY</code></p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input, {
    format: 'DD-MM-YYYY'
});
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo4" value="">
			</div>
			<p class="demo__description">Start of week: <code>monday</code></p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input, {
    startOfWeek: 'monday'
});
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo5" value="">
			</div>
			<p class="demo__description">Mininum number of nights: <code>7</code></p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input, {
    minNights: 7
});
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo6" value="">
			</div>
			<p class="demo__description">Maximum number of nights: <code>5</code></p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input, {
    maxNights: 5
});
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo7" value="">
			</div>
			<p class="demo__description">Range between <code>4</code> and <code>8</code> nights</p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input, {
    minNights: 4,
    maxNights: 8
});
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo8" value="">
			</div>
			<p class="demo__description">Don't allow ranges before custom date: <code id="code-demo8"></code></p>
			<div class="demo__config">
				<pre id="pre-demo8">
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo9" value="">
			</div>
			<p class="demo__description">Don't allow ranges after custom date: <code id="code-demo9"></code></p>
			<div class="demo__config">
				<pre id="pre-demo9">
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo10" value="">
			</div>
			<p class="demo__description">Don't allow selections in both directions (first click = first date, second click = second date)</p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input, {
    selectForward: true
});
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo11" value="">
			</div>
			<p class="demo__description">Disable some dates: <code id="code-demo11"></code></p>
			<div class="demo__config">
				<pre id="pre-demo11">
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo12" value="">
			</div>
			<p class="demo__description">Disable some dates but allow the checkout in those dates. <code id="code-demo12"></code></p>
			<div class="demo__config">
				<pre id="pre-demo12">
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo13" value="">
			</div>
			<p class="demo__description">Don't close the datepicker after selection</p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input, {
    autoClose: false
});
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo14" value="">
			</div>
			<p class="demo__description">Use datepicker in another language (italian)</p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input, {
    startOfWeek: 'monday',
    i18n: {
        selected: 'Il tuo soggiorno:',
        night: 'Notte',
        nights: 'Notti',
        button: 'Chiudi',
        'day-names': ['Dom', 'Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab'],
        'month-names': ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'],
        'error-more': 'L\'intervallo di date non deve avere pi� di 1 notte',
        'error-more-plural': 'L\'intervallo di date non deve avere pi� di %d notti',
        'error-less': 'L\'intervallo di date non deve avere meno di 1 notte',
        'error-less-plural': 'L\'intervallo di date non deve avere meno di %d notti',
        'info-more': 'Per favore seleziona un intervallo di date maggiore di 1 notte',
        'info-more-plural': 'Per favore seleziona un intervallo di date maggiore di %d notti',
        'info-range': 'Per favore seleziona un intervallo di date tra %d e %d notti',
        'info-default': 'Per favore seleziona un intervallo di date'
    }
});
				</pre>
			</div>
		</div>

		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo15" value="">
				<button type="button" id="destroy-datepicker" class="button">Destroy</button>
			</div>
			<p class="demo__description">Click the button to destroy the datepicker</p>
			<div class="demo__config">
				<pre>
var input = document.getElementById('input-id');
var datepicker = new HotelDatepicker(input);

var destroyButton = document.getElementById('destroy-button');
destroyButton.addEventListener('click', destroyDatepicker);

function destroyDatepicker() {
	datepicker.destroy();
}
				</pre>
			</div>
		</div>
	</div>

</div>

	<script type="text/javascript">
		(function() {
			// ------------------- DEMO 1 ------------------- //

			var today = new Date();
			var tomorrow = new Date();
			tomorrow.setDate(tomorrow.getDate() + 1);
			var input1 = document.getElementById('demo1');
			input1.value = fecha.format(today, 'YYYY-MM-DD') + ' ~ ' + fecha.format(tomorrow, 'YYYY-MM-DD');

			var demo1 = new HotelDatepicker(input1);


			// ------------------- DEMO 2 ------------------- //

			var demo2 = new HotelDatepicker(document.getElementById('demo2'));


			// ------------------- DEMO 3 ------------------- //

			var demo3 = new HotelDatepicker(document.getElementById('demo3'), {
				format: 'DD-MM-YYYY'
			});


			// ------------------- DEMO 4 ------------------- //

			var demo4 = new HotelDatepicker(document.getElementById('demo4'), {
				startOfWeek: 'monday'
			});


			// ------------------- DEMO 5 ------------------- //

			var demo5 = new HotelDatepicker(document.getElementById('demo5'), {
				minNights: 7
			});


			// ------------------- DEMO 6 ------------------- //

			var demo6 = new HotelDatepicker(document.getElementById('demo6'), {
				maxNights: 5
			});


			// ------------------- DEMO 7 ------------------- //

			var demo7 = new HotelDatepicker(document.getElementById('demo7'), {
				minNights: 4,
				maxNights: 8
			});


			// ------------------- DEMO 8 ------------------- //

			var date = new Date();
			date.setDate(date.getDate() + 5);

			var codeDemo8 = document.getElementById('code-demo8');
			var preDemo8 = document.getElementById('pre-demo8');
			var txt = "var input = document.getElementById('input-id');\nvar datepicker = new HotelDatepicker(input, {\n    startDate: "+ fecha.format(date, 'YYYY-MM-DD') +"\n});";
			preDemo8.textContent = txt;
			codeDemo8.textContent = fecha.format(date, 'YYYY-MM-DD');

			var demo8 = new HotelDatepicker(document.getElementById('demo8'), {
				startDate: date
			});


			// ------------------- DEMO 9 ------------------- //

			var date = new Date();
			date.setDate(date.getDate() + 25);

			var codeDemo9 = document.getElementById('code-demo9');
			var preDemo9 = document.getElementById('pre-demo9');
			var txt = "var input = document.getElementById('input-id');\nvar datepicker = new HotelDatepicker(input, {\n    endDate: "+ fecha.format(date, 'YYYY-MM-DD') +"\n});";
			preDemo9.textContent = txt;
			codeDemo9.textContent = fecha.format(date, 'YYYY-MM-DD');

			var demo9 = new HotelDatepicker(document.getElementById('demo9'), {
				endDate: date
			});


			// ------------------- DEMO 10 ------------------ //

			var demo10 = new HotelDatepicker(document.getElementById('demo10'), {
				selectForward: true
			});


			// ------------------- DEMO 11 & 12 ------------------ //

			var date1 = new Date();
			var date2 = new Date();
			var date3 = new Date();
			var date4 = new Date();
			var date5 = new Date();
			var date6 = new Date();
			date1.setDate(date1.getDate() + 3);
			date2.setDate(date2.getDate() + 6);
			date3.setDate(date3.getDate() + 7);
			date4.setDate(date4.getDate() + 8);
			date5.setDate(date5.getDate() + 11);
			date6.setDate(date6.getDate() + 21);

			var codeDemo11 = document.getElementById('code-demo11');
			var codeDemo12 = document.getElementById('code-demo12');
			var preDemo11 = document.getElementById('pre-demo11');
			var preDemo12 = document.getElementById('pre-demo12');
			var txt = "var input = document.getElementById('input-id');\nvar datepicker = new HotelDatepicker(input, {\n    disabledDates: [\n        "+ "'" + fecha.format(date3, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date1, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date2, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date4, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date5, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date6, 'YYYY-MM-DD') + "'" + "\n    ]\n});";
			preDemo11.textContent = txt;
			var txt = "var input = document.getElementById('input-id');\nvar datepicker = new HotelDatepicker(input, {\n    disabledDates: [\n        "+ "'" + fecha.format(date3, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date1, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date2, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date4, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date5, 'YYYY-MM-DD') + "'" + ",\n        "+ "'" + fecha.format(date6, 'YYYY-MM-DD') + "'" + "\n    ],\n    enableCheckout: true\n});";
			preDemo12.textContent = txt;
			codeDemo11.textContent = '['+ fecha.format(date3, 'YYYY-MM-DD') +', '+ fecha.format(date1, 'YYYY-MM-DD') +', '+ fecha.format(date2, 'YYYY-MM-DD') +', '+ fecha.format(date4, 'YYYY-MM-DD') +', '+ fecha.format(date5, 'YYYY-MM-DD') +', '+ fecha.format(date6, 'YYYY-MM-DD') +']'
			codeDemo12.textContent = '['+ fecha.format(date3, 'YYYY-MM-DD') +', '+ fecha.format(date1, 'YYYY-MM-DD') +', '+ fecha.format(date2, 'YYYY-MM-DD') +', '+ fecha.format(date4, 'YYYY-MM-DD') +', '+ fecha.format(date5, 'YYYY-MM-DD') +', '+ fecha.format(date6, 'YYYY-MM-DD') +']'

			var demo11 = new HotelDatepicker(document.getElementById('demo11'), {
				disabledDates: [
					fecha.format(date3, 'YYYY-MM-DD'),
					fecha.format(date1, 'YYYY-MM-DD'),
					fecha.format(date2, 'YYYY-MM-DD'),
					fecha.format(date4, 'YYYY-MM-DD'),
					fecha.format(date5, 'YYYY-MM-DD'),
					fecha.format(date6, 'YYYY-MM-DD')
				]
			});

			var demo12 = new HotelDatepicker(document.getElementById('demo12'), {
				disabledDates: [
					fecha.format(date3, 'YYYY-MM-DD'),
					fecha.format(date1, 'YYYY-MM-DD'),
					fecha.format(date2, 'YYYY-MM-DD'),
					fecha.format(date4, 'YYYY-MM-DD'),
					fecha.format(date5, 'YYYY-MM-DD'),
					fecha.format(date6, 'YYYY-MM-DD')
				],
				enableCheckout: true
			});


			// ------------------- DEMO 13 ------------------ //

			var demo13 = new HotelDatepicker(document.getElementById('demo13'), {
				autoClose: false
			});


			// ------------------- DEMO 14 ------------------ //

			var demo14 = new HotelDatepicker(document.getElementById('demo14'), {
				startOfWeek: 'monday',
				i18n: {
					selected: 'Il tuo soggiorno:',
					night: 'Notte',
					nights: 'Notti',
					button: 'Chiudi',
					'day-names': ['Dom', 'Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab'],
					'month-names': ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'],
					'error-more': 'L\'intervallo di date non deve avere pi� di 1 notte',
					'error-more-plural': 'L\'intervallo di date non deve avere pi� di %d notti',
					'error-less': 'L\'intervallo di date non deve avere meno di 1 notte',
					'error-less-plural': 'L\'intervallo di date non deve avere meno di %d notti',
					'info-more': 'Per favore seleziona un intervallo di date maggiore di 1 notte',
					'info-more-plural': 'Per favore seleziona un intervallo di date maggiore di %d notti',
					'info-range': 'Per favore seleziona un intervallo di date tra %d e %d notti',
					'info-default': 'Per favore seleziona un intervallo di date'
				}
			});

			// ------------------- DEMO 15 ------------------ //

			var demo15 = new HotelDatepicker(document.getElementById('demo15'));

			var destroyButton = document.getElementById('destroy-datepicker');
			destroyButton.addEventListener('click', destroyDatepicker);

			function destroyDatepicker() {
				demo15.destroy();
			}
		})();
	</script>
</body>
</html>
