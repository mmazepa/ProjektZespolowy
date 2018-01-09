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

// LOAD HEADER AND FOOTER SECTIONS
function loadHeaderAndFooter(){
    var headerPath = "/subpages/header.jsp";
    var footerPath = "/subpages/footer.jsp";
    readTextFile("header", headerPath);
    readTextFile("footer", footerPath);
}

// CHANGING LOCATION - MAIN MENU NAVIGATION
function changeLocation(){
    var nav = document.getElementById("navigate");
    var destination = nav.options[nav.selectedIndex].text;

    // OPTION TO STAY ON CURRENT PAGE
    if(destination == "Stay Here") {
        // DO NOTHING...
    }
    // ADMINISTRATOR PANEL OPTION
    else if(destination == "Administrator Panel") {
        location.href = "/subpages/admin.jsp";
    }
    // ADMINISTRATOR TABLES OPTIONS
    else if(destination == "Accounts") {
        location.href = "/accounts";
    }
    else if(destination == "Attendances") {
        location.href = "/attendances";
    }
    else if(destination == "Roles") {
        location.href = "/roles";
    }
    else if(destination == "Snapshots") {
        location.href = "/snapshots";
    }
    else if(destination == "Text Files") {
        location.href = "/textFiles";
    }
    else if(destination == "Workgroups") {
        location.href = "/workgroups";
    }
    // ALL LOGGED USERS OPTIONS
    else if(destination == "Editor") {
        location.href = "/subpages/editor.jsp";
    }
    else if(destination == "My Files") {
        location.href = "/userFiles";
    }
    else if(destination == "My Profile") {
        location.href = "/subpages/userProfile.jsp";
    }
    else if(destination == "My Workgroups") {
        location.href = "/subpages/userWorkgroups.jsp";
    }
    else if(destination == "Home Page") {
        location.href = "/index.jsp";
    }
    else alert("Desired destination cannot be found.");
}

// READ TEXT FROM FILE - VERSION FOR HEADER AND FOOTER
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
            }
        }
    }
    rawFile.send(null);
}

// LOG OUT FUNCTION
function logout(){
    location.href = '../index.jsp';
}
