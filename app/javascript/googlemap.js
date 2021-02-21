

let map 
let geocoder
let position = document.getElementById('position_show')
let position2 = document.getElementById('position_show2')
// 下の1行を追加 
const display = document.getElementById('display')

function initMap(){
    geocoder = new google.maps.Geocoder()
  
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat:35.68123620000001, lng:139.7671248},
      zoom: 16,
    });
  
    marker = new google.maps.Marker({
      position:{lat:35.68123620000001, lng:139.7671248},
      map: map
    });
    var html = `<script src="https://maps.googleapis.com/maps/api/js?key=<%=ENV['GOOGLE_MAP_API_KEY']%>&callback=initMap" async defer></script>`

    document.body.appendChild(html);
  }

function ShowInitMap(){
    if(window.location.href.match(/\/posts\/\d+\/show/)){
    geocoder = new google.maps.Geocoder()
  
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat:Number(position.innerHTML), lng:Number(position2.innerHTML)},
      zoom: 16,
    });
  
    marker = new google.maps.Marker({
      position:{lat:Number(position.innerHTML), lng:Number(position2.innerHTML)},
      map: map
    });

    var html = `<script src="https://maps.googleapis.com/maps/api/js?key=<%=ENV['GOOGLE_MAP_API_KEY']%>&callback=initMap" async defer></script>`

    document.body.appendChild(html);
}
  }

function codeAddress(){
  let inputAddress = document.getElementById('address').value;

  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
      // 下の1行を追加 
      display.textContent = "検索結果：" + results[ 0 ].geometry.location
      let location = results[ 0 ].geometry.location
      var lat = location.lat();
      var lng = location.lng();    
      document.getElementById( "latitude" ).value = lat
       document.getElementById( "longitude" ).value = lng
  
    } else {
      alert('該当する結果がありませんでした：' + status);
    }
  });   
}