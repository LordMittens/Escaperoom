function validateForm() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    if (username === "user" && password === "user") {
        window.location.href = "userpage.html?userID=2";
    } else {
        alert("Invalid username or password. Please try again.");
    }
}