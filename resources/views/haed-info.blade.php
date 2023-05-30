<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <title>Haed API</title>
</head>
<body>
    <div class="container mt-3">
        <header class="container">
            <div class="row">
                <div class="col">
                    <h1>Documentacion API HAED</h1>
                </div>
            </div>
        </header>
        <section class="container mt-3">
            <div class="row mt-3">
                <table class="table">
                   <thead>
                        <tr>
                            <th>Endpoint</th>
                            <th>Tipo</th>
                            <th>Uso</th>
                        </tr>
                   </thead>
                   <tbody>
                        @foreach($apiRoutes as $route)
                        <tr>
                            <td>{{$route['uri']}}</td>
                            <td>{{implode(', ', $route['methods'])}}</td>
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
    </div>
</body>
</html>