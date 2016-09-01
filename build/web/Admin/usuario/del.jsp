<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Status"%>
<%@page import="dao.StatusDAO"%>

<%
    
        UsuarioDAO dao = new UsuarioDAO();
    if (request.getParameter("login") != null) {
    if (dao.excluir(dao.buscarPorChavePrimaria(request.getParameter("login")))) {
 }
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
