var map; 
var markers = [];
var infoWindow;
var startPos = {};

window.onload = function() {
    var src = document.getElementById("location-input"),
                dst = document.getElementById("search");
                src.addEventListener('input', function() {
                    dst.value = src.value;
                });

                var input = document.getElementById("location-input");
                input.addEventListener("keyup", function(event) {
                    if (event.keyCode === 13) {
                        event.preventDefault();
                        document.getElementById("icon-search").click();
                    }
                });
    var geoOptions = {
        maximumAge: 5 * 60 * 1000
    }

    var geoSuccess = function(position) {
        startPos["latitude"]  = position.coords.latitude;
        startPos["longitude"] = position.coords.longitude;
    };
    var geoError = function(error) {
    console.log('Error occurred. Error code: ' + error.code);
    // error.code can be:
    //   0: unknown error
    //   1: permission denied
    //   2: position unavailable (error response from location provider)
    //   3: timed out
    };

    startPos["latitude"]  = -17.73358902928236;
    startPos["longitude"] = -56.910557567447384;

    navigator.geolocation.getCurrentPosition(geoSuccess, geoError, geoOptions);
};

function initMap() {
    var brazil = {  
        lat: -17.73358902928236,
        lng: -56.910557567447384
    };

    map = new google.maps.Map(document.getElementById('map'), {
        center: brazil,
        zoom: 4,
        mapTypeId: 'roadmap'
    });
    infoWindow = new google.maps.InfoWindow();
    loadNgos()
}

function loadNgos(){
    var ngos = [];
    
    ngos_sets = document.querySelectorAll(".store-info-container");

    [...ngos_sets].forEach(function(ele) {
        ngos.push(ele.dataset)
    });

    if (ngos.length === 0){
        return false
    }

    showNgosMarkers(ngos);
    setOnClickListener(ngos);

}

function clearLocations(){
    infoWindow.close();
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers.length = 0;
}

function showNgosMarkers(ngos) {
    var bounds = new google.maps.LatLngBounds();
    
    ngos.forEach((ngo, index) => {
        var latlng = new google.maps.LatLng(
            ngo["latitude"],
            ngo["longitude"]
        )
        var name = ngo["name"];
        var address = ngo["address"];
        var phoneNumber = ngo["phone"];
        var website = ngo["website"];
        var description = ngo["description"];
        bounds.extend(latlng);
        createMarker(latlng, name, address, phoneNumber, website, description, index+1);
    });
    map.fitBounds(bounds);
}

function buildHtml(name, address, phoneNumber, website, description, latLng){
    var html = `
    <div class="store-info-window"> 
    <div class="store-info-name">
        ${name}
    </div>
    <div class="store-info-status">
        ${description}
    </div>
    <div class="store-info-phone">
        <div class="circle">
            <i class="fas fa-globe"></i>
        </div>
        <a title="Website da ONG" href=${website}>${website}</a>
    </div>
    <div class="store-info-address">
        <div class="circle">
            <i class="fas fa-location-arrow"></i> 
        </div>
        <a title="Rotas"
        href='https://www.google.com/maps/dir/?api=1&origin=${startPos["latitude"]},${startPos["longitude"]}&destination=${latLng.lat()},${latLng.lng()}' target="_blank">${address}</a>
    </div> 
    <div class="store-info-phone">
        <div class="circle">
            <i class="fas fa-phone-alt"></i>
        </div>    
        ${phoneNumber}
    </div>
</div>
    `;
    return html;
}

function createMarker(latlng, name, address, phoneNumber, website, description, index){
    var marker = new google.maps.Marker({
        map: map,
        position: latlng,
        label: index.toString()
    });

    google.maps.event.addListener(marker, 'click', function() { 
        map.panTo(marker.getPosition());
        infoWindow.setContent(buildHtml(name, address, phoneNumber, website, description, latlng));
        infoWindow.open(map, marker);
    });
    
    markers.push(marker);
}

function setOnClickListener(){
    var ngoElements = document.querySelectorAll('.store-container');
    ngoElements.forEach(function(elem, index){
        elem.addEventListener('click', function(){
            new google.maps.event.trigger(markers[index], 'click')
        })
    })
}