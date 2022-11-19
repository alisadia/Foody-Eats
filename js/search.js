const hotels = ["Al Watan Halal Tandoori Restaurant", "Aga Restaurant and Catering", "Bismillah Restaurant", "Famous Tandoori", "Halal Restaurant"];
const pages = ["Al Watan Halal Tandoori Restaurant.html", "Aga's Restaurant.html", "Bismillah Restaurant.html", "Famous Tandoori.html", "Halal Restaurant.html"];
var textField = document.getElementById("speechtotext");
var v = null;
textField.addEventListener("keyup", function(event) {
    if (event.key === 'Enter') {
      event.preventDefault();
      v = textField.value;
      loadPage(v);
    }
  });
function loadPage(value)
{
    let index = -1;
    for (let i = 0; i < hotels.length; i++)
    {
        var res = value.localeCompare(hotels[i]);
        if (res == 0)
        {
            index = i;
        }
    }
    if (index != -1)
    {
        window.open(pages[index], "_self");
    }
}
