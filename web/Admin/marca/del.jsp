<%@page import="modelo.Marca"%>
<%@page import="dao.MarcaDAO"%>

<%
    
     if(request.getParameter("codigo") != null){
    MarcaDAO dao=new MarcaDAO();
    Marca cate= dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    dao.excluir(cate);}
     else{
        response.sendRedirect("index.jsp");
     }
%>

<%@include file="../cabecalho.jsp"%>
<div>
<meta http-equiv="refresh" content="1; url=index.jsp">
<img src="../../imagens/wtf.gif" height="250" width="450">
<font color="red"> <h1> Marca sendo Excluida ...</h1></font>
</div>
</body>
</html>
