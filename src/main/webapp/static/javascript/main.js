var prompt = prompt("Welcome to Editor On-Line!\nPlease enter your name:");

if (prompt == null || prompt == "") {
    username = "Anonymous Guest";
} else {
    username = prompt;
}

document.addEventListener('DOMContentLoaded', function(){
    document.getElementById("helloUser").innerHTML = "Hello, " + username + "!";
}, false);

function changeLanguage(){
    var select = document.getElementById("languages");
    var lang = select.options[select.selectedIndex].innerHTML;
    document.getElementById("usedLanguage").innerHTML = lang;
}
