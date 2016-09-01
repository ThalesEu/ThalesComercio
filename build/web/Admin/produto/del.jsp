<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>

<%
    
     if(request.getParameter("codigo") != null){
    ProdutoDAO dao=new ProdutoDAO();
    Produto cate= dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    dao.excluir(cate);}
     else{
        response.sendRedirect("index.jsp");
     }
%>

<%@include file="../cabecalho.jsp"%>
<div>
<meta http-equiv="refresh" content="1; url=index.jsp">
<img src="../../imagens/wtf.gif" height="250" width="450">
<font color="red"> <h1> produto sendo Excluida ...</h1></font>
</div>
</body>
</html>
