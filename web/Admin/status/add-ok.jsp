<%@page import="dao.StatusDAO"%>
<%@page import="modelo.Status"%>
<% 
        StatusDAO dao = new StatusDAO();
        Status obj = new Status();
        obj.setDescricao(request.getParameter("txtDescricao"));
        dao.incluir(obj);
%>
<%@include file="../cabecalho.jsp"%>
<meta http-equiv="refresh" content="1; url=index.jsp">
<h1> <font color="green">  Status sendo Adicionada ...</font></h1> 
</body>
</html>
    <%@include file="../rodape.jsp" %>

