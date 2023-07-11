
function pro(i){
    var sr;
    document.cookie = "id=" + i;
    if(i=="diploma")
    {
        sr="./img/diplogo.jpg";
    }
    else if(i=="hotel")
    {
        sr="./img/hotellogo.jpg";
    }
    else{
        sr="./img/ani.jpg";
    }
    document.cookie = "im=" + sr;
    window.location="profile.jsp";
}
