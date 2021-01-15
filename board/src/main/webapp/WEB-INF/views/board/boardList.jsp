<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/common/common.css"  />


<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		getBoardList();
	});
	
	//게시판 상세 페이지 이동
	function goBoardDetail(boardSeq){
		location.href="/board/boardDetail?boardSeq=" + boardSeq;
	}
	
	//게시판 작성 페이지 이동
	function goBoardWrite(){
		location.href = "/board/boardWrite";
	}
	
	//게시판 목록 조회
	function getBoardList(){
		$.ajax({
			type : "POST",
			url : "/board/getBoardList",
			cache : false,
			async : true,
			dataType:"JSON",
			success : function(obj){
				getBoardListCallback(obj);
			},
			error : function(xhr, status, error){
				
			}
		});
	}
	
	//게시판 목록 조회 콜백 함수
	function getBoardListCallback(obj){
		
		var list = obj;
		var listLen = obj.length;
		
		var str = "";
		
		if(listLen > 0){
			
			for(var a=0; a<listLen; a++){
				var boardSeq = list[a].board_seq;
				var boardReRef = list[a].board_re_ref;
				var boardReLev = list[a].board_re_lev;
				var boardReSeq = list[a].board_re_seq;
				var boardWriter = list[a].board_writer;
				var boardSubject = list[a].board_subject;
				var boardContent = list[a].board_content;
				var boardHits = list[a].board_hits;
				var delYn = list[a].del_yn;
				var insDate = list[a].ins_date;
				var updUserId = list[a].upd_user_id;
				var updDate = list[a].upd_date;
				
				str += "<tr>";
				str += "<td>" + boardSeq + "</td>"
				str += "<td onclick='javascript:goBoardDetail("+ boardSeq +");' style='cursor:Pointer'>"+ boardSubject +"</td>";
				str += "<td>" + boardHits + "</td>"
				str += "<td>" + boardWriter + "</td>"
				str += "<td>" + insDate + "</td>"
				str += "</tr>"
			}
			
		} else {
			
			str +="<tr colspan='4'>";
			str +="<td>등록된 글이 존재하지 않습니다.</td>";
			str +="</tr>";			
		}
		
		$("#tbody").html(str);
	}

</script>
</head>
<body>
<div id="wrap">
    <div id="container">
        <div class="inner">        
            <h2>게시글 목록</h2>            
            <form id="boardForm" name="boardForm">
                <table width="100%" class="table01">
                    <colgroup>
                        <col width="10%" />
                        <col width="25%" />
                        <col width="10%" />
                        <col width="15%" />
                        <col width="20%" />
                    </colgroup>
                    <thead>        
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>조회수</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                    
                    </tbody>    
                </table>
            </form>            
            <div class="btn_right mt15">
                <button type="button" class="btn black mr5" onclick="javascript:goBoardWrite();">작성하기</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>