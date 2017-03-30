function setAccepted() {
x = document.getElementsByClassName("current_status");
var count = x.length;
for(var i = 0; i <= count; i++){
  x[i].value = 2;
    }
}

function setRejected() {
x = document.getElementsByClassName("current_status");
var count = x.length;
for(var i = 0; i <= count; i++){
  x[i].value = 3;
    }
}

function setWaitlisted() {
x = document.getElementsByClassName("current_status");
var count = x.length;
for(var i = 0; i <= count; i++){
  x[i].value = 4;
    }
}

function setReset() {
x = document.getElementsByClassName("current_status");
var count = x.length;
for(var i = 0; i <= count; i++){
  x[i].value = "Select";
    }
}