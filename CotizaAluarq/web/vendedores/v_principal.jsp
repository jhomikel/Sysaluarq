<%-- 
    Document   : v_pprincipal
    Created on : 14-abr-2015, 8:44:40
    Author     : PCVirtual
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ALUARQ S.A. de C.V.</title>
        <meta charset="UTF-8">
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
    </head>
    <%!
    String usr;   
    %>
    <%
    usr = (String)session.getAttribute("username");
    %>
    <body>
        <div class="container">
            <div class="row">
                    <div class="account-wall">
                        <div id="my-tab-content" class="tab-content">
                            <div class="tab-pane active" id="login">
                                <!--Código aquí -->
                                <h1>Bienvenido <%= usr %></h1>
                            </div>
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