<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Don Isidro Finca - Promoción de Aceite de Oliva</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #3b5323;
            padding: 40px;
            text-align: center;
            color: white;
        }
        header h1 {
            font-size: 3.5em;
            font-family: 'Playfair Display', serif;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: 3px;
            font-weight: 700;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #6b8e23;
            padding: 10px 0;
        }
        nav a {
            color: white;
            text-decoration: none;
            margin: 0 20px;
            font-size: 1.3em;
            text-transform: uppercase;
            font-weight: 600;
            transition: color 0.3s;
        }
        nav a:hover {
            color: #3b5323;
        }
        .container {
            padding: 50px;
            max-width: 1200px;
            margin: auto;
        }
        .product {
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f0f0f0;
        }
        img {
            width: 400px;
        }
        .toggle-button {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: transparent;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            z-index: 1000;
        }
        #menu {
            position: fixed;
            top: 0;
            right: -500px;
            width: 300px;
            height: 100%;
            background-color: #fff;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
            transition: right 0.3s ease;
            padding: 20px;
            z-index: 1000;
            display: flex;
            flex-direction: column;
            justify-content: flex-start; /* Empuja los elementos hacia arriba */
            align-items: center;
        }
        #menu.open {
            right: 0;
        }
        #cart-items {
            list-style: none;
            padding: 0;
            margin: 0;
            margin-bottom: 20px; /* Añade espacio debajo de los artículos del carrito */
        }
        #cart-items li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        #cart-items li span {
            font-size: 16px;
            font-weight: 500;
        }
        button {
            background-color: #126b16;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px; /* Aumenta el tamaño del botón */
            cursor: pointer;
            font-size: 16px; /* Aumenta el tamaño de la fuente */
            transition: background-color 0.2s ease;
            margin-top: 10px;
        }
        button:hover {
            background-color: #083b18;
        }
        #cart-summary {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            text-align: center;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-top: 10px; /* Ajusta el espacio superior para que esté centrado */
        }
        input[type="number"] {
            width: 50px;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-left: 10px;
        }
    </style>
</head>
<body>

    <header>
        <h1>Don Isidro Finca</h1>
    </header>

    <nav>
        <a href="index.html">Inicio</a>
        <a href="compras.html">comprar</a>
        <a href="nosotros.html">nosotros</a>
        <a href="contactos.html">Contactos</a>
    </nav>

    <button class="toggle-button" onclick="toggleMenu()">☰ Carrito</button>

    <!-- Menú deslizante -->
    <div id="menu">
        <!-- Título de Carrito en la parte superior -->
        <h2>Carrito</h2>

        <!-- Lista de productos en el carrito -->
        <ul id="cart-items"></ul>

        <!-- Resumen y Botón de Continuar -->
        <div id="cart-summary">Total: $0</div>
        <button id="continuar" onclick="goToCheckout()">Continuar</button>
    </div>

    <!-- Productos -->
    <main>
        <div class="product">
            <h2>Aceite de Oliva Arauco</h2>
            <img src="images.jpg">
            <p>500 ml - Un sabor único, ideal para tus recetas.</p>
            <p> $15.000</p>
            <input id="cantidad-arauco" type="number" min="1" value="1">
            <button onclick="addToCart('Aceite de Oliva Arauco', 'cantidad-arauco', 15000)">Añadir al carrito</button>
        </div>

        <div class="product">
            <h2>Aceite de Oliva Manzanilla</h2>
            <img src="images.jpg">
            <p>500 ml - Suavidad y aroma para una experiencia inolvidable.</p>
            <p> $15.000</p>
            <input id="cantidad-manzanilla" type="number" min="1" value="1">
            <button onclick="addToCart('Aceite de Oliva Manzanilla', 'cantidad-manzanilla', 15000)">Añadir al carrito</button>
        </div>
    </main>

    <script>
        let cart = [];

        // Función para añadir productos al carrito
        function addToCart(productName, inputId, price) {
            const quantity = parseInt(document.getElementById(inputId).value, 10);
            const product = { name: productName, quantity, price };
            const existingProductIndex = cart.findIndex(item => item.name === productName);

            if (existingProductIndex !== -1) {
                cart[existingProductIndex].quantity += quantity;
            } else {
                cart.push(product);
            }

            updateCart();
        }

        // Función para actualizar el carrito en el menú lateral
        function updateCart() {
            const cartItems = document.getElementById('cart-items');
            cartItems.innerHTML = '';
            let totalPrice = 0;

            cart.forEach(item => {
                const listItem = document.createElement('li');
                listItem.innerHTML = `
                    <span>${item.name} - $${item.price} x ${item.quantity}</span>
                    <button onclick="updateQuantity('${item.name}', -1)">-</button>
                    <button onclick="updateQuantity('${item.name}', 1)">+</button>
                `;
                cartItems.appendChild(listItem);
                totalPrice += item.price * item.quantity;
            });

            document.getElementById('cart-summary').innerText = `Total: $${totalPrice}`;
        }

        // Función para actualizar la cantidad de un producto en el carrito
        function updateQuantity(productName, change) {
            const product = cart.find(item => item.name === productName);
            if (product) {
                product.quantity += change;
                if (product.quantity <= 0) {
                    cart = cart.filter(item => item.name !== productName);
                }
            }
            updateCart();
        }

        // Función para mostrar y ocultar el menú lateral
        function toggleMenu() {
            const menu = document.getElementById('menu');
            menu.classList.toggle('open');
        }

        function goToCheckout() {
             window.location.href = 'finalizar.html';  
            
            }
    </script>
</body>
</html>

