<%@page import="modelo.Status"%>
<%@page import="dao.StatusDAO"%>

<%
    
     if(request.getParameter("codigo") != null){
    StatusDAO dao=new StatusDAO();
    Status cate= dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    dao.excluir(cate);}
     else{
        response.sendRedirect("index.jsp");
     }
%>

<%@include file="../cabecalho.jsp"%>
<div>
<meta http-equiv="refresh" content="1; url=index.jsp">
<img src="fotos/cool.gif">
<font color="red"> <h1> Status sendo Excluido ...</h1></font>
<div id="botao"><a href="index.jsp">Voltar</a></div>

</div>
</body>
</html>
