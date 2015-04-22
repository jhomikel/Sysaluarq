<%-- 
    Document   : v_pprincipal
    Created on : 14-abr-2015, 8:44:40
    Author     : PCVirtual
--%>

<%@page import="java.util.List"%>
<%@page import="uml.Cliente"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ALUARQ S.A. de C.V.</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imagenes/icono-gestion.png" type="image/ico" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
        <link href="../estilo.css" rel="stylesheet">
        <link href="../bootstrap/css/style1.css" rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="../bootstrap/css/navbar-fixed-top.css" rel="stylesheet">
         <!-- Custom styles for this template -->
        <link href="../bootstrap/css/signin.css" rel="stylesheet">
        <link rel="stylesheet" href="estilo.css" type="text/css" />
        
        <!-- Archivos para Datepicker-->
        <link rel="stylesheet" href="../bootstrap/css/datepicker.css">
        <script src="../bootstrap/js/jquery-1.11.2.min.js"></script>
        <script src="../bootstrap/js/bootstrap-datepicker.js"></script>
        
        

        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 4000 //changes the speed
        })
        </script>
        <style type="text/css">
            body{
                padding: 0;
            }
        </style>
    </head>
    <%!
    String usr;   
    %>
    <%
    usr = (String)session.getAttribute("username");
    %>
        <nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" style="margin-top:-15px;">
                        <img alt="Brand" width="45" height="45" src="../imagenes/navbar-logo.png">
                    </a>
                    <div class="navbar-brand">Ofertas ALUARQ</div>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                      <li><a href="#">En proceso</a></li>
                      <li><a href="#">Terminadas</a></li>
                      <li><a href="#">Aprobadas</a></li>
                      <li class="active"><a href="v_nuevo.jsp">Nueva oferta</a></li>
                      <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>
            </div>
        </nav>
    <body>
        <div class="container">
            <div class="row">
                    <div class="account-wall">
                        <div id="my-tab-content" class="tab-content">
                            <form class="form-horizontal">
                                <fieldset>

                                <!-- Form Name -->
                                <legend>Nueva oferta</legend>

                                <!-- Text input-->
                                <div class="form-group">
                                  <label class="col-md-4 control-label" for="num">Cotizacion #</label>  
                                  <div class="col-md-4">
                                  <input id="num" name="num" type="text" placeholder="" class="form-control input-md" required="">

                                  </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                  <label class="col-md-4 control-label" for="cliente">Cliente</label>
                                  <div class="col-md-4">
                                      <select id="cliente" name="cliente" class="form-control">
                                        <% 
                                            ClienteDAO cdao = new ClienteDAO();
                                            List<Cliente> lst = cdao.consultar();
                                            for(Cliente c : lst){
                                        %>
                                        <option value="<%= c.getIdCliente() %>"><%= c.getNombreCliente() %></option>
                                        <% }
                                        %>
                                    </select>
                                  </div>
                                </div>
                                
                                <!--Script para Datepicker-->
                                <script>
                                    $(function(){
                                         $('.fecha').datepicker({
                                                minDate: 0   
                                            });    
                                    });
                                </script>
                                <!--///Script para Datepicker-->
                                <div class="form-group">
                                  <label class="col-md-4 control-label" for="num">Fecha</label>  
                                  <div class="col-md-4">
                                      <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></div>
                                    <input id="fecha" name="fecha" type="text" placeholder="" class="form-control fecha" required="">
                                  </div>
                                </div>
                                
                                <!-- Text input-->
                                <div class="form-group">
                                  <label class="col-md-4 control-label" for="proyecto">Proyecto</label>  
                                  <div class="col-md-4">
                                  <input id="proyecto" name="proyecto" type="text" placeholder="" class="form-control input-md" required="">

                                  </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                  <label class="col-md-4 control-label" for="condicion">Condicion pago</label>  
                                  <div class="col-md-4">
                                  <input id="condicion" name="condicion" type="text" placeholder="" class="form-control input-md" required="">

                                  </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                  <label class="col-md-4 control-label" for="validez">Validez</label>  
                                  <div class="col-md-4">
                                  <input id="validez" name="validez" type="text" placeholder="" class="form-control input-md" required="">

                                  </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                  <label class="col-md-4 control-label" for="factor">Factor de ganancia</label>  
                                  <div class="col-md-4">
                                  <input id="factor" name="factor" type="text" placeholder="" class="form-control input-md" required="">

                                  </div>
                                </div>
                                <br>
                                <!-- Button (Double) -->
                                <div class="form-group">
                                    <input type="submit" id="ingresar" name="ingresar" value="Ingresar datos" class="btn btn-success"/>
                                    <input type="reset" class="btn btn-danger"/>
                                </div>

                                </fieldset>
                            </form>

                        </div>
                    </div>
                    
            </div>
        </div>


        <footer>
            <div class="navbar navbar-inverse navbar-fixed-bottom">
                <h5>Derechos reservados &copy; - <small>ALU-ARQ, S.A. de C.V.</small></h5>
            </div>                 
        </footer>

        <script src="../bootstrap/js/bootstrap.js">
        <script src="../bootstrapjs/jquery.min.js"></script>
        <script src="../bootstrapjs/bootstrap.min.js"></script>
    </body>
</html>