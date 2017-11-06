// CHANGING CURRENTLY USED PROGRAMMING LANGUAGE
function changeLanguage(){
    var select = document.getElementById("languages");
    var lang = select.options[select.selectedIndex].innerHTML;
    document.getElementById("usedLanguage").innerHTML = lang;
}

// CHECKING IF CREDENTIALS ARE CORRECT
function checkCredentials(){
    var login = document.getElementById("login").value;
    var password = document.getElementById("password").value;

    if (login == "user"){
        if (password == "user1234"){
            alert("Authorization succeded, you're welcome!");
            location.assign("subpages/editor.jsp");
        }
        else if (password == "") {
            alert("Please enter your password.");
        }
        else {
            alert("Authorization failed, try again later!");
        }
    }
    else {
        if (login == "" || password == "") {
            alert("Please enter your login and password.");
        }
        else {
            alert("Authorization failed, try again later!");
        }
    }
}

// ADDING NEW MESSAGE TO CHAT
function addMessage(){
    var message = document.getElementById("message").value;
    if (message != ""){
        var chat = document.getElementById("messages");

        var div = document.createElement("div");
        var strong = document.createElement("strong");

        var user = document.createTextNode("user: ");
        var text = document.createTextNode(message);

        strong.appendChild(user);
        div.appendChild(strong);
        div.appendChild(text);

        chat.appendChild(div);
        document.getElementById("message").value = "";
        chat.scrollTop = chat.scrollHeight;
    }
}
