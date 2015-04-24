<%-- 
    Document   : gestion_emp
    Created on : 04-18-2015, 10:48:47 PM
    Author     : Angel
--%>
<%@page import="java.util.List"%>
<%@page import="uml.Empleado"%>
<%@page import="modeloDAO.EmpleadoDAO"%>
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
        
        <!-- Progres Bar -->
        <link href="../bootstrap/css/pace.css" rel="stylesheet">
        <script src="../bootstrap/js/pace.min.js"></script>
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
            function cargar(id, nom, ape, correo, contra, rol){
                document.frmDatos.txtID.value = id;
                document.frmDatos.nombres.value = nom;
                document.frmDatos.apellidos.value = ape;
                document.frmDatos.correo.value = correo;
                document.frmDatos.contra.value = contra;
                document.frmDatos.rol.value = rol;
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
      EmpleadoDAO edao = new EmpleadoDAO();
  %>
  <body>
      <div class="contenedor"></div>
    <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="margin-top:-15px;">
                <img alt="Brand" width="45" height="45" src="../imagenes/navbar-logo.png">
            </a>
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
            <li class="active"><a href="gestion_emp.jsp">Empleados</a></li>
            <li><a href="../empleado/gestion_clie.jsp">Clientes</a></li>
          </ul>
          <!--<form class="navbar-form navbar-right" role="form">
            <?php echo "<a class='btn btn-default' disabled='disabled'>" .$_SESSION['rol']. "</a>"; ?>&nbsp;&nbsp;<a type="submit" class="btn btn-success" href="../php_mantenimiento/cerrar.php">Cerrar Sesi&oacute;n</a>
          </form>-->
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container"> 
    <br>
    <br>
    <br>
    <div class="panel panel-primary"> 
    <div class="panel-heading"><h3 align="center">Empleados</h3></div>
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
          <th style="text-align: center; width:300px ">Nombres</th>
          <th style="text-align: center; width:300px">Apellidos</th>
          <th style="text-align: center; width:300px">Correo</th>
          <th style="text-align: center; width:300px">Contrase&ntilde;a</th>
          <th style="text-align: center; width:300px">Rol</th> 
          <th style="text-align: center; width:300px">Cargar</th>                    
        </tr>
      </thead>
      <tbody>
        <%
            List<Empleado> lst = edao.consultar();
            for(Empleado e : lst){
        %>  
              <tr>
                  <td><%= e.getIdEmpleado() %></td>
                  <td><%= e.getNombres() %></td>
                  <td><%= e.getApellidos() %></td>
                  <td><%= e.getCorreo() %></td>
                  <td><%= e.getContrasenya() %></td>
                  <td><%= e.getRol() %></td>
                  <td><button type="button" onclick="cargar('<%= e.getIdEmpleado() %>', '<%= e.getNombres() %>', '<%= e.getApellidos() %>', '<%= e.getCorreo() %>', '<%= e.getContrasenya() %>', '<%= e.getRol() %>')" class="btn btn-lg btn-success" data-toggle="modal" data-target="#basicModal1">Actualizar</button></td>
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
      <br>
    <!--#################### POP UP PARA AGREAGAR EMPLEADOS ####################-->
    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">Insertar Empleado</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal" data-toggle="validator" action="../EmpleadoCTRL" method="POST">
              <div class="form-group">
                  <label class="control-label col-xs-3">Id:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Id Empleado" name="id" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Nombres:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Nombres" name="nombres" required>
                  </div>
              </div>
               <div class="form-group">
                  <label class="control-label col-xs-3">Apellidos:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Apellidos" name="apellidos" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Correo:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Correo" name="correo" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Contrase&ntilde;a</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control"  placeholder="Contrase&ntilde;a"  name="contra"  required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Rol:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Rol" name="rol" required>
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
    <!--#################### POP UP PARA ACTUALIZAR EMPLEADOS ####################--> 
    <div class="modal fade" id="basicModal1" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">Actualizar Empleado</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" data-toggle="validator" name="frmDatos" action="../EmpleadoCTRL" method="POST">
              <div class="form-group">
                  <label class="control-label col-xs-3">ID:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeho lder="ID" id="txtID" name="txtID" readonly="readonly" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Nombres:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Nombres" id="nombres" name="nombres" required>
                  </div>
              </div>
               <div class="form-group">
                  <label class="control-label col-xs-3">Apellidos:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Apellidos" id="apellidos" name="apellidos" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Correo:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Correo" id="correo" name="correo" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Contrase&ntilde;a</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Contrase&ntilde;" id="contra" name="contra" required>
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label col-xs-3">Rol:</label>
                  <div class="col-xs-9">
                      <input type="text" class="form-control" placeholder="Rol" id="rol" name="rol" required>
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
            <div style="color:white;" class="navbar navbar-inverse navbar-fixed-bottom">
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
