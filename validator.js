function validateForm() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
/*
    const query = "SELECT * FROM mytable WHERE name = ? AND pass = ?";

    db.run(query, [username, password], (err, row) => {
        if (err) {
            console.error("error!");
        } else {
            if (row) {
                console.log(`User with name '${username}' and password '${password}' exists.`);
            } else {
                console.log(`User not found or password is incorrect.`);
            }
        }
    });
    db.close();
*/
    if (username === "user" && password === "user") {
        window.location.href = "userpage.html?userID=2";
    } else {
        alert("Invalid username or password. Please try again.");
    }
}