function selectcountry() {
	var country_field = document.getElementById('country');
	country_field.style.display = "none" ; //hide country field to show search bar
	var link = document.getElementById('link');
	link.style.display="none"; 
    var country=document.getElementById('country2');
    country.style.display = "block";
    var state= document.getElementById('state');
    state.style.display = "block";
    var doneselect = document.getElementById('btndone');
    doneselect.style.display = "block";
}

function  location_data () {
  var country2=document.getElementById('country2');
  var country=country2.value;
  var state= document.getElementById('state');
  var state_val=state.value;
  var loc= country+","+state_val;
  var location=document.getElementById('country');
  location.value = loc;  
  link.innerHTML="Not in"+ loc+"?";
}
 function doneselect() {
    var country_field = document.getElementById('country');
    country_field.style.display = "block" ; //hide country field to show search bar
    var link = document.getElementById('link');
    link.style.display = 'block';
    var country2=document.getElementById('country2');
    country2.style.display="none"; 
    var state= document.getElementById('state');
    state.style.display="none"; 
    var doneselect = document.getElementById('btndone');
    doneselect.style.display = "none";
    ////////////////to convert selected location to latitude and longitude/////////////////
    var geocoder = new google.maps.Geocoder();
    var location=document.getElementById('country');
    var address = location.value;

    geocoder.geocode( { 'address': address}, function(results, status) {

          if (status == google.maps.GeocoderStatus.OK) {
            var latitude = results[0].geometry.location.lat();
            var longitude = results[0].geometry.location.lng();
            var latitude_div = document.getElementById('latitude');
            latitude_div.value = latitude;
            var longitude_div = document.getElementById('longitude');
            longitude_div.value = longitude;            
            } 
        }); 
    }

function selectinterest (value) {
    var interest_id = value.id;
    var interest = document.getElementById(interest_id);
    var parent=interest.parentNode.parentNode.id;
    if (parent=="avaliable_interests") {
        var myinterest = document.getElementById('myinterest');
        var int_val = myinterest.value;
        if (int_val=="") {
            myinterest.value=interest.innerHTML;
        } else{
            myinterest.value = myinterest.value+","+interest.innerHTML; 
        };
        var div = interest.parentNode;
        document.getElementById('selected_interests').appendChild(div);
        var interests=document.getElementById('interests');
        interests.removeChild(div); //get certain div by its parent node

    } else{
        var myinterest = document.getElementById('myinterest');
        var int_val = myinterest.value;
        console.log('inside this');
        var temp = new Array();
        temp = int_val.split(",");   
        var interest_text = interest.innerHTML;
        var value_in_array = temp.indexOf(interest_text);
        temp.splice(value_in_array, 1);
        var str = temp.toString();
        myinterest.value=str;
        var div = interest.parentNode;
        document.getElementById('avaliable_interests').appendChild(div);
        var interests=document.getElementById('interests');
        interests.removeChild(div); //get certain div by its parent node

    };

}

function showmembers(){
    var Home = document.getElementById('Home');
    Home.style.display = "none";
    var members = document.getElementById('Members');
    members.style.display = "block";
    var home_li = document.getElementById('home');
    home_li.classList.remove("active");
    var members_li = document.getElementById("members");
    members_li.classList.add("active");

}
function showhome(){
    var members = document.getElementById('Members');
    members.style.display = "none";
    var home = document.getElementById('Home');
    home.style.display = "block";
    var home_li = document.getElementById('home');
    home_li.classList.add("active");
    var members_li = document.getElementById("members");
    members_li.classList.remove("active");
}
function getmembers() {
    var adminmember = document.getElementById('adminmember');
    adminmember.style.display = "none";
    var allmembers = document.getElementById('allmembers');
    allmembers.style.display = "block";
    var members_li = document.getElementById('members_li');
    members_li.classList.add("active");
    var admin_li = document.getElementById("admin_li");
    admin_li.classList.remove("active");
}
function adminmember() {
    var allmembers = document.getElementById('allmembers');
    allmembers.style.display = "none";
    var adminmember = document.getElementById('adminmember');
    adminmember.style.display = "block";
    var members_li = document.getElementById('members_li');
    members_li.classList.remove("active");
    var admin_li = document.getElementById("admin_li");
    admin_li.classList.add("active");
}



