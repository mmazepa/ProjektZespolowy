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

// ADDING "0" TO DAY, MONTH, HOURS ETC. IF NEEDED
function timeValidator(timeAmount){
    if(timeAmount < 10) timeAmount = "0" + timeAmount;
    return timeAmount;
}

// PREPARE DATE WITH TIME_VALIDATOR
function prepareCurrentDate(){
    var currentdate = new Date();

    var day = timeValidator(currentdate.getDate());
    var month = timeValidator(currentdate.getMonth()+1);
    var hours = timeValidator(currentdate.getHours());
    var minutes = timeValidator(currentdate.getMinutes());
    var seconds = timeValidator(currentdate.getSeconds());

    var datetime = day + "-" + month  + "-" + currentdate.getFullYear() + " "
                    + hours + ":" + minutes + ":" + seconds;

    return datetime;
}

// ADDING NEW MESSAGE TO CHAT
function addMessage(username){
    var message = document.getElementById("message").value;
    var datetime = prepareCurrentDate();

    if (message){
        var chat = document.getElementById("messages");

        var div = document.createElement("div");
        var p = document.createElement("p");
        var strong = document.createElement("strong");

        var user = document.createTextNode(username + ": ");
        var text = document.createTextNode(message);
        var sendtime = document.createTextNode(datetime);

        div.setAttribute("id", "myMessage");
        p.setAttribute("id", "sendTime");

        strong.appendChild(user);
        div.appendChild(strong);
        div.appendChild(text);
        p.appendChild(sendtime);
        div.appendChild(p);

        div.style.opacity = "0";

        chat.appendChild(div);
        document.getElementById("message").value = "";
        chat.scrollTop = chat.scrollHeight;

        var ex = chat.lastChild;
        ex.style.transition = "opacity 0.5s";
        ex.style.opacity = "1";
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
                if(file == "header" || file == "footer"){
                    document.getElementsByTagName(file)[0].innerHTML = allText;
                }
                else if (file == "code"){
                    document.getElementById(file).value = allText;
                    alert(allText);
                }
            }
        }
    }
    rawFile.send(null);
}

// UPLOAD TEXT FROM FILE TO EDITOR
function uploadToEditor(){
    var filePath = document.getElementById("file").value;
    alert(filePath);
    readTextFile("code", filePath);
}

// LOG OUT FUNCTION
function logout(){
    location.href = '../index.jsp';
}
