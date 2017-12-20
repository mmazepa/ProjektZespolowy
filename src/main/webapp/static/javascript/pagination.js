// HOW MANY ROWS WILL BE DISPLAYED
var displayedRowsNumber = 5;

// CHANGING PAGES
function changePage(direction) {
    var currentPage = document.getElementById("currentPage").innerHTML;
    var allRows = document.getElementsByClassName("rowClass");
    var pagesNumber = Math.ceil(allRows.length/displayedRowsNumber);

    for(i = 0; i < allRows.length; i++) {
        allRows[i].style.display = "none";
    }

    // PREVIOUS PAGE
    if (direction == "back") {
        var previousPage = parseInt(currentPage) - 1;
        document.getElementById("currentPage").innerHTML = previousPage;
        for (i = currentPage*displayedRowsNumber - 2*displayedRowsNumber; i < previousPage*displayedRowsNumber; i++) {
            allRows[i].style.display = "table-row";
        }
    }

    // NEXT PAGE
    if (direction == "next") {
        var nextPage = parseInt(currentPage) + 1
        document.getElementById("currentPage").innerHTML = nextPage;

        for (i = currentPage*displayedRowsNumber; i < nextPage*displayedRowsNumber; i++) {
            allRows[i].style.display = "table-row";
            if (i == allRows.length - 1) break;
        }
    }

    // DISABLING BUTTONS
    // DISABLE LESS THAN 1
    if(document.getElementById("currentPage").innerHTML == 1) {
        document.getElementById("previousPage").disabled = true;
    }
    else {
        document.getElementById("previousPage").disabled = false;
    }

    // DISABLE MORE THAN ALL_ROWS/5
    if(document.getElementById("currentPage").innerHTML == pagesNumber) {
        document.getElementById("nextPage").disabled = true;
    }
    else {
        document.getElementById("nextPage").disabled = false;
    }
}

// LOAD FIRST 'DISPLAYED_ROWS_NUMBER' ROWS
function loadRows() {
    var allRows = document.getElementsByClassName("rowClass");
    var pagesNumber = Math.ceil(allRows.length/displayedRowsNumber);

    for(i = 0; i < allRows.length; i++) {
        allRows[i].style.display = "none";
    }

    for(i = 0; i < displayedRowsNumber; i++) {
        allRows[i].style.display = "table-row";
    }

    document.getElementById("previousPage").disabled = true;
    document.getElementById("currentPage").innerHTML = 1;
    document.getElementById("allPages").innerHTML = pagesNumber;
}
