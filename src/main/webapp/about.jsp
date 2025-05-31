<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NekoPopShop - Chi Siamo</title>
    <style>
        /* Stili ereditati da index.jsp */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #2c3e50;
            color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #ecf0f1;
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            gap: 20px;
        }
        
        .nav-links a {
            color: #ecf0f1;
            text-decoration: none;
            font-weight: 500;
        }
        
        .user-section {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .cart-icon, .profile-icon {
            color: #ecf0f1;
            cursor: pointer;
            font-size: 20px;
            text-decoration: none;
        }
        
        /* Stili specifici per la pagina about */
        .about-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }
        
        .about-header {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .about-header h1 {
            font-size: 2.5rem;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        
        .about-header p {
            font-size: 1.2rem;
            color: #7f8c8d;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .about-section {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            margin-bottom: 60px;
            align-items: center;
        }
        
        .about-section.reverse {
            flex-direction: row-reverse;
        }
        
        .about-image {
            flex: 1;
            min-width: 300px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .about-image img {
            width: 100%;
            height: auto;
            display: block;
        }
        
        .about-content {
            flex: 1;
            min-width: 300px;
        }
        
        .about-content h2 {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        
        .about-content p {
            line-height: 1.6;
            margin-bottom: 20px;
            font-size: 1.1rem;
        }
        
        .team-section {
            text-align: center;
            margin: 80px 0;
        }
        
        .team-section h2 {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 50px;
        }
        
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }
        
        .team-member {
            background: white;
            border-radius: 10px;
            padding: 30px 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        
        .team-member:hover {
            transform: translateY(-10px);
        }
        
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 20px;
            border: 5px solid #ecf0f1;
        }
        
        .team-member h3 {
            margin: 0;
            color: #2c3e50;
        }
        
        .team-member p.position {
            color: #3498db;
            font-weight: bold;
            margin: 5px 0;
        }
        
        .values-section {
            background-color: #2c3e50;
            color: white;
            padding: 60px 0;
            margin: 60px 0;
        }
        
        .values-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .values-header {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .values-header h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }
        
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .value-card {
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
        }
        
        .value-card i {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #3498db;
        }
        
        .value-card h3 {
            margin: 0 0 15px;
        }
        
        .contact-section {
            max-width: 800px;
            margin: 0 auto 60px;
            text-align: center;
        }
        
        .contact-section h2 {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        
        .contact-info {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }
        
        .contact-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .contact-item i {
            font-size: 1.5rem;
            color: #3498db;
        }
    </style>
    <!-- Font Awesome per le icone -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <div class="header">
        <a href="index.jsp" class="logo">NekoPopShop</a>
        
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="catalog.jsp">Catalogo</a>
            <a href="about.jsp" class="active">Chi Siamo</a>
        </div>
        
        <div class="user-section">
            <c:choose>
                <c:when test="${not empty sessionScope.logToken}">
                    <c:choose>
                        <c:when test="${sessionScope.logToken == 'A'}">
                            <a href="admin.jsp" class="profile-icon"><i class="fas fa-user-shield"></i></a>
                        </c:when>
                        <c:otherwise>
                            <a href="profile.jsp" class="profile-icon"><i class="fas fa-user"></i></a>
                        </c:otherwise>
                    </c:choose>
                    <a href="cart.jsp" class="cart-icon"><i class="fas fa-shopping-cart"></i></a>
                    <a href="logout" style="color: #ecf0f1;"><i class="fas fa-sign-out-alt"></i></a>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="profile-icon"><i class="fas fa-sign-in-alt"></i></a>
                    <a href="register.jsp" class="cart-icon"><i class="fas fa-user-plus"></i></a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <!-- Contenuto principale -->
    <div class="about-container">
        <!-- Sezione introduttiva -->
        <div class="about-header">
            <h1>La tua Passione per i Manga, la Nostra Missione</h1>
            <p>NekoPopShop è più di un semplice negozio di manga. Siamo una comunità di appassionati dedicata a portare le migliori storie direttamente a te.</p>
        </div>
        
        <!-- Storia del negozio -->
        <div class="about-section">
            <div class="about-image">
                <img src="images/store.jpg" alt="Il nostro negozio fisico">
            </div>
            <div class="about-content">
                <h2>La Nostra Storia</h2>
                <p>Fondato nel 2010 da un gruppo di amici appassionati di manga, NekoPopShop è nato come un piccolo negozio nel cuore della città. Ciò che iniziò come un hobby condiviso si è trasformato in una vera e propria passione per condividere le storie che amiamo con altri fan.</p>
                <p>Oggi, con due negozi fisici e una piattaforma online in costante crescita, continuiamo a mantenere lo stesso spirito di comunità e la stessa attenzione alla qualità che ci hanno contraddistinto fin dall'inizio.</p>
            </div>
        </div>
        
        <!-- Sezione missione -->
        <div class="about-section reverse">
            <div class="about-image">
                <img src="images/manga-collection.jpg" alt="La nostra collezione di manga">
            </div>
            <div class="about-content">
                <h2>La Nostra Missione</h2>
                <p>Il nostro obiettivo è semplice: fornire ai fan dei manga l'accesso alle migliori storie, con un servizio attento e una cura maniacale per i dettagli.</p>
                <p>Ci impegniamo a:</p>
                <ul style="line-height: 1.6; font-size: 1.1rem;">
                    <li>Offrire la più vasta selezione di manga, dai classici alle ultime novità</li>
                    <li>Mantenere prezzi accessibili senza compromessi sulla qualità</li>
                    <li>Creare una comunità dove i fan possano condividere la loro passione</li>
                    <li>Fornire un servizio clienti eccezionale, online e nei nostri negozi fisici</li>
                </ul>
            </div>
        </div>
        
        <!-- Sezione valori -->
        <div class="values-section">
            <div class="values-container">
                <div class="values-header">
                    <h2>I Nostri Valori</h2>
                    <p>Questi sono i principi che guidano ogni nostra decisione</p>
                </div>
                
                <div class="values-grid">
                    <div class="value-card">
                        <i class="fas fa-heart"></i>
                        <h3>Passione</h3>
                        <p>Condividiamo la stessa passione per i manga che ci spinge a offrire sempre il meglio</p>
                    </div>
                    
                    <div class="value-card">
                        <i class="fas fa-award"></i>
                        <h3>Qualità</h3>
                        <p>Selezioniamo solo i migliori prodotti per garantire la massima soddisfazione</p>
                    </div>
                    
                    <div class="value-card">
                        <i class="fas fa-users"></i>
                        <h3>Comunità</h3>
                        <p>Crediamo nel potere delle storie di unire le persone e creare connessioni</p>
                    </div>
                    
                    <div class="value-card">
                        <i class="fas fa-lightbulb"></i>
                        <h3>Innovazione</h3>
                        <p>Cerchiamo costantemente nuovi modi per migliorare la tua esperienza</p>
                    </div>
                    
                    <div class="value-card">
                        <i class="fas fa-hand-holding-heart"></i>
                        <h3>Integrità</h3>
                        <p>Onestà e trasparenza sono alla base di ogni nostra relazione</p>
                    </div>
                    
                    <div class="value-card">
                        <i class="fas fa-laugh-beam"></i>
                        <h3>Divertimento</h3>
                        <p>Perché alla fine, tutto ruota attorno al piacere di leggere una buona storia</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Sezione team -->
        <div class="team-section">
            <h2>Conosci il Nostro Team</h2>
            <p>Persone appassionate che lavorano ogni giorno per portarti i migliori manga</p>
            
            <div class="team-grid">
                <div class="team-member">
                    <img src="images/team1.jpg" alt="Marco Rossi">
                    <h3>Marco Rossi</h3>
                    <p class="position">Fondatore & CEO</p>
                    <p>"I manga hanno cambiato la mia vita e voglio condividere questa magia con il mondo"</p>
                </div>
                
                <div class="team-member">
                    <img src="images/team2.jpg" alt="Anna Bianchi">
                    <h3>Anna Bianchi</h3>
                    <p class="position">Responsabile Acquisti</p>
                    <p>"Seleziono personalmente ogni volume per garantire la migliore qualità"</p>
                </div>
                
                <div class="team-member">
                    <img src="images/team3.jpg" alt="Luigi Verdi">
                    <h3>Luigi Verdi</h3>
                    <p class="position">Responsabile Clienti</p>
                    <p>"La soddisfazione dei nostri clienti è la mia priorità assoluta"</p>
                </div>
                
                <div class="team-member">
                    <img src="images/team4.jpg" alt="Sofia Neri">
                    <h3>Sofia Neri</h3>
                    <p class="position">Social Media Manager</p>
                    <p>"Amo creare una comunità dove i fan possano condividere la loro passione"</p>
                </div>
            </div>
        </div>
        
        <!-- Sezione contatti -->
        <div class="contact-section">
            <h2>Contattaci</h2>
            <p>Hai domande, suggerimenti o vuoi semplicemente condividere la tua passione per i manga? Saremo felici di sentirti!</p>
            
            <div class="contact-info">
                <div class="contact-item">
                    <i class="fas fa-envelope"></i>
                    <span>info@nekopopshop.com</span>
                </div>
                
                <div class="contact-item">
                    <i class="fas fa-phone"></i>
                    <span>+39 02 1234567</span>
                </div>
                
                <div class="contact-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>Via dei Manga, 123 - Milano</span>
                </div>
            </div>
            
            <div class="social-links" style="margin-top: 20px;">
                <a href="#" style="color: #2c3e50; margin: 0 10px; font-size: 1.5rem;"><i class="fab fa-facebook"></i></a>
                <a href="#" style="color: #2c3e50; margin: 0 10px; font-size: 1.5rem;"><i class="fab fa-instagram"></i></a>
                <a href="#" style="color: #2c3e50; margin: 0 10px; font-size: 1.5rem;"><i class="fab fa-twitter"></i></a>
                <a href="#" style="color: #2c3e50; margin: 0 10px; font-size: 1.5rem;"><i class="fab fa-discord"></i></a>
            </div>
        </div>
    </div>
</body>
</html>