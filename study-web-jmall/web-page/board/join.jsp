<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style></style>
    <link rel="stylesheet" type="text/css" href="../CSS/product_style.css">
    <script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
    <script type="text/javascript" src="../js/index.js"></script>
</head>

<body class="member_page" id="join">
   <content class="member_page_wrapper" id="join_wrapper">
    <h2>회원가입</h2>
    	<form action="registration.jsp" method="post" onsubmit="return isSubmitable()">
        <fieldset>
            <legend>회원정보입력</legend>
            <table class="member_page_table" id="join_table" border="1">
                <tr>
                    <th class="th">이름<span class="red_span">※</span></th>
                    <td class="td"><input class="normal_input" type="text" name="name" required></td>
                </tr>
                <tr>
                    <th class="th">ID<span class="red_span">※</span></th>
                    <td class="td"><input class="normal_input" id="uname" type="text" name="uname" required>
                    <input id="check_id" type="button" value="중복확인" onclick="javascript:confirmId()"></td>
                </tr>
                <tr>
                    <th class="th">비밀번호<span class="red_span">※</span></th>
                    <td class="td"><input class="normal_input" id="pass" type="password" name="pass" onchange="javascript:confirmPass()" required></td>
                </tr>
                <tr>
                    <th class="th">비밀번호확인<span class="red_span">※</span></th>
                    <td class="td"><input class="normal_input" id="passCheck" type="password" name="passCheck" onchange="javascript:confirmPass()" required><br/>
                    <span id="same">비밀번호를 입력하여 주십시오.</span></td>
                </tr>
                <tr>
                    <th class="th">이메일<span class="red_span">※</span></th>
                    <td class="td"><input class="normal_input" type="email" name="email" required>
                    </td>
                </tr>
                <tr>
                    <th class="th">전화<span class="red_span">※</span></th>
                    <td class="td">
                        <input class="normal_input" type="tel" name="phone" pattern=^\d{3}-\d{3,4}-\d{4}$ required><br/>
                        <span>입력양식은 000-0000-0000 입니다.</span>
                    </td>
                </tr>
                <tr>
                    <th class="th">주소<span class="red_span">※</span></th>
                    <td class="td"><input id="address" type="text" name="address">
                    </td>
                </tr>
            </table>
            <input id="reset" type="reset" value="초기화" onclick="alert('초기화되었습니다!')">
            <input id="regdone" type="submit" value="가입하기">
        </fieldset>
    </form>
    </content>
</body>
</html>