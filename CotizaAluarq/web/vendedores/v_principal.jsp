<%-- 
    Document   : v_pprincipal
    Created on : 14-abr-2015, 8:44:40
    Author     : PCVirtual
--%>

<%@page import="uml.Oferta"%>
<%@page import="modeloDAO.OfertaDAO"%>
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
        <link rel="shortcut icon" href="../imagenes/icono-gestion.png" type="image/ico" />
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
    <%
        if (request.getAttribute("msj") != null) {
            out.print("<script languaje=javascript>alert('" + request.getAttribute("msj") + "')</script>");
        }
    %>
    <%!
    String usr, name, ape;
    int id;
    %>
    <%
    usr = (String)session.getAttribute("username");
    name = (String)session.getAttribute("nombres");
    ape = (String)session.getAttribute("apellidos");
    id = (Integer) session.getAttribute("id");
    OfertaDAO odao = new OfertaDAO();
    %>
        
    <body>
        <div class="container">
            <div class="row">
                    <div class="account-wall">
                        <style>
                            .account-wall{
                                margin-top: 70px;
                                margin-bottom: 50px;
                            }
                            .nav-tabs {
                                border: none;
                            }
                            li a{
                                color: #CACACA;
                            }
                            .navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover {
                                color: #55595E; 
                                background-color: #E7E7E7; 
                              }
                            .col-md-4 {
                              margin: 1px 15px;
                            }
                            table{
                                text-align: left;
                                background-color: rgb(237, 237, 237);
                            }
                        </style>
                            <div class="bs-example">
                                <nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#" style="margin-top:-15px;">
                                                <img alt="Brand" width="45" height="45" src="../imagenes/navbar-logo.png">
                                            </a>
                                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                              </button>
                                            <div class="navbar-brand">Ofertas ALUARQ</div>
                                        </div>
                                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <ul class="nav nav-tabs navbar-right navbar-nav">
                                            <li class="active"><a data-toggle="tab" href="#nuevaOferta">Nueva oferta</a></li>
                                            <li><a data-toggle="tab" href="#enProceso">Ofertas en proceso</a></li>
                                            <li class="dropdown">
                                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">Mas... <b class="caret"></b></a>
                                                <ul class="dropdown-menu">
                                                    <li><a data-toggle="tab" href="#terminadas">Ofertas terminadas</a></li>
                                                    <li><a data-toggle="tab" href="#aprobadas">Ofertas aprobadas</a></li>
                                                    <li><a data-toggle="tab" href="">Cerrar sesi&oacute;n</a></li>
                                                </ul>
                                            </li>
                                        </ul></div>
                                    </div>
                                </nav>
                                
                                <div class="tab-content">
                                    <div id="nuevaOferta" class="tab-pane fade in active">
                                        <form class="form-horizontal" action="${pageContext.request.contextPath}/OfertaCTRL" method='POST'>
                                        <fieldset>

                                        <!-- Form Name -->
                                        <legend><h3>Nueva oferta</h3></legend>
                                        <input id='emp' name='emp' type='text' value="<%= id %>" hidden="true">
                                        <!-- Text input-->
                                        <div class="form-group">
                                          <label class="col-md-4 control-label" for="num">Cotizacion #</label>  
                                          <div class="col-md-4">
                                            <input id="num" name="num" type="text" placeholder="" class="form-control input-md" required>

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
                                             $('#fecha').datepicker({
                                                    minDate: 0
                                                });    
                                        });
                                    </script>
                                    <!--///Script para Datepicker-->
                                    <div class="form-group">
                                      <label class="col-md-4 control-label" for="num">Fecha</label>  
                                      <div class="col-md-4">
                                          <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></div>
                                        <input id="fecha" name="fecha" type="text" placeholder="" class="form-control fecha" style="background-color: white;" required="" readonly>
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
                                          
                                          <!-- Button (Double) -->
                                          <div class="form-group">
                                              <input type="submit" id="ingresar" name="ingresar" value="Ingresar datos" class="btn btn-success"/>
                                              <input type="reset" class="btn btn-danger"/>
                                          </div>

                                          </fieldset>
                                    </form>
                                    </div>
                                    <div id="enProceso" class="tab-pane fade" style="padding: 0px 20px 0px 20px;">
                                        <%
                                            List<Oferta> lstProc = odao.consultarTipo("enProceso");
                                            if (lstProc.size() < 1) {
                                        %> 
                                        <h1>No hay ofertas en proceso actualmente.</h1>
                                        <hr>
                                        <a data-toggle="tab" href="#nuevaOferta" class="btn btn-success">Crear nueva oferta</a>
                                        <%        
                                            }else{
                                        %>
                                        <h2>Ofertas en proceso</h2>
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Cliente</th>
                                                        <th>Fecha</th>
                                                        <th>Proyecto</th>
                                                        <th>Empleado</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <% 
                                                    
                                                    for (Oferta o: lstProc) {
                                                        %>
                                                        <tr>
                                                            <td><%= o.getNumCotizacion() %></td>
                                                            <td><%= o.getIdCliente().getNombreCliente() %></td>
                                                            <td><%= o.getFecha() %></td>
                                                            <td><%= o.getProyecto() %></td>
                                                            <td><%= o.getIdEmpleado().getNombres() %></td>
                                                        </tr>
                                                        <%
                                                    }
                                                %>
                                                </tbody>
                                            </table>
                                        </div>
                                    <% } %>
                                    </div>
                                    <div id="terminadas" class="tab-pane fade">
                                        <%
                                            List<Oferta> lstTer = odao.consultarTipo("Terminada");
                                            if (lstTer.size() < 1) {
                                        %> 
                                        <h1>No hay ofertas terminadas actualmente.</h1>
                                        <hr>
                                        <a data-toggle="tab" href="#nuevaOferta" class="btn btn-success">Crear nueva oferta</a>
                                        <%        
                                            }else{
                                        %>
                                        <h2>Ofertas terminadas</h2>
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Cliente</th>
                                                        <th>Fecha</th>
                                                        <th>Proyecto</th>
                                                        <th>Empleado</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <% 
                                                    
                                                    for (Oferta o: lstProc) {
                                                        %>
                                                        <tr>
                                                            <td><%= o.getNumCotizacion() %></td>
                                                            <td><%= o.getIdCliente().getNombreCliente() %></td>
                                                            <td><%= o.getFecha() %></td>
                                                            <td><%= o.getProyecto() %></td>
                                                            <td><%= o.getIdEmpleado().getNombres() %></td>
                                                        </tr>
                                                        <%
                                                    }
                                                %>
                                                </tbody>
                                            </table>
                                        </div>
                                    <% } %>
                                    </div>
                                    <div id="aprobadas" class="tab-pane fade">
                                        <%
                                            List<Oferta> lstApro = odao.consultarTipo("Aprobada");
                                            if (lstTer.size() < 1) {
                                        %> 
                                        <h1>No hay ofertas aprobadas actualmente.</h1>
                                        <hr>
                                        <a data-toggle="tab" href="#nuevaOferta" class="btn btn-success">Crear nueva oferta</a>
                                        <%        
                                            }else{
                                        %>
                                        <h2>Ofertas aprobadas</h2>
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Cliente</th>
                                                        <th>Fecha</th>
                                                        <th>Proyecto</th>
                                                        <th>Empleado</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <% 
                                                    
                                                    for (Oferta o: lstProc) {
                                                        %>
                                                        <tr>
                                                            <td><%= o.getNumCotizacion() %></td>
                                                            <td><%= o.getIdCliente().getNombreCliente() %></td>
                                                            <td><%= o.getFecha() %></td>
                                                            <td><%= o.getProyecto() %></td>
                                                            <td><%= o.getIdEmpleado().getNombres() %></td>
                                                        </tr>
                                                        <%
                                                    }
                                                %>
                                                </tbody>
                                            </table>
                                        </div>
                                    <% } %>
                                    </div>
                                </div>
                            </div>
                    </div>   
            </div>
        </div>


        <footer>
            <div style="color:white;" class="navbar navbar-inverse navbar-fixed-bottom">
                <h5>Derechos reservados &copy; - <small>ALU-ARQ, S.A. de C.V.</small></h5>
            </div>                 
        </footer>

        <script src="../bootstrap/js/bootstrap.js">
        <script src="../bootstrapjs/jquery.min.js"></script>
        <script src="../bootstrapjs/bootstrap.min.js"></script>
    </body>
</html>