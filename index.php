<?php
include_once('./herramientas/conexion.php');

// Preparar la consulta para obtener los nombres de las categorías
$sqlCategorias = "SELECT nombre_categoria FROM tbl_categorias";

try {
    // Preparar la consulta SQL
    $stmt = $pdo->prepare($sqlCategorias);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener los resultados como un array asociativo
    $categorias = $stmt->fetchAll(PDO::FETCH_ASSOC);
} 

catch (PDOException $e) {
    // Manejar errores de la base de datos
    echo "Error al obtener las categorías: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" href="./css/index.css">
        <!-- Icono -->
        <link rel="stylesheet" href="">
        <!-- Título -->
        <title>Sanetta Food Products</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">
                <img src="./img/logo_sanetta.png" alt="Logo Sanetta" style="width: 30px; height: 30px;">
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pastelería Castillo <span class="sr-only">(current)</span></a>
                    </li>
                </ul>

                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-box-arrow-right"></i></a>
                    </li>
                </ul>
            </div>
        </nav>

        <form class="form-inline">
            <div class="form-group">
                <input type="email" class="form-control" id="buscar_producto" placeholder="Buscar producto...">
            </div>

            <div class="form-group mr-2">
                <div id="select-categoria"></div>
                <select class="form-control categoria" id="select_categoria">
                    <option value="" style="font-weight: bolder;" selected disabled>Categoría</option>
                    <option value="">Mostrar todos</option>
                    <?php
                    foreach ($categorias as $categoria) {
                        echo '<option value="' . $categoria['id'] . '">' . $categoria['nombre_categoria'] . '</option>';
                    }
                    ?>
                </select>

                <select class="form-control" id="select_azucar">
                    <option value="" style="font-weight: bolder;" selected disabled>Azúcar</option>
                    <option value="">Mostrar todos</option>
                    <option>Con</option>
                    <option>Sin</option>
                </select>
            </div>

            <button type="button" class="btn btn-primary">Añadir producto</button>
        </form>

        <div id="resultado_productos"></div>
    
        <script src="./js/index.js"></script>
    </body>
</html>