<%@page import= "modelo.Marca"%>
<%@page import="dao.MarcaDAO"%>
<% 
        MarcaDAO dao = new MarcaDAO();
        Marca obj = new Marca();
        obj.setNome(request.getParameter("txtNome"));
        dao.incluir(obj);
        
        
    
%>
<%@include file="../cabecalho.jsp"%>
<meta http-equiv="refresh" content="1; url=index.jsp">
<img src="../../imagens/wtf.gif" height="250" width="450">
<font color="green"> <h1> Marca sendo Adicionada ...</h1></font>
</body>
</html>
    <%@include file="../rodape.jsp" %>

