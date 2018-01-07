// OBRAIN AND MANAGE URL PARAMETERS
function manageUrlParams() {
    var urlString = location.href;
    var url = new URL(urlString);
    var author = url.searchParams.get("author");
    var file = url.searchParams.get("file");
    document.getElementById("authorName").innerHTML = author;
    document.getElementById("fileName").innerHTML = file;
}
