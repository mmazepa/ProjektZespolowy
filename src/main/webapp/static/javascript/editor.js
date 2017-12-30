// CODE_MIRROR STARTING SCRIPT
var myTextArea = document.getElementById("code");
var myCodeMirror = CodeMirror(function(elt) {
    myTextArea.parentNode.replaceChild(elt, myTextArea);
}, {
    // CodeMirror options
    value: myTextArea.value,
    styleActiveLine: true,
    lineNumbers: true,
    lineWrapping: true
});

// LOAD MODES
function loadModes() {
    var modes = [
        "text/plain",
        "javascript",
        "xml",
        "css",
        "python",
        "cobol",
        "markdown",
        "pascal",
        "php",
        "r",
        "ruby"
    ];
    modes.sort();

    var modePlace = document.getElementById("mode");
    var count = 1;
    modes.forEach(function(mode) {
        var option = document.createElement("option");
        var text = document.createTextNode(mode);
        option.value = count;
        option.appendChild(text);
        if (mode == "text/plain") option.selected = true;
        modePlace.appendChild(option);
        count++;
    });
}

// CHANGING MODES/LANGUAGES
CodeMirror.modeURL = "../static/codemirror-5.32.0/mode/%N/%N.js";
var selectBox = document.getElementById("mode");
var modeInput = selectBox.options[selectBox.selectedIndex].text;
CodeMirror.on(modeInput, "keypress", function(e) {
    if (e.keyCode == 13) change();
});

function change() {
    var selectBox = document.getElementById("mode");
    var modeInput = selectBox.options[selectBox.selectedIndex].text;
    var val = modeInput, m, mode, spec;
    if (m = /.+\.([^.]+)$/.exec(val)) {
        var info = CodeMirror.findModeByExtension(m[1]);
        if (info) {
            mode = info.mode;
            spec = info.mime;
        }
    } else if (/\//.test(val)) {
        var info = CodeMirror.findModeByMIME(val);
        if (info) {
            mode = info.mode;
            spec = val;
        }
    } else {
        mode = spec = val;
    }
    if (mode) {
        myCodeMirror.setOption("mode", spec);
        CodeMirror.autoLoadMode(myCodeMirror, mode);
        document.getElementById("modeinfo").textContent = spec;
    } else {
        alert("Could not find a mode corresponding to " + val);
    }
}

// UPLOADING TEXT INTO CODE_MIRROR EDITOR
function uploadToEditor() {
    var content = setContent();
    myCodeMirror.setValue(content);
}

// SETTING THE CONTENT FROM FILE
function setContent() {
    var file = document.getElementById("file");

    var newContent = readTextFromFile(file);
    if (newContent === "" || newContent == null) {
        alert("No file selected.");
    }

    return newContent;
}

// READ TEXT FROM FILE - VERSION FOR EDITOR
function readTextFromFile(file) {
    var allText;

    var reader = new FileReader();
    if(file.files[0] != null) {
        var textFile = file.files[0];
        reader.readAsText(textFile);
        alert("Your file: " + file.files[0].name);
        allText = reader.result;
    }
    else {
        //alert('Please upload a file before continuing.');
    }

    return allText;
}
