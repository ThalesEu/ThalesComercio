<%@page import="modelo.Marca"%>
<%@include file="../cabecalho.jsp" %>
<%@page import="java.util.List"%>
<%@page import="dao.MarcaDAO"%>
<%
    MarcaDAO dao = new MarcaDAO();
    List<Marca> lista;
    if (request.getParameter("filtro") == null || request.getParameter("filtro").isEmpty()) {
        lista = dao.listar();

    } else {
        lista = dao.filtrar(request.getParameter("filtro"));
    }
    %>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Marcas

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-ban"></i> 
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">

            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
            
        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text"  name="filtro" class="form-control" placeholder="digite...">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                            </div>
        </form>
        <div class="panel-body">
           
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th >Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for(Marca item:lista)
                        {
                            %>
                        
                    <tr>
                        <td><%=item.getCodigo()%></td>
                        <td><%=item.getNome()%></td>                                                                                                               
                        <td><a href="upd.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <a href="del.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-primary btn-sm">Excluir</a>  
                         </td>
                    </tr>
                </tbody>
            </table>
             <% }
%>
                <!-- /.table-responsive -->
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
        </div>
    <%@include file="../rodape.jsp" %>
