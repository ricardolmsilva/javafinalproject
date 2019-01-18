<%-- 
    Document   : index
    Created on : 13-Jan-2019, 00:08:48
    Author     : ricardosilva
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Database"%>
<%@page import="camiao.Camiao"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Frota - Adicionar</title>

        <!-- Fontfaces CSS-->
        <link href="css/font-face.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/theme.css" rel="stylesheet" media="all">

    </head>

    <body class="animsition">
        <div class="page-wrapper">
            <!-- HEADER MOBILE-->
            <header class="header-mobile d-block d-lg-none">
                <div class="header-mobile__bar">
                    <div class="container-fluid">
                        <div class="header-mobile-inner">
                            <a class="logo" href="index.jsp">
                                <img src="images/icon/logo.png" alt="CoolAdmin" />
                            </a>
                            <button class="hamburger hamburger--slider" type="button">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
                <nav class="navbar-mobile">
                    <div class="container-fluid">
                        <ul class="navbar-mobile__list list-unstyled">

                            <li>
                                <a href="index.jsp">
                                    <i class="fas fa-table"></i>Frota</a>
                            </li>
                            <li class="active">
                                <a href="adicionar.jsp">
                                    <i class="far fa-check-square"></i>Adicionar</a>
                            </li>


                        </ul>
                    </div>
                </nav>
            </header>
            <!-- END HEADER MOBILE-->

            <!-- MENU SIDEBAR-->
            <aside class="menu-sidebar d-none d-lg-block">
                <div class="logo">
                    <a href="#">
                        <img src="images/icon/logo.png" alt="Cool Admin" />
                    </a>
                </div>
                <div class="menu-sidebar__content js-scrollbar1">
                    <nav class="navbar-sidebar">
                        <ul class="list-unstyled navbar__list">
                            <div class="menu-sidebar__content js-scrollbar1">
                                <nav class="navbar-sidebar">
                                    <ul class="list-unstyled navbar__list">

                                        <li>
                                            <a href="index.jsp">
                                                <i class="fas fa-table"></i>Frota</a>
                                        </li>
                                        <li class="active">
                                            <a href="adicionar.jsp">
                                                <i class="far fa-check-square"></i>Adicionar</a>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                        </ul>
                    </nav>
                </div>
                 <div class="pb-5" style="position: absolute;width: 100%;bottom: 0px;">
                      <p style="font-size: 14px; text-align: center;">Copyright © 2018 Ricardo Silva.</p>
                 <p style="font-size: 14px; text-align: center;">All rights reserved.</p>
                </div>
            </aside>
            <!-- END MENU SIDEBAR-->

            <!-- PAGE CONTAINER-->
            <div class="page-container">
                <!-- HEADER DESKTOP-->
                <header class="header-desktop">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="header-wrap">

                                <form class="form-header" action="pesquisar.jsp" method="POST">
                                    <input class="au-input au-input--xl" type="text" name="matricula" placeholder="Pesquisar por matricula" />
                                    <button class="au-btn--submit" type="submit">
                                        <i class="zmdi zmdi-search"></i>
                                    </button>
                                </form>

                            </div>
                        </div>
                    </div>
                </header>
                <!-- END HEADER DESKTOP-->

                <!-- MAIN CONTENT-->
                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">

                            <%
                                request.setCharacterEncoding("UTF-8");
                                String matricula = request.getParameter("matricula");
                                String situacao = request.getParameter("situacao");
                                boolean resultado = true;

                                if (request.getMethod() == "POST" && request.getParameter("adicionar") != null) {

                                    resultado = Database.inserir(matricula, situacao);

                                    if (resultado) {
                            %>

                            <div class="alert alert-success" role="alert">
                                Veiculo adicionado com sucesso!
                            </div>

                            <%} else {%>
                            <div class="alert alert-danger" role="alert">
                                Já existe um veiculo com essa matricula
                            </div>

                            <%}
                                }%>

                            <div class="row">
                                <div class="col">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong>Adicionar</strong>
                                            <small>Veiculo</small>
                                        </div>
                                        <div class="card-body">

                                            <form action="" method="post" novalidate="novalidate">

                                                <div class="form-group">
                                                    <label for="matricula" class="control-label mb-1">Matricula</label>
                                                    <input id="cc-pament" name="matricula" type="text" class="form-control" aria-required="true" aria-invalid="false" value="">
                                                </div>

                                                <div class="form-group">

                                                    <label for="select" class="control-label mb-1">Situação</label>

                                                    <div>
                                                        <select name="situacao" id="select" class="form-control">
                                                            <option value="0" disabled="" selected="">Escolha uma opção</option>
                                                            <option value="Estancionado">Estancionado</option>
                                                            <option value="Avariado">Avariado</option>
                                                            <option value="Na Revisão">Na Revisão</option>
                                                            <option value="Em Trânsito">Em Trânsito</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <hr>    
                                                <div>
                                                    <button id="payment-button" type="submit" class="btn btn-lg btn-info btn-block">
                                                        <i class="far fa-check-square"></i>&nbsp;
                                                        <span id="payment-button-amount">Adicionar</span>
                                                        <span id="payment-button-sending" style="display:none;">Sending…</span>
                                                    </button>
                                                </div>
                                                <input type="hidden" name="adicionar" value="adicionar">
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <%if (request.getMethod() == "POST" && resultado) {%>
                                <div class="col">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong>Detalhes</strong>
                                            <small>Veiculo</small>
                                        </div>
                                        <div class="card-body">


                                            <form action="" method="post" novalidate="novalidate">

                                                <div class="form-group">
                                                    <label for="matricula" class="control-label mb-1">Matricula</label>
                                                    <input id="cc-pament" name="matricula" type="text" class="form-control" aria-required="true" aria-invalid="false" value="<%=request.getParameter("matricula")%>" disabled>
                                                </div>

                                                <div class="form-group">
                                                    <label for="matricula" class="control-label mb-1">Situação</label>
                                                    <input id="cc-pament" name="matricula" type="text" class="form-control" aria-required="true" aria-invalid="false" value="<%=request.getParameter("situacao")%>" disabled>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                                <%}%>

                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Jquery JS-->
        <script src="vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="vendor/slick/slick.min.js">
        </script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/animsition/animsition.min.js"></script>
        <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="vendor/circle-progress/circle-progress.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="vendor/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="js/main.js"></script>

    </body>

</html>
<!-- end document-->

