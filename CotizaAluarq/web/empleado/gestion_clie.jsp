<%-- 
    Document   : e_principal
    Created on : 04-17-2015, 03:53:36 PM
    Author     : Luis Melendez
--%>

<%@page import="uml.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
     <title>ALUARQ S.A. de C.V.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="../imagenes/icono-gestion.png" type="image/ico">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link href="../estilo.css" rel="stylesheet">

        <link href="../bootstrap/css/style1.css" rel="stylesheet">

        <!-- Bootstrap core CSS -->
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../bootstrap/css/navbar-fixed-top.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../bootstrap/css/signin.css" rel="stylesheet">
        <link rel="stylesheet" href="../estilo.css" type="text/css">
        <script type="text/javascript">
          function doSearch()
                  {
                    var tableReg = document.getElementById('datos');
                    var searchText = document.getElementById('searchTerm').value.toLowerCase();
                    var cellsOfRow="";
                    var found=false;
                    var compareWith="";

                    // Recorremos todas las filas con contenido de la tabla
                    for (var i = 1; i < tableReg.rows.length; i++)
                    {
                      cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
                      found = false;
                      // Recorremos todas las celdas
                      for (var j = 0; j < cellsOfRow.length && !found; j++)
                      {
                        compareWith = cellsOfRow[j].innerHTML.toLowerCase();
                        // Buscamos el texto en el contenido de la celda
                        if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1))
                        {
                          found = true;
                        }
                      }
                      if(found)
                      {
                        tableReg.rows[i].style.display = '';
                      } else {
                        // si no ha encontrado ninguna coincidencia, esconde la
                        // fila de la tabla
                        tableReg.rows[i].style.display = 'none';
                      }
                    }
                  }
        </script>
        <script>
            function cargar(id, nom, aten, dire, tel, movil, correo){
                document.frmDatos.txtID.value = id;
                document.frmDatos.txtnombre.value = nom;
                document.frmDatos.txtaten.value = aten;
                document.frmDatos.txtdire.value = dire;
                document.frmDatos.txttel.value = tel;
                document.frmDatos.txtmovil.value = movil;
                document.frmDatos.txtcorreo.value = correo
                }
        </script>    
        <style type="text/css">
        .container{
          height: auto;
        }
        #scroll{
          overflow-y: scroll;
          width: auto;
          height: 400px;
        }
        body{
            color:#000; 
        }
        </style>
  </head>
  <%
      ClienteDAO cdao = new ClienteDAO();
  %>
  <body>
      <!-- ############# MENU PRINCIPAL ##############  -->
      <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">ALUARQ S.A. de C.V.</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" bgcolor="black">
          <ul class="nav navbar-nav">
              <li><a href="../administrador/gestion_emp.jsp">Empleados</a></li>
              <li class="active"><a href="gestion_clie.jsp">Clientes</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
      
      <!-- ############# TABLA DE INFORMACION DEL CLIENTE ##############  -->
      <div class="container">
    <br>
    <br>
    <br>
    <div class="panel panel-primary"> 
    <div class="panel-heading"><h3 align="center">Clientes</h3></div>
    <form class="navbar-form" role="search" style="text-align: right">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Buscar" id="searchTerm" onkeyup="doSearch()">
        </div>
    </form>
    <div id="scroll">
      <table class="table table-hover" id="datos" style="text-align: center">
       
      <thead>
        <tr>
          <th style="text-align: center; width:200px ">ID </th>
          <th style="text-align: center; width:300px ">Nombres Cliente</th>
          <th style="text-align: center; width:300px">Atencion</th>
          <th style="text-align: center; width:300px">Direccion</th>
          <th style="text-align: center; width:300px">Telefono</th>
          <th style="text-align: center; width:300px">Movil</th> 
          <th style="text-align: center; width:300px">Correo</th>
          <th style="text-align: center; width:300px">Cargar</th>                    
        </tr>
      </thead>
      <tbody>
        <%
            List<Cliente> lst = cdao.consultar();
            for(Cliente cl : lst){
        %>  
              <tr>
                  <td><%= cl.getIdCliente()%></td>
                  <td><%= cl.getNombreCliente()%></td>
                  <td><%= cl.getAtencion()%></td>
                  <td><%= cl.getDireccion()%></td>
                  <td><%= cl.getTelefon()%></td>
                  <td><%= cl.getMovil()%></td>
                  <td><%= cl.getCorreo()%></td>
                  <td><button type="button" onclick="cargar('<%= cl.getIdCliente()%>', '<%= cl.getNombreCliente()%>', '<%= cl.getAtencion()%>', '<%= cl.getDireccion()%>', '<%= cl.getTelefon()%>', '<%= cl.getMovil()%>', '<%= cl.getCorreo()%>')" class="btn btn-lg btn-success" data-toggle="modal" data-target="#basicModal1">Actualizar</button></td>
              </tr>
      <%
            }
      %>
      <h2>${Resp}</h2>
      </tbody>
      </table>
    </div>
    </div>
        <div id="lounch">
            <div class="row text-center">
              <button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#basicModal">Insertar</button>
            </div>
         </div>
    </div>
    <!--#################### POP UP PARA AGREAGAR CLIENTES ####################-->
    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">Insertar Cliente</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal" data-toggle="validator" action="../ClienteCTRL" method="POST">
              <div class="form-group">
                  <label class="control-label col-xs-3">Id:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Id Cliente" name="id" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Nombres:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Nombres" name="nombre" required>
                  </div>
              </div>
               <div class="form-group">
                  <label class="control-label col-xs-3">Atencion:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Atencion" name="aten" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Direcci&oacute;n:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Direcci&oacute;n" name="dire" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Telefono:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control"  placeholder="Telefono"  name="tel"  required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Movil:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Movil" name="movil" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Correo:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Correo" name="correo" required>
                  </div>
              </div>
              <br>
              <div class="modal-footer">
              <div class="form-group">
                  <div class="col-xs-offset-3 col-xs-9">
                      <input type="submit" class="btn btn-primary" value="Insertar" id="insertar" name="insertar">
                      <input type="reset" class="btn btn-default" value="Limpiar">
                  </div>
              </div>
              </div>
          </form>
          </div>
        </div>
      </div>
    </div>
    <!--#################### POP UP PARA ACTUALIZAR Y ELIMINAR CLIENTES ####################--> 
    <div class="modal fade" id="basicModal1" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">Actualizar Cliente</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" data-toggle="validator" name="frmDatos" action="../ClienteCTRL" method="POST">
              <div class="form-group">
                  <label class="control-label col-xs-3">ID:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeho lder="ID" id="txtID" name="txtID" readonly="readonly" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Nombres:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Nombres" name="txtnombre" required>
                  </div>
              </div>
               <div class="form-group">
                  <label class="control-label col-xs-3">Atencion:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Atencion" name="txtaten" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Direcci&oacute;n:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Direcci&oacute;n" name="txtdire" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Telefono:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control"  placeholder="Telefono"  name="txttel"  required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Movil:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Movil" name="txtmovil" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Correo:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Correo" name="txtcorreo" required>
                  </div>
              </div>
              <br>
              <div class="modal-footer">
              <div class="form-group">
                  <div class="col-xs-offset-3 col-xs-9">
                      <input type="submit" class="btn btn-primary" value="Actualizar" name="modificar" id="modificar">
                      <input type="submit" class="btn btn-primary" value="Eliminar" name="eliminar" id="eliminar">
                  </div>
              </div>
              </div>
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
        <script src="../bootstrap/js/bootstrap.js"></script>
        <script src="../bootstrap/js/jquery.min.js"></script>
        <script src="../sbootstrap/js/bootstrap.min.js"></script>
        <script src="../bootstrap/js/bootstrap.js"></script>
        <script src="../bootstrap/js/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
