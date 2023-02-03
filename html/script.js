var blackmoney = false;


$(document).ready(function () {
    window.addEventListener("message", function (event) {
        if (event.data.action == "setMoney") {
          setAnzahl(event.data.money);
		    $(".money").show();
  $("money").show();
        };
        if (event.data.action == "setBlackMoney") {
		  blackmoney = true;
          setAnzahle(event.data.black);
  		  $(".schwarzmoney").show();
 		  $("schwarzmoney").show();


        };
        if (event.data.action == "hideBlackMoney") {
  					$(".schwarzmoney").hide();
  					$("schwarzmoney").hide();
 					 blackmoney = false;

		};

    });

});

function setAnzahl(anzahl) {
    document.getElementById("content").innerHTML = new Intl.NumberFormat('de-DE').format(anzahl) + " $";

}
function setAnzahle(anzahl) {
    document.getElementById("content2").innerHTML = new Intl.NumberFormat('de-DE').format(anzahl) + " $";

}
