<div id="map" style="width:500px;height:400px;"></div>

	    	<!-- 다음지도 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c2aa194de2a7b800dc342de69bf136a"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(396916.297710, 187034.213309),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>