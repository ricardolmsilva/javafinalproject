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
        <title>Frota - Listagem</title>

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

                            <li class="active">
                                <a href="index.jsp">
                                    <i class="fas fa-table"></i>Frota</a>
                            </li>
                            <li>
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

                                        <li class="active">
                                            <a href="index.jsp">
                                                <i class="fas fa-table"></i>Frota</a>
                                        </li>
                                        <li>
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
                                String situacao = request.getParameter("situacao");

                                if (request.getMethod() == "POST" && request.getParameter("id_delete") != null) {

                                    request.setCharacterEncoding("UTF-8");
                                    String id = request.getParameter("id_delete");

                                    boolean resultado = Database.apagar(id);

                                    if (resultado) {
                            %>

                            <div class="alert alert-success" role="alert">
                                Veiculo apagado com sucesso!
                            </div>

                            <%} else {%>
                            <div class="alert alert-danger" role="alert">
                                Erro ao apagar o veiculo!
                            </div>

                            <%}
                                }

                                if (!(request.getMethod() == "POST" && request.getParameter("situacao") != null)) {

                                    situacao = "all";

                                }
                            %>
                            <div class="row pb-5">
                                <div class="col-md-12">
                                    <!-- DATA TABLE -->

                                    <h3 class="title-5 m-b-35">Frota</h3>
                                    <div class="table-data__tool">
                                        <div class="table-data__tool-left">

                                            <form  action="" method="POST">

                                                <div class="rs-select2--light rs-select2--md">

                                                    <select class="js-select2" name="situacao">
                                                        <option value="all" <%if (situacao.equals("All")) {%>selected=""<%}%>>Todos</option>
                                                        <option value="Estancionado" <%if (situacao.equals("Estancionado")) {%>selected=""<%}%>>Estancionado</option>
                                                        <option value="Avariado" <%if (situacao.equals("Avariado")) {%>selected=""<%}%>>Avariado</option>
                                                        <option value="Na Revisão" <%if (situacao.equals("Na Revisão")) {%>selected=""<%}%>>Na Revisão</option>
                                                        <option value="Em Trânsito" <%if (situacao.equals("Em Trânsito")) {%>selected=""<%}%>>Em Trânsito</option>
                                                    </select>

                                                    <div class="dropDownSelect2"></div>
                                                </div>

                                                <button type="submit" class="au-btn-filter">
                                                    <i class="zmdi zmdi-filter-list"></i>Filtrar
                                                </button>
                                            </form>  
                                        </div>



                                        <div class="table-data__tool-right">
                                            <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                                                <a href="adicionar.jsp">
                                                    <i class="zmdi zmdi-plus"></i>add veiculo
                                                </a>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="table-responsive table-responsive-data2">
                                        <table class="table table-data2">
                                            <thead>
                                                <tr>

                                                    <th>id</th>
                                                    <th>matricula</th>
                                                    <th>situação</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%try {
                                                        List<Camiao> camioes = Database.listar(situacao);

                                                        for (Camiao camiao : camioes) {
                                                %>

                                                <tr class="spacer"></tr>
                                                <tr class="tr-shadow">

                                                    <td><%=camiao.getId()%></td>
                                                    <td><%=camiao.getMatricula()%></td>
                                                    <td><%=camiao.getSituacao()%></td>
                                                    <td>
                                                        <div class="table-data-feature">

                                                            <form action="editar.jsp" method="post" novalidate="novalidate">

                                                                <input name="id" type="hidden" class="form-control" aria-required="true" aria-invalid="false" value="<%=camiao.getId()%>">

                                                                <button type="submit" class="item mx-1" data-toggle="tooltip" data-placement="top" title="Editar">
                                                                    <i class="zmdi zmdi-edit"></i>
                                                                </button>

                                                            </form>

                                                            <form action="" method="post" novalidate="novalidate">

                                                                <input name="id_delete" type="hidden" class="form-control" aria-required="true" aria-invalid="false" value="<%=camiao.getId()%>">
                                                                <input name="situacao" type="hidden" class="form-control" aria-required="true" aria-invalid="false" value="<%=situacao%>">

                                                                <button type="submit" class="item mx-1" data-toggle="tooltip" data-placement="top" title="Remover">
                                                                    <i class="zmdi zmdi-delete "></i>
                                                                </button>

                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <%
                                                    }
                                                %>

                                                <%
                                                    } catch (Exception e) {

                                                        out.println("Exception: " + e.getMessage());

                                                    }
                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- END DATA TABLE -->

                                </div>
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