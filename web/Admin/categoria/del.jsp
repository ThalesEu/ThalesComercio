<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>

<%
    
     if(request.getParameter("codigo") != null){
    CategoriaDAO dao=new CategoriaDAO();
    Categoria cate= dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    dao.excluir(cate);}
     else{
        response.sendRedirect("index.jsp");
     }
%>

<%@include file="../cabecalho.jsp"%>
<div>
<meta http-equiv="refresh" content="1; url=index.jsp">
<img src="../../imagens/wtf.gif" height="250" width="450">
<font color="red"> <h1> Categoria sendo Excluida ...</h1></font>
<div id="botao"><a href="index.jsp">Voltar</a></div>

</div>
</body>
</html>
