<%@page import="util.Criptografia"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
        String msg = "";
        String classe = "";
        Integer errors = 0; 
        if (request.getParameter("txtNome") != null && !request.getParameter("txtNome").isEmpty()) 
        {

            ClienteDAO dao = new ClienteDAO();
            Cliente obj = new Cliente();
            obj.setNome(request.getParameter("txtNome"));
            obj.setEmail(request.getParameter("txtEmail"));
            obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
            obj.setEstado(request.getParameter("txtEstado"));
            obj.setCidade(request.getParameter("txtCidade"));
            obj.setEndereco(request.getParameter("txtEndereco"));
            obj.setBairro(request.getParameter("txtBairro"));
            obj.setCep(request.getParameter("txtCep"));
            
                if ( request.getParameter("txtCep").length() != 9 ) 
                {
                errors++;
                msg+= "Cep inválido";
                }
                else
                {
                obj.setCep(request.getParameter("txtCep"));
                }

                    if (request.getParameter("txtEstado").length() != 2)
                    {
                    errors++;
                    msg+= "Selecione um estado";
                    } 
                    else 
                    {
                    obj.setEstado(request.getParameter("txtEstado"));
                    }
                            if (errors == 0 && dao.incluir(obj)) {
       
                     response.sendRedirect("add-ok.jsp");
                            } else {
                                msg+= "Não foi possivel incluir";
                                classe = "alert-danger";
                            }

        }
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
                  <i class="fa fa-ban"></i> 
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Cliente
        </div>
        <div class="panel-body">

               <div class="alert <%=classe%>"><%=msg%></div>
               
        </div>
            </div>
            <form action="add.jsp" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                       <label>Codigo</label>
                    <input class="form-errorsrol" type="text" name="txtCodigo" readonly  />
                        <label>Nome</label>
                        <input  type="text" name="txtNome"  required />
                        <br />
                         <label>Email</label>
                       <input type="text" name="txtEmail"  required />
                         <br />
                        <label>Senha</label>
                        <input  type="password" name="txtSenha" required />
                        <br />
                        <label>Estado</label>
               <select  name="txtEstado" required>
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
                         <br />
                        <label>Cidade</label>
                        <input  type="text" name="txtCidade"  required/>
                        <br />
                        <label>Endereço</label>
                        <input  type="text" name="txtEndereco"  required/>
                        <br />
                        <label>Bairro</label>
                        <input  type="text" name="txtBairro"  required />
                        <br />
                        <label>Cep</label>
                        <input  type="number" name="txtCep"  minlength="9" required />


                    </div>
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                

        </div>
                        </form>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>