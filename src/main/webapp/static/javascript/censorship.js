// ADDING NEW MESSAGE TO CHAT
function addMessage(user, username, group){
    var message = document.getElementById("message").value;
    if (message && message !== "" && message !== null) {
        prepareMessage(username, message);
//        var pg = require("pg");
//        var connectionString = "postgres://postgres:HakerBonzo2137/94.177.245.154:5432/cigarbase";
//        var pgClient = new pg.Client(connectionString);
//        pgClient.connect();
//        pgClient.query("INSERT INTO Message (MessageAuthor, AttendingGroup, Content) VALUES ("+user+","+group+","+message+")");
//        pgClient.end();
    }
}

// PREPARING NEW MESSAGE
function prepareMessage(username, message){
    var datetime = prepareCurrentDate();
    message = censorship(message);

    if (message.replace(/\s/g, '').length) {
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

// CENSORSHIP FUNCTION
function censorship(textToCensore){
    // ARRAY WITH ALL VULGARITY WE NEED TO CENSORE
    // ADD MORE TO ARRAY BELOW FOR PRECISE CENSORSHIP
    var vulgarity = ["fuck", "shit", "bitch"];
    var censoredText;

    vulgarity.forEach(function(item){
        textToCensore = replaceAllVulgarity(item, textToCensore);
    });

    censoredText = textToCensore;
    return censoredText;
}

// CHANGING FIRST LETTER TO UPPERCASE
function uppercaseFirstLowercaseRest(txt) {
    txt = txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
    return txt;
}

// REPLACING WITH *'S IF TEXT_TO_CENSORE CONTAINS VULGARITY
function replaceVulgarity(textToCensore, vulgarWord){
    while(textToCensore.includes(vulgarWord)) {
        var badwordLength = vulgarWord.length;
        var censore = vulgarWord.charAt(0) + Array(badwordLength).join("*");
        textToCensore = textToCensore.replace(vulgarWord, censore);
    }
    return textToCensore;
}

// REPLACING COMBINED
function replaceAllVulgarity(item, textToCensore){
    var vulgar1 = uppercaseFirstLowercaseRest(item);
    var vulgar2 = item.toUpperCase();
    var vulgar3 = item.toLowerCase();

    textToCensore = replaceVulgarity(textToCensore, vulgar1);
    textToCensore = replaceVulgarity(textToCensore, vulgar2);
    textToCensore = replaceVulgarity(textToCensore, vulgar3);

    return textToCensore;
}
