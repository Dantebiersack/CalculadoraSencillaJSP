<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <title>Calculadora JSP</title>
    </head>
    <body>
        <div class="container text-center">
            <div class="row justify-content-center align-items-center">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <div class="col">
                            <h1>Calculadora JSP</h1>
                            <form method="post">
                                <input type="number" name="num1" required class="m-2">
                                <input type="number" name="num2" required class="m-2"><br>
                                <select class="form-select m-1" name="operacion">
                                    <option value="sumar">+</option>
                                    <option value="restar">-</option>
                                    <option value="multiplicar">*</option>
                                    <option value="dividir">/</option>
                                </select>
                                
                                <button class="btn btn-primary m-2" type="submit">Calcular</button>
                            </form>
                            <label id="resultadoLabel"></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% 
            if (request.getMethod().equals("POST")) {
                double num1 = Double.parseDouble(request.getParameter("num1"));
                double num2 = Double.parseDouble(request.getParameter("num2"));
                String operacion = request.getParameter("operacion");
                double result = 0;
                switch (operacion) {
                    case "sumar":
                        result = num1 + num2;
                        break;
                    case "restar":
                        result = num1 - num2;
                        break;
                    case "multiplicar":
                        result = num1 * num2;
                        break;
                    case "dividir":
                        if (num2 != 0) {
                            result = num1 / num2;
                        } else {
                            out.println("<p>Error: No se puede dividir por cero</p>");
                        }
                        break;
                    default:
                        out.println("<p>Error: Operación no válida</p>");
                        break;
                }
                out.println("<script>document.getElementById('resultadoLabel').innerText = 'Resultado: " + result + "';</script>");
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
