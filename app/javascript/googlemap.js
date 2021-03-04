window.addEventListener('load', function(){
let map
let geocoder
// 下の1行を追加 
const display = document.getElementById('display')
var url = location.href ;
var url2 =url.slice(22);
console.log(url2)
if(url2.match(/\d{2,4}/)) {

  let position = document.getElementById('position_show')
  let position2 = document.getElementById('position_show2')
  console.log(Number(position.innerHTML))
  function initMap(){
    geocoder = new google.maps.Geocoder()
  
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat:Number(position.innerHTML), lng:Number(position2.innerHTML)},
      zoom: 16,
    });
  
    marker = new google.maps.Marker({
      position:{lat:Number(position.innerHTML), lng:Number(position2.innerHTML)},
      map: map
    });
  }
  initMap();
  
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
        // display.textContent = "検索結果：" + results[ 0 ].geometry.location
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
  var button = document.getElementById("map_search")
  button.addEventListener('click', function() {
    codeAddress();
  });


  


}else{
  function initMap(){
    geocoder = new google.maps.Geocoder()
  
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat:35.6809591 , lng:139.7673068},
      zoom: 16,
    });
  
    marker = new google.maps.Marker({
      position:{lat:35.6809591 , lng:139.7673068},
      map: map
    });
  }
  initMap();

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
        //display.textContent = "検索結果：" + results[ 0 ].geometry.location
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
  var button = document.getElementById("map_search")
  button.addEventListener('click', function() {
    codeAddress();
  });


}


});
