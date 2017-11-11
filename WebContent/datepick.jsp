
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

	<link rel="stylesheet" type="text/css" href="NewDatepicker/css/hotel-datepicker.css">
	<link rel="stylesheet" type="text/css" href="NewDatepicker/css/main.css">
	
	<script type="text/javascript" src="NewDatepicker/js/fecha.js"></script>
	<script type="text/javascript" src="NewDatepicker/js/fecha.min.js"></script>
	<script type="text/javascript" src="NewDatepicker/js/hotel-datepicker.min.js"></script>
</head>
<body>

<div class="page">
	<div class="demo">
		<div class="demo__item">
			<div class="demo__input">
				<input type="text" id="demo1" value="">
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
		})();
	</script>
</body>
</html>
