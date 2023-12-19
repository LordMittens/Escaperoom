function validateForm() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    if ((username === "user" || username === "username" || username === "gebruiker") && 
        (password === "user" || password === "username" || password === "password" || password === "wachtwoord" || password === "1234" || password === "123456" )) {
        window.location.href = "userpage.html?userID=2";
    } else {
        alert("Invalid username or password. Please try again.");
    }
}