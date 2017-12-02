// CHANGING HTML CONTENT
function changeContent(id, content){
    document.getElementById(id).innerHTML = content;
}

// CLEARING CREDENTIAL INPUTS ON LOGIN FAILURE
function clearCredentials(){
    document.getElementById("login").value = "";
    document.getElementById("password").value = "";
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
