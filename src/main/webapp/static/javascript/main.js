// CHANGING CURRENTLY USED PROGRAMMING LANGUAGE
function changeLanguage(){
    var select = document.getElementById("languages");
    var lang = select.options[select.selectedIndex].innerHTML;
    changeContent("usedLanguage", lang);
}

// CHECKING IF CREDENTIALS ARE CORRECT
function checkCredentials(){
    var login = document.getElementById("login").value;
    var password = document.getElementById("password").value;

    changeFontColor("loginInfo", "red");

    if (login == "user"){
        if (password == "user1234"){
            changeContent("loginInfo", "Authorization succeded, you're welcome!");
            changeFontColor("loginInfo", "green");
            setTimeout(function(){
                location.assign("subpages/editor.jsp");
            }, 1000);
        }
        else if (!password) {
            changeContent("loginInfo", "Please enter your password");
        }
        else {
            changeContent("loginInfo", "Authorization failed, try again later!");
        }
    }
    else {
        if (!login || !password) {
            changeContent("loginInfo", "Please enter your login and password.");
        }
        else {
            changeContent("loginInfo", "Authorization failed, try again later!");
        }
    }
}

// CHANGING HTML CONTENT
function changeContent(id, content){
    document.getElementById(id).innerHTML = content;
}

// CHANGING FONT COLOR
function changeFontColor(id, color){
    document.getElementById(id).style.color = color;
}

// ADDING NEW MESSAGE TO CHAT
function addMessage(){
    var message = document.getElementById("message").value;
    if (message){
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
