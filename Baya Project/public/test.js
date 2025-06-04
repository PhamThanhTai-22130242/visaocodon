fetch("https://giuakydidong.42web.io/getAll.php", {
    method: "GET",
    
})
.then(response => response.json())
.then(data => console.log(data))
.catch(error => console.error("Error:", error));
