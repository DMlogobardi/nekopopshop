<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="jakarta.servlet.http.HttpSession, jakarta.servlet.http.Cookie"%>
<%@ page import="java.util.logging.Logger" %>
<%
    // Crea il logger
    Logger logger = Logger.getLogger("MyLogger");

    HttpSession s = request.getSession(false);
    boolean isLoggedIn = false;
    String access = "";

    if (s != null) {
        Object token = s.getAttribute("logToken");
        if (token == null) {
            isLoggedIn = true;
        } else {
            access = token.toString();
        }
    }

    if (isLoggedIn) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("access".equals(cookie.getName())) {
                    cookie.setValue("");
                    cookie.setMaxAge(1);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                    return;
                }
            }
        }
    } else {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("access".equals(cookie.getName())) {
                    if(!cookie.getValue().equals(access))
                        if(access.equals("A"))
                            cookie.setValue("admin");
                        else
                            cookie.setValue("user");
                }
            }
        }
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - NekoPop Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/login.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'nekopink': '#FBD8DA',
                        'nekopeach': '#E55458',
                        'nekobeige': '#F2D5BB',
                        'nekoorange': '#F29966',
                        'nekored': '#F24535'
                    },
                    fontFamily: {
                        'nunito': ['Nunito', 'sans-serif']
                    }
                }
            }
        }
    </script>

</head>
<body class="min-h-screen flex items-center justify-center p-4">
<!-- Background Overlay -->
<div class="bg-overlay"></div>

<!-- Petals Animation -->
<div id="petals-container"></div>

<!-- Login Container -->
<div class="login-box w-full max-w-md p-8 relative z-10">
    <!-- Cat ears decoration -->
    <div class="cat-ears absolute -top-6 left-1/2 transform -translate-x-1/2 w-12 h-12"></div>

    <div class="text-center mb-8">
        <h1 class="cat-face text-4xl font-bold text-nekopeach mb-2">
            <i class="fas fa-book mr-2"></i>NekoPop Shop
        </h1>
        <p class="cat-nose text-nekopeach text-lg">Il tuo shop di manga e action figure</p>
    </div>

    <!-- Mostra messaggi di errore -->
    <c:if test="${not empty errors}">
        <div class="error-message">
            <c:forEach var="error" items="${errors}">
                ${error}<br>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="error-message">
            <c:forEach var="err" items="${error}">
                ${err}<br>
            </c:forEach>
        </div>
    </c:if>

    <div class="bg-white bg-opacity-90 rounded-2xl p-6 mb-6 shadow-md">
        <form id="loginForm" method="POST" action="login" class="space-y-5">
            <div>
                <label class="block text-nekopeach font-medium mb-2" for="nick">
                    <i class="fas fa-user mr-2"></i>Nickname
                </label>
                <div class="relative">
                    <input
                            type="text"
                            id="nick"
                            name="nick"
                            required
                            class="form-input w-full px-4 py-3 pl-10 rounded-xl border-2 border-beige focus:border-nekopeach focus:outline-none"
                            placeholder="Il tuo nickname..."
                    >
                    <span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-arancio">
                            <i class="fas fa-user"></i>
                        </span>
                </div>
            </div>

            <div>
                <label class="block text-nekopeach font-medium mb-2" for="pass">
                    <i class="fas fa-lock mr-2"></i>Password
                </label>
                <div class="relative">
                    <input
                            type="password"
                            id="pass"
                            name="pass"
                            required
                            class="form-input w-full px-4 py-3 pl-10 rounded-xl border-2 border-beige focus:border-nekopeach focus:outline-none"
                            placeholder="La tua password..."
                    >
                    <span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-arancio">
                            <i class="fas fa-lock"></i>
                        </span>
                </div>
            </div>

            <div class="flex items-center justify-between">
                <div class="flex items-center">
                    <input
                            type="checkbox"
                            id="remember"
                            class="w-4 h-4 text-nekopeach rounded focus:ring-0"
                    >
                    <label for="remember" class="ml-2 text-nekopeach text-sm">Ricordami</label>
                </div>
                <a href="#" class="text-nekoorange text-sm hover:text-nekopeach transition">
                    Password dimenticata?
                </a>
            </div>

            <button type="submit" class="btn-login w-full py-3 rounded-full text-white font-bold text-2xl">
                Accedi <i class="fas fa-sign-in-alt ml-2"></i>
            </button>
        </form>
    </div>

    <div class="text-center">
        <p class="text-nekopeach">
            Non hai un account?
            <a href="register.jsp" class="text-nekoorange font-bold hover:text-nekopeach transition">
                <span class="underline">Registrati</span>
            </a>
        </p>
    </div>

    <div class="text-center mt-4">
        <p class="text-sm text-nekopeach">
            Creato con <span class="text-rosso">❤️</span> per gli amanti dei manga
            <span class="text-rosso">🐈</span>
            <span class="text-rosso">🐈</span>
        </p>
    </div>
</div>

<script>
    // Create cherry blossom petals
    function createPetals() {
        const petalsContainer = document.getElementById('petals-container');
        const petalCount = 30;
        const colors = ['#FBD8DA', '#E55458', '#F2D5BB', '#F29966', '#F24535'];

        for (let i = 0; i < petalCount; i++) {
            const petal = document.createElement('div');
            const size = Math.random() * 20 + 8; // 8px to 28px

            // Position
            const left = Math.random() * 100;
            petal.style.left = `${left}vw`;

            // Size
            petal.style.width = `${size}px`;
            petal.style.height = `${size*0.7}px`;

            // Colors
            const bgColor = colors[Math.floor(Math.random() * colors.length)];
            petal.style.backgroundColor = bgColor;

            // Shape
            const shape = Math.random();
            if (shape < 0.2) {
                petal.style.borderRadius = '50% 50% 0 50%';
            } else if (shape < 0.4) {
                petal.style.borderRadius = '50%';
            } else {
                petal.style.borderRadius = '30% 70% 70% 30% / 30% 30% 70% 70%';
            }

            // Rotation
            const rotate = Math.random() * 360;
            petal.style.transform = `rotate(${rotate}deg)`;

            // Animation
            const animationDuration = Math.random() * 15 + 10; // 10s to 25s
            const delay = Math.random() * 8;
            const swayDuration = Math.random() * 3 + 2; // 2s to 5s

            petal.style.animationDuration = `${animationDuration}s, ${swayDuration}s`;
            petal.style.animationDelay = `${delay}s, ${Math.random() * 3}s`;
            petal.classList.add('petal');

            petalsContainer.appendChild(petal);
        }
    }

    // Initialize particles and other effects
    document.addEventListener('DOMContentLoaded', () => {
        createPetals();

        // Animate form inputs on focus
        const inputs = document.querySelectorAll('input');
        inputs.forEach(input => {
            input.addEventListener('focus', () => {
                input.parentElement.classList.add('ring-2', 'ring-rosa-scuro', 'ring-opacity-50');
                input.parentElement.classList.add('rounded-lg');
            });

            input.addEventListener('blur', () => {
                input.parentElement.classList.remove('ring-2', 'ring-rosa-scuro', 'ring-opacity-50');
            });
        });

        // Form submission handler
        /* document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();

            const form = this;
            const formData = new FormData(form);
            const submitButton = form.querySelector('button[type="submit"]');

            submitButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Accesso in corso...';
            submitButton.disabled = true;

            fetch(form.action, {
                method: 'POST',
                body: new URLSearchParams(formData),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                }
            })
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    }
                    throw new Error('Network response was not ok');
                })
                .then(data => {
                    if (data.status === "success") {
                        window.location.href = 'index.jsp';
                    } else {
                        window.location.reload();
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    window.location.reload();
                });
        }); */
    });
</script>
</body>
</html>