<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%

    if (request.getParameter("codigo") == null || request.getParameter("codigo").isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }
    Integer cont = 0;
    String msg = "", classe = "";
    ClienteDAO dao = new ClienteDAO();
    Cliente x = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

    if ((request.getParameter("nome") != null) && (!request.getParameter("nome").isEmpty())) {

        x.setNome(request.getParameter("nome"));
        x.setEmail(request.getParameter("email"));
        x.setEndereco(request.getParameter("endereco"));
        x.setBairro(request.getParameter("bairro"));
        x.setCidade(request.getParameter("cidade"));
        if (request.getParameter("estado").length() != 2) {
            cont++;
            msg+= "Estado inválido, ";
        } else {
            x.setEstado(request.getParameter("estado"));
        }

        if (request.getParameter("cep").length() != 9) {
            cont++;
            msg+= "O seu cep deve possuir 9 números.";
        } else {
            x.setCep(request.getParameter("cep"));
        }

        if (cont == 0 && dao.alterar(x)) {
          response.sendRedirect("upd-oka.jsp");

        } else {
            msg += "Selecione um estado.";
            classe = "alert-danger";
        }

    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Clientes

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"><a href="index.jsp">Listagem de registros</a></i>
            </li>
            <li class="active">
                 <i class="fa fa-github"></i> 
                  <i class="fa fa-ban"></i>         </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Atualizar um Cliente
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>"><%=msg%></div>

            <form action="upd.jsp" method="post">

                <div class="col-lg-6">
                        <label>Código</label>
                        <input name="codigo" value="<%=request.getParameter("codigo")%>" class="form-control" type="text" readonly />
                    <div class="form-group">
                        
                        <label>Nome</label>
                        <input name="nome" value="<%=x.getNome()%>" class="form-control" type="text" required />
                                                <br/>

                        <label>Email</label>
                        <input name="email" value="<%=x.getEmail()%>" class="form-control" type="email" required />
                                                <br/>

                        <label>Senha</label>
                        <input readonly type="text" value="PEGA-TROUXA" class="form-control">
                                                <br/>

                        <label>Endereço</label>
                        <input name="endereco" class="form-control" value="<%=x.getEndereco()%>" type="text" required />
                                                <br/>

                        <label>Bairro</label>
                        <input name="bairro" class="form-control" value="<%=x.getBairro()%>" type="text" required />
                                                <br/>

                        <label>Cidade</label>
                        <input name="cidade" class="form-control" value="<%=x.getCidade()%>" type="text" required />
                                                <br/>

                        <label>Estado</label>
                                      <select  name="estado" required>
                  <option value="null">SELECIONE</option>
                  <option value="AC">AC</option>
                  <option value="AL">AL</option>
                  <option value="AP">AP</option>
                  <option value="AM">AM</option>
                  <option value="BA">BA</option>
                  <option value="CE">CE</option>
                  <option value="DF">DF</option>
                  <option value="ES">ES</option>
                  <option value="GO">GO</option>
                  <option value="MA">MA</option>
                  <option value="MT">MT</option>
                  <option value="MS">MS</option>
                  <option value="MG">MG</option>
                  <option value="PA">PA</option>
                  <option value="PB">PB</option>
                  <option value="PR">PR</option>
                  <option value="PE">PE</option>
                  <option value="PI">PI</option>
                  <option value="RJ">RJ</option>
                  <option value="RN">RN</option>
                  <option value="RS">RS</option>
                  <option value="RO">RO</option>
                  <option value="RR">RR</option>
                  <option value="SC">SC</option>
                  <option value="SP">SP</option>
                  <option value="SE">SE</option>
                  <option value="TO">TO</option>
                     </select>
                                                <br/>

                        <label>Cep</label>
                        <input name="cep" class="form-control" type="text" value="<%=x.getCep()%>"  maxlength="9" required />
                                                <br/>

                    </div>





                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>