<%-- 
    Document   : calendar
    Created on : 15 de mar. de 2021, 21:43:32
    Author     : BirseneK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int year = 0, month = 0, date = 1, weekDay= 0, day = 1, totDays = 30, i = 0, currentYear = 0, currentMonth = 0; 
    String errorMessage = null;
    try
    {
        year = Integer.parseInt(request.getParameter("year"));
        month = Integer.parseInt(request.getParameter("month"));
        if (month > 12)
        {
            month = 1;
            year++;
        }
        if (month < 1)
        {
            month = 12;
            year--;
        }
    }
    catch (Exception ex)
    {
        errorMessage = "Erro na leitura dos parâmetros.";
    }
    //segundo a documentação, year = year-1900, month de 0 a 11, date = dia do mês 
    //este método está deprecated e substituido pela classe Calendar()
    java.util.Date calendar = new java.util.Date(year-1900, month-1, date);
    currentYear = year;
    currentMonth = month;
    //getDay = dia da semana 0 = domingo
    weekDay = calendar.getDay();

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table th {
                padding: 5px;
            }
            
            #calendarStyle {
                display:flex;
                flex-direction: column;
                align-items: center;
            }
            
            header {
                width: 402px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            button {
                padding: 5px;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <a href="index.html">Voltar</a>
        <h1>Calendário</h1>
        <div id="calendarStyle">
            <header>
                <form action="calendar.jsp">
                    <input type="hidden" name="year" value="<%=year%>">
                    <input type="hidden" name="month" value="<%=month-1%>">
                    <input type="submit" value="Anterior">
                </form>
                
                <h2>
                    <%     
                        switch(currentMonth)
                        {
                            case 1:
                                out.println("Janeiro");
                                totDays = 31;
                                break;
                            case 2:
                                out.println("Fevereiro");
                                //regra para bissexto
                                   if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
                                    {
                                        totDays = 29;
                                    } 
                                    else
                                   {
                                       totDays = 28;
                                   }
                                break;
                            case 3:
                                out.println("Março");
                                totDays = 31;
                                break;
                            case 4:
                                out.println("Abril");
                                break;
                            case 5:
                                out.println("Maio");
                                totDays = 31;
                                break;
                            case 6:
                                out.println("Junho");
                                break;
                            case 7:
                                out.println("Julho");
                                totDays = 31;
                                break;
                            case 8:
                                out.println("Agosto");
                                totDays = 31;
                                break;
                            case 9:
                                out.println("Setembro");
                                break;
                            case 10:
                                out.println("Outubro");
                                totDays = 31;
                                break;
                            case 11:
                                out.println("Novembro");
                                break;
                            case 12:
                                out.println("Dezembro");
                                totDays = 31;
                                break;
                            default:
                                break;
                        } %>
                        <%= currentYear %>
                </h2>
                
                <form action="calendar.jsp">
                    <input type="hidden" name="year" value="<%=year%>">
                    <input type="hidden" name="month" value="<%=month+1%>">
                    <input type="submit" value="Seguinte">
                </form>
                                
            </header>    
            <div>
                <table border="1" style="border-collapse: collapse;">
                    <tr>
                        <th>Domingo</th>
                        <th>Segunda-feira</th>
                        <th>Terça-feira</th>
                        <th>Quarta-feira</th>
                        <th>Quita-feira</th>
                        <th>Sexta-feira</th>
                        <th>Sábado</th>
                    </tr>
                    <%--Primeira linha --%>
                    <tr>
                        <% for(int j = 0; j < 7; j++)
                        {%>    
                            <% if( j < weekDay) 
                            {%>
                                <td></td> 
                            <%} 
                            else
                            {%>
                                <td><%= day++ %></td> 
                            <%}%>
                        <%}%>
                    </tr>

                    <%--Próximas linhas --%>
                    <% for (i = 0 ; i < 5; i++) 
                    {%>
                        <tr>
                            <% for(int j = 0; j < 7; j++)
                            {%>  
                                <% if (day <= totDays)
                                {%>
                                    <td><%= day++ %></td>
                                <%}%>
                            <%}%>
                        </tr>
                    <%}%>

                </table>
            </div>
        </div>
    </body>
</html>
