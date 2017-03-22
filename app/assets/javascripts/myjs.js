function showDiv(elem){
   if(elem.value == 2){
    document.getElementById('hidden_di').style.display = "none";
    document.getElementById('hidden_div').style.display = "block";
   }
    else if(elem.value == 3){
      document.getElementById('hidden_div').style.display = "none";
      document.getElementById('hidden_di').style.display = "block"; 
    }
      
    else{
      document.getElementById('hidden_div').style.display = "none";
      document.getElementById('hidden_di').style.display = "none";
    } 
}