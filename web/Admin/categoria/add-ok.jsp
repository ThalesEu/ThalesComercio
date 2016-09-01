<%@page import= "modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<% 
        CategoriaDAO dao = new CategoriaDAO();
        Categoria obj = new Categoria();
        obj.setNome(request.getParameter("txtNome"));
        dao.incluir(obj);
        
        
    
%>
<%@include file="../cabecalho.jsp"%>
<meta http-equiv="refresh" content="1; url=index.jsp">
<img src="../../imagens/wtf.gif" height="250" width="450">
<h1><font color="green">  Categoria sendo Adicionada ...</font></h1>
</body>
</html>
    <%@include file="../rodape.jsp" %>

