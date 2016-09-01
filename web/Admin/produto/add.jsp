<%@page import="java.util.List"%>
<%@page import="modelo.Marca"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="util.Upload"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    Integer errors = 0;
    CategoriaDAO Categoriadao = new CategoriaDAO();
    MarcaDAO Marcadao = new MarcaDAO();
    List<Categoria> clista = Categoriadao.listar();
    List<Marca> mlista = Marcadao.listar();
    Upload update = new Upload();
    update.setFolderUpload("imagens");
    if (request.getMethod().equals("POST")) {
        if (update.formProcess(getServletContext(), request)) {
            Produto obj = new Produto();
            ProdutoDAO dao = new ProdutoDAO();
            if (update.getForm().get("titulo") != null && !update.getForm().get("titulo").toString().trim().isEmpty()) {
                obj.setTitulo((update.getForm().get("titulo").toString()));
            }
            if (update.getForm().get("descricao") != null && !update.getForm().get("descricao").toString().trim().isEmpty()) {
                obj.setDescricao((update.getForm().get("descricao").toString()));
            }
            if (update.getForm().get("quant") != null && !update.getForm().get("quant").toString().trim().isEmpty()) {
                obj.setQuant(Integer.parseInt(update.getForm().get("quant").toString()));
            }
            if (update.getForm().get("preco") != null && !update.getForm().get("preco").toString().trim().isEmpty()) {
                obj.setPreco(BigDecimal.valueOf(Double.parseDouble(update.getForm().get("preco").toString())));
            }
            if (update.getForm().get("codcategoria") != null && !update.getForm().get("codcategoria").toString().trim().isEmpty()) {
                Categoria citem = Categoriadao.buscarPorChavePrimaria(Integer.parseInt(update.getForm().get("codcategoria").toString()));
                if (clista.contains(citem)) {
                    obj.setCodcategoria(Categoriadao.buscarPorChavePrimaria(Integer.parseInt((update.getForm().get("codcategoria").toString()))));
                } else {
                    errors++;
                    msg += "Selecione categoria";
                    classe = "alert-danger";
                }
            } 
            if (update.getForm().get("codmarca") != null && !update.getForm().get("codmarca").toString().trim().isEmpty()) {
                Marca mitem = Marcadao.buscarPorChavePrimaria(Integer.parseInt(update.getForm().get("codmarca").toString()));
                if (mlista.contains(mitem)) {
                    obj.setCodmarca(Marcadao.buscarPorChavePrimaria(Integer.parseInt((update.getForm().get("codmarca").toString()))));
                } else {
                    errors++;
                    msg += "Selecione Marca";
                    classe = "alert-danger";
                }
            }
            if (update.getForm().get("destaque") != null) {
                obj.setDestaque(true);
            } else {
                obj.setDestaque(false);
            }
            if (update.getFiles().size() != 0 && update.getFiles().get(0) != null && !update.getFiles().get(0).toString().trim().isEmpty()) {
                obj.setImagem1((update.getFiles().get(0).toString()));
            }
            if (update.getFiles().size() >= 2 && update.getFiles().get(1) != null && !update.getFiles().get(1).toString().trim().isEmpty()) {
                obj.setImagem2((update.getFiles().get(1).toString()));
            }
            if (update.getFiles().size() >= 3 && update.getFiles().get(2) != null && !update.getFiles().get(2).toString().trim().isEmpty()) {
                obj.setImagem3((update.getFiles().get(2).toString()));
            }
            if (errors == 0 && dao.incluir(obj)) {
                response.sendRedirect("add-ok.jsp");
            } else {
                msg += "Tente Novamente!";
                classe = "alert-danger";
            }
        }
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Produtos
        </h1>
        <ol class="breadcrumb">
            <li class="active">
                 <i class="fa fa-github"></i> 
                  <i class="fa fa-ban"></i>         </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Adicionar um novo Produto
        </div>
        <div class="panel-body">
            <div class="alert <%=classe%>"><%=msg%></div>
            <form action="add.jsp" method="post" enctype="multipart/form-data">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Titulo</label>
                        <input class="form-control" name="titulo" type="text" required />
                        
                        <label>Descrição</label>
                        <input class="form-control" name="descricao" type="text" required />
                        
                        <label>Quantidade</label>
                        <input class="form-control" name="quant" type="number" required />
                        
                        <label>Preço</label>
                        <input class="form-control" name="preco" type="number" required />
                        
                        <label>Categoria</label>
                        <select class="form-control" name="codcategoria">
                            <option>Selecionar Categoria</option>
                            <%
                                for (Categoria item : clista){
                            %>
                            <option value="<%=item.getCodigo()%>"><%=item.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                        
                        
                        <label>Marca</label>
                        <select  class="form-control" name="codmarca">
                            <option>Selecionar Marca</option>
                            <%
                                for (Marca item : mlista){
                            %>
                            <option value="<%=item.getCodigo()%>"><%=item.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                        
                        
                        <label>Destaque</label>
                        <input name="destaque" type="checkbox" class="form-control" />
                        
                        <label>Primeira imagem</label>
                        <input class="form-control" name="imagem1" type="file" required />
                        
                        <label>Segunda imagem</label>
                        <input class="form-control" name="imagem2" type="file"  />
                        
                        <label>Terceira imagem</label>
                        <input class="form-control" name="imagem3" type="file"  />
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                </div>
            </form>
        </div>
    </div>
    <!-- /.row -->
    <%@include file="../rodape.jsp"%>
