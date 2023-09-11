

      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center: new kakao.maps.LatLng(33.361667, 126.529167), // 지도의 중심좌표
            level: 10 // 지도의 확대 레벨
         };
      
      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);


 
   
        function sendData1(clickedValue,scheId) {
            $.ajax({
                type: 'POST',
                url: '../recommend_map', // 서블릿의 URL (적절하게 수정해야 함)
                data: { 
               clickedValue: clickedValue, 
               scheId: scheId
               }, // 클릭한 값 전송
                success: function(response) {
         
              console.log(response);
         
         
         $('#map').remove();
         let ttttt = "<div id='map' style='width:100%;height:350px;'></div>";
         $('#mapWrap').html(ttttt);
         
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center: new kakao.maps.LatLng(33.361667, 126.529167), // 지도의 중심좌표
            level: 10 // 지도의 확대 레벨
         };
      
         // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
         var map = new kakao.maps.Map(mapContainer, mapOption);
         
        
         
            var markers = [];
            var linePath = [];
            var iwContent = [];
            var iwRemoveable = true;
            
            for(var a =0; a<response.length;a++){
          markers.push(new kakao.maps.LatLng(parseFloat(response[a].latitude), parseFloat(response[a].longitude))),
          linePath.push(new kakao.maps.LatLng(parseFloat(response[a].latitude), parseFloat(response[a].longitude))),
          iwContent.push('<div style="padding:5px;">'+response[a].name+'</div>')
         }
              
           for (var i = 0; i < response.length; i ++) {   
             // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
               position: markers[i],
               clickable: true
            });
            
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
            // 생성된 마커를 배열에 추가합니다
            markers.push(marker);
            
		 (function (marker, infowindow, content) {
		        kakao.maps.event.addListener(marker, 'click', function () {
		           // 커스텀 인포윈도우 생성
		        var customInfowindow = new kakao.maps.CustomOverlay({
		            content: '<div class="custom-infowindow">' + content + '</div>',
		            position: marker.getPosition(),
		            xAnchor: 0.5,
		            yAnchor: 1.5
		        });
		        
		        customInfowindow.setMap(map); // 커스텀 인포윈도우를 지도에 표시
		
		        // 기존의 인포윈도우 닫기 로직은 생략
		
		        // 커스텀 인포윈도우 닫기 처리 (예시)
		        kakao.maps.event.addListener(map, 'click', function() {
		            customInfowindow.setMap(null);
		        });
		        });
		    })(marker, new kakao.maps.InfoWindow({ removable: iwRemoveable }), iwContent[i]);


         
         
         }
         
         
         // 지도에 표시할 선을 생성합니다
         var polyline = new kakao.maps.Polyline({
             path: linePath, // 선을 구성하는 좌표배열 입니다
             strokeWeight: 2, // 선의 두께 입니다
             strokeColor: 'blue', // 선의 색깔입니다
             strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
             strokeStyle: 'solid' // 선의 스타일입니다
         });
         
         
         // 지도에 선을 표시합니다 
         
         polyline.setMap(map);
         
                },
                error: function(error) {
                    // 에러가 발생했을 때의 처리
                    console.error('에러:', error);
                }
            });
        }
        
        
        function sendData2(clickedValue,scheId) {
            $.ajax({
                type: 'POST',
                url: '../rec_com', // 서블릿의 URL (적절하게 수정해야 함)
                data: { 
               clickedValue: clickedValue, 
               scheId: scheId
               }, // 클릭한 값 전송
                success: function(response) {
               
               console.log(response);
               $("#responseValue").text(response);
                
                },
                error: function(error) {
                    // 에러가 발생했을 때의 처리
                    console.error('에러:', error);
                }
            });
         }
         
         function sendData(clickedValue, scheId) {   
          sendData1(clickedValue, scheId);
               sendData2(clickedValue, scheId);      
         }
      