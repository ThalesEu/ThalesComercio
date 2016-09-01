<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                 <i class="fa fa-github"></i> 
                  <i class="fa fa-ban"></i>             </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Status
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="add-ok.jsp" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Login</label>
                 <input class="form-control" name="login" type="text" required />
                        <label>Senha</label>
                 <input class="form-control" name="senha" type="password" required />
                        <label>Admin</label>
                 <input class="form-control"  name="admin" type="checkbox"/>
                    </div>
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>