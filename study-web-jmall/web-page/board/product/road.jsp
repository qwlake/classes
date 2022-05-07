<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로드</title>
<style></style>
<link rel="stylesheet" type="text/css"
	href="../../CSS/product_style.css">
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script type="text/javascript" src="../../js/index.js"></script>
</head>
<body class="product_page">
	<content> <%
    	int idproduct;
    	String herf = "";
    	String kinds = "road";
    	String src = "";
    	String srcAlter = "";
    	String corp = "";
    	String pname = "";
    	String cprice = "";
    	int price;
    	DecimalFormat df = new DecimalFormat("###,###");
    	
    	int MAX_ARTICLES = 15; 	// 한 페이지에 보여줄 게시물 갯수
		int board_page; 		// page는 req로부터 가져온다.
		
		if(request.getParameter("page") == null)
			board_page = 1;
		try {
			board_page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			e.printStackTrace(); // 그냥 아무렇지도 않은듯 있으면 된다.
			board_page = 1;
		}
		
		Connection conn = null;
		
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jmall",
                	        "root", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Statement st = conn.createStatement();
        String sql = "select * from products where kinds='" + kinds + "'";
        ResultSet rs = st.executeQuery(sql);
        
        rs.last();
		int rowSize = rs.getRow();
        
        if (rs != null) {
        	for (int i = MAX_ARTICLES * (board_page - 1) + 1; i < MAX_ARTICLES * board_page + 1; i++) {
     			if (!rs.absolute(i))
     				continue; // 해당 Row로 이동하지 못했을경우 그냥 다음으로 넘어간다.
     			idproduct = rs.getInt("idproduct");
     			herf = rs.getString("herf");
     			kinds = rs.getString("kinds");
     			src = rs.getString("src");
     			srcAlter = src.substring(0, src.length() - 3)
     					+ src.substring(src.length() - 3, src.length()).toUpperCase();
     			corp = rs.getString("corp");
     			pname = rs.getString("pname");
     			price = rs.getInt("price");
     			cprice = df.format(price);
     %> <%-- <script>console.log('<%=i%>');</script> --%>
    	<div class="product_wrapper">
    		<a target="_blank" href=<%=herf%>> <img class=“product_img”
    			src="<%=src%>" onerror="javascript:this.src='<%=srcAlter%>'"><br />
    			<span><%=corp%></span> - <%=pname%><br /><%=cprice%>원
    		</a><br />
    		<input class="product_button" id="buy" type="button"
    			onclick="javascript:putOrder(<%=idproduct%>)" value="구매하기">
    		<input class="product_button" id="putbasket" type="button"
    			onclick="javascript:putBasket(<%=idproduct%>)" value="장바구니">
    	</div>
    	<%
    		}
        }
        %> 
	</content>
	<div class="productBtn">
	<br/><br/>
		<input type="button" value="&lt이전페이지" class="centerBtn" id="btn_prev" name="previousBtn" 
		onclick="prev('road', <%=board_page%>)">
		<input type="button" value="다음페이지&gt" class="centerBtn" id="btn_next" name="nextBtn" 
		onclick="next('road', <%= rowSize%>, <%=MAX_ARTICLES%>, <%=board_page%>)">
		<br/>
	</div>
</body>
</html>