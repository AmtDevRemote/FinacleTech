function showSubMenu(sScope) {
var oDiv = document.getElementById("menuDiv_" + sScope).style;
var oImg = document.getElementById("menuImg_" + sScope);
if (oDiv.display ==  'none') {
	oDiv.display = 'block';
	oImg.src='images/menu-bullet-negative.gif' 
	} else {
	if (oDiv.display ==  'block') {
		oDiv.display = 'none';
		oImg.src='images/menu-bullet-positive.gif' 
		}
	}
}