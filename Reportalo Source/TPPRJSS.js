function changeImageLocation() {

    if (document.getElementById('localizacionIMG').src.indexOf('localizacion_off.png') > 0) {
        document.getElementById('localizacionIMG').src = 'images/localizacion_on.png';
        document.getElementById('hdnLocation').value = 'ON';
        getLocation();

    }
    else {
        document.getElementById('localizacionIMG').src = 'images/localizacion_off.png';
        document.getElementById('hdnLocation').value = 'OFF';

    }
}


function changeImageAnonimo() {

    if (document.getElementById('anonimoIMG').src.indexOf('anonimo_off.png') > 0) {
        document.getElementById('anonimoIMG').src = 'images/anonimo_on.png';
        document.getElementById('hdnAnonimo').value = 'ON';
        

    }
    else {
        document.getElementById('anonimoIMG').src = 'images/anonimo_off.png';
        document.getElementById('hdnAnonimo').value = 'OFF';
    }
}



var x = document.getElementById("Label1");
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
    else { x.innerHTML = "Geolocation is not supported by this browser."; }
}

function showPosition(position) {
    document.getElementById("MhdnLat").value = position.coords.latitude
    document.getElementById("MhdnLong").value = position.coords.longitude

   

    //x.innerHTML = "Latitude: " + position.coords.latitude +
    //"<br>Longitude: " + position.coords.longitude;
}

function clearPosition(position) {
    document.getElementById("MhdnLat").value = '';
    document.getElementById("MhdnLong").value = '';



    //x.innerHTML = "Latitude: " + position.coords.latitude +
    //"<br>Longitude: " + position.coords.longitude;
}


function displayInfobox(e) {
    if (e.targetType == 'pushpin') {
        infobox.setLocation(e.target.getLocation());
        infobox.setOptions({ visible: true, title: e.target.Title, description: e.target.Description });
    }
}


