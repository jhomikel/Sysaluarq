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
        <link rel="stylesheet" href="../bootstrap/datepicker/css/bootstrap-datepicker.css" type="text/css" />
        <script type="text/javascript" src="../bootstrap/datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="../bootstrap/js/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>

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
                      <li class="active"><a href="#">En proceso</a></li>
                      <li><a href="#">Terminadas</a></li>
                      <li><a href="#">Aprobadas</a></li>
                      <li><a href="v_nuevo.jsp">Nueva oferta</a></li>
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