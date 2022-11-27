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
}