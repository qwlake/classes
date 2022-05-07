function parentRefresh() {
	parent.location.href = "../index.jsp";
}

function keyword_check() {
	if ($("#keyword").val() == "") {
		alert('검색어를 입력하세요');
		//document.search.keyword.focus();
		return false;
	}
	else
		return true;

}

function popupClose(move) {
	if (move == null) {
		window.close();
	} else {
		opener.location.href = move;
		window.close();
	}
}

function isSubmitable() {
	if (confirmPass() == "")
		return true;
	else {
		alert("비밀번호를 확인하여 주십시오.");
		return false;
	}
}

function confirmPass() {
	var passMinLen = 3;
	var passMaxLen = 20;
	var pass = $("#pass").val();
	var passC = $("#passCheck").val();
	var same = $("#same");
	if (pass.length < passMinLen || pass.length > passMaxLen) {
		alert("비밀번호는 " + passMinLen + "자 이상, " + passMaxLen + "자 이하만 이용 가능합니다.");
		$("#same").innerHTML = "";
	}
	if (pass != "" && passC != "") {
		if (pass == passC) {
			same.html("비밀번호가 일치합니다.");
			same.css("color", "blue");
			return "";
		} else {
			same.html("비밀번호가 일치하지 않습니다.");
			same.css("color", "red");
			return "비밀번호가 일치하지 않습니다.";
		}
	} else
		return "비밀번호를 입력하여 주십시오.";
}

function confirmId() {
	var uname = $("#uname").val();
	if (uname == "")
		alert("ID를 입력하세요.");
	else {
		url = "../board/confirmId.jsp?uname=" + uname;
		open(url, "confirm", "resizable=no, width=300, height=200");
	}
}

function putOrder(idproduct) {
	url = "../putOrder.jsp?idproduct=" + idproduct;
	open(url, "confirm", "resizable=no, width=300, height=200");
}

function putBasket(idproduct) {
	url = "../putBasket.jsp?idproduct=" + idproduct;
	open(url, "confirm", "resizable=no, width=300, height=200");
}

function orderDelete() {
	var orderList = [];
	$("input[name='orderList']:checked").each(function(i) {
		orderList.push($(this).val());
	});
	
	$.ajax({
		url: 'orderDelete.jsp',
		type: 'get',
		dataType: 'text',
		data: {'orderList':orderList},
		success: function() {
            alert("삭제가 완료되었습니다.");
            window.location.href = "basket.jsp";
        },
        error: function(msg, error) {
            alert(error);
        }
	});
}

function prev(page, current_page) {
	if(current_page - 1 <= 0)
		alert("첫 페이지입니다.");
	else
		document.location.href = page + ".jsp?page=" + (current_page - 1);
}

function next(page, rowSize, MAX_ARTICLES, current_page) {
	var total_pages = rowSize / MAX_ARTICLES  + 1;
	if(current_page + 1 >= total_pages)
		alert("마지막 페이지입니다.");
	else
		document.location.href = page + ".jsp?page=" + (current_page + 1);
}