var f=1;
function done()
{
    var emai=document.frm.email.value;
    var cmn=document.frm.cmnt.value;
    if(emai=="")
    {
        alert("enter email");
        f=0;
    }
    else if(cmn=="")
    {
        alert("enter your descrption");
        f=0;
    }

}
function don(){
    done();
    if(f==1)
    {
        return true;
    }
    else
        return false;
    
}