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

// LOAD HEADER AND FOOTER SECTIONS
function loadHeaderAndFooter(){
    var headerPath = "/subpages/header.jsp";
    var footerPath = "/subpages/footer.jsp";
    readTextFile("header", headerPath);
    readTextFile("footer", footerPath);
}

// READ TEXT FROM FILE
function readTextFile(file, path){
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", path, false);
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
                var allText = rawFile.responseText;
                document.getElementsByTagName(file)[0].innerHTML = allText;
            }
        }
    }
    rawFile.send(null);
}


// ŁOPATOLOGICZNE FUNKCJE TYMCZASOWE, DO POPRAWKI !!!

// SAVE USER INFO IN SESSION STORAGE
function saveInfo(){
    var login = document.getElementById("login").value;
    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var email = document.getElementById("email").value;
    var birth = document.getElementById("birth").value;
    var passw = document.getElementById("passw").value;

    sessionStorage.setItem('user.login', login);
    sessionStorage.setItem('user.fname', fname);
    sessionStorage.setItem('user.lname', lname);
    sessionStorage.setItem('user.email', email);
    sessionStorage.setItem('user.birth', birth);
    sessionStorage.setItem('user.passw', passw);
}

// GET USER INFO FROM SESSION STORAGE
count = 0;
function getInfo(){
    if(count%2 == 0){
        var login = sessionStorage.getItem('user.login');
        var fname = sessionStorage.getItem('user.fname');
        var lname = sessionStorage.getItem('user.lname');
        var email = sessionStorage.getItem('user.email');
        var birth = sessionStorage.getItem('user.birth');
        var passw = sessionStorage.getItem('user.passw');

        changeContent("login", login);
        changeContent("fname", fname);
        changeContent("lname", lname);
        changeContent("email", email);
        changeContent("birth", birth);
        changeContent("passw", passw);

        changeContent("showHide", "Hide!");
    }

    if(count%2 == 1){
        changeContent("login", "...");
        changeContent("fname", "...");
        changeContent("lname", "...");
        changeContent("email", "...");
        changeContent("birth", "...");
        changeContent("passw", "...");

        changeContent("showHide", "Show!");
    }

    count++;
}
