<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>ALUARQ S.A. de C.V.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imagenes/icono-gestion.png" type="image/ico" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css"/>
        <link href="estilo.css" rel="stylesheet">

        <link href="bootstrap/css/style1.css" rel="stylesheet">

        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="bootstrap/css/navbar-fixed-top.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="bootstrap/css/signin.css" rel="stylesheet">
        <link rel="stylesheet" href="estilo.css" type="text/css" />
    </head>
    <%
        if (request.getAttribute("msj") != null) {
            out.print("<script languaje=javascript>alert('" + request.getAttribute("msj") + "')</script>");
        }
    %>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <div class="account-wall">
                        <div id="my-tab-content" class="tab-content">
                            <div class="tab-pane active" id="login">
                                <img class="profile-img" src="imagenes/Logo.jpg" alt="">
                                <form class="form-signin" role="form" data-toggle="validator" name="frmLogin" action="EmpleadoCTRL" method="POST">
                                    <p>
                                        <input type="text" name="txtCorreo" class="form-control" placeholder="Correo" required autofocus>
                                    </p>
                                    <p>
                                        <input type="password" name="txtPassword" class="form-control" placeholder="Contraseña" required>

                                        </select>
                                        <br>
                                        <input type="submit" name="btnLogin" class="btn btn-lg btn-primary btn-block" name="login" id="login" value="Login" />
                                </form>  
                            </div>
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

        <script src="bootstrap/js/bootstrap.js">
        <script src="bootstrapjs/jquery.min.js"></script>
        <script src="bootstrapjs/bootstrap.min.js"></script>
    </body>
</html>
