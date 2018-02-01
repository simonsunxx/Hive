function modifyCustInfo() {
	//alert("lll");
	document.getElementById("custPassword").disabled = false;
	document.getElementById("confirmpwd").disabled = false;
	document.getElementById("male").disabled = false;
	document.getElementById("female").disabled = false;
	document.getElementById("birthdate").disabled = false;
	document.getElementById("phoneNumber").disabled = false;
	document.getElementById("email").disabled = false;
	document.getElementById("recharge").disabled = false;
};

function charge(){
	//alert("recharge");
	document.getElementById("custCashes").disabled = false;
	document.getElementById("custCashes").value = 0;
};

function notLogin(){
	alert("请先登录！");
}
