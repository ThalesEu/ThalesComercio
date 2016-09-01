<%@page import="util.Criptografia"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.StatusDAO"%>
<%@page import="modelo.Status"%>
<% 

        Usuario obj = new Usuario();
        UsuarioDAO dao = new UsuarioDAO();
        obj.setLogin(request.getParameter("login"));
        obj.setSenha (Criptografia.convertPasswordToMD5(request.getParameter("senha")));
        if (request.getParameter("admin") != null) {
            obj.setAdmin(true);
        } else {
            obj.setAdmin(false);
        }
        dao.incluir(obj);
%>
<%@include file="../cabecalho.jsp"%>
<meta http-equiv="refresh" content="1; url=index.jsp">
<h1> <font color="green">  Status sendo Adicionada ...</font></h1> 
</body>
</html>
    <%@include file="../rodape.jsp" %>

