<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <link rel="stylesheet" href="CSS/app.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8"/>

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

        <script src="JS/app.js"></script>
        <title>Solicitações</title>
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <table width="100%">
            <tr>
                <td width="40%">
                    <form method="get" action="front">
                        <input type="text" name="nomeLugar" placeholder="Para onde deseja ir?" class="validate">
                        <input type="hidden" name="command" value="BuscarCaronas">
                        <button class="waves-effect waves-light btn s12">Buscar caronas</button>
                        <c:choose>
                            <c:when test="${buscaViagens != null}">

                                <h4>Caronas encontradas</h4><br><hr>
                                <c:forEach var="viagem" items="${buscaViagens}">
                                    <c:if test="${viagem.motorista.email != usuario.email}">
                                        <div class="solicitacoes">
                                            <h5><b>${viagem.partida.nome} - ${viagem.destino.nome}</b></h5>
                                            Motorista: <a href="front?command=BuscaUsuario&buscado=${viagem.motorista.nome}">
                                                ${viagem.motorista.nome}</a>
                                            <br>Data da viagem: ${viagem.data}, às ${viagem.hora} horas
                                            <br>${viagem.vagas} vagas
                                            <br>O nível de conversa desejado é ${viagem.conversa},
                                            <c:choose>
                                                <c:when test="${viagem.fumar eq true}">
                                                    Ṕermitido fumar
                                                </c:when>
                                                <c:otherwise>
                                                    Não é permitido fumar
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${viagem.animais eq true}">
                                                    e é permitido levar animais.
                                                </c:when>
                                                <c:otherwise>
                                                    e não é permitido levar animais.
                                                </c:otherwise>
                                            </c:choose><br>
                                            <button class="waves-effect waves-light btn s12 alinhado">Solicitar</button>
                                            <hr>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                </td>
                <td width="5%"></td>
                <td width="45%">
                    <h4>Solicitações de amizade</h4>
                    <hr>
                    <c:forEach var="solicitacao" items="${solicitacoes}">
                        <c:if test="${solicitacao.tipo eq 'amizade'}">
                            <div class="solicitacoes">
                                <h5><b>${solicitacao.amigo.nome}</b></h5>
                                <a href="front?command=BuscaUsuario&buscado=${solicitacao.amigo.nome}">Ver perfil</a>
                                <button class="waves-effect waves-light btn s12 alinhado">Aceitar</button>

                                <button class="waves-effect waves-light btn s12 alinhado">Recusar</button>
                                <hr>
                            </div>    
                        </c:if>
                    </c:forEach>
                    <br><br>
                    <h4>Solicitações de seguir</h4>
                    <hr>
                    <c:forEach var="solicitacao" items="${solicitacoes}">
                        <c:if test="${solicitacao.tipo eq 'seguir'}">
                            <div class="solicitacoes">
                                <h5><b>${solicitacao.amigo.nome}</b></h5>
                                <a href="front?command=BuscaUsuario&buscado=${solicitacao.amigo.nome}">Ver perfil</a>
                                <button class="waves-effect waves-light btn s12 alinhado">Aceitar</button>
                                <button class="waves-effect waves-light btn s12 alinhado">Recusar</button>
                                <hr>
                            </div>    
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
        </table>
    </body>
</html>