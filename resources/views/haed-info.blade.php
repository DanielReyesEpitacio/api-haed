<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <header>
        <h1>Documentacion de API HAED</h1>
    </header>
    <nav>

    </nav>
    <section>
        <h3>Endpoints</h3>
        <div>
            <table>
               <thead>
                    <tr>
                        <th>Endpoint</th>
                        <th>Uso</th>
                    </tr>
               </thead>
               <tbody>
                    @foreach($apiRoutes as $route)
                        <tr>
                            <td>{{$route}}</td>
                            <td><a href="#">Ejemplo</a></td>
                        </tr>
                    @endforeach
               </tbody>
            </table>
        </div>
    </section>
    <footer>
        <center><span>Creado por: <i>Daniel Reyes Epitacio</i></span></center>
    </footer>
</body>
</html>