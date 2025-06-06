<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        nekopink: '#fbd8da',
                        nekopeach: '#e55458',
                        nekobeige: '#f2d5bb',
                        nekoorange: '#f29966',
                        nekored: '#f24535',
                        nekopurple: '#9c6ade',
                        kawaiblue: '#6a8cde',
                        kawaililac: '#d8b4fe',
                        adminblue: '#3a86ff',
                        adminindigo: '#5e60ce'
                    }
                }
            }
        }
    </script>
    <style>

        @font-face {
            font-family: 'Milkyway';  /* Scegli un nome per il font */
            src: url('${pageContext.request.contextPath}/frontend/fonts/Milkyway_DEMO.ttf') format('woff2'),  /* Percorso relativo */
            url('${pageContext.request.contextPath}/frontend/fonts/Milkyway_DEMO.ttf') format('woff');
            font-weight: normal;        /* Peso del font (es. 400, 700) */
            font-style: normal;        /* normale, italic, ecc. */
            font-display: swap;        /* Ottimizza il rendering */
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        @keyframes blossom-fall {
            0% { transform: translateY(-50px) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(100vh) rotate(360deg); opacity: 0; }
        }

        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f0f0f0;

            /* Immagine di background principale */
            background-image: url('${pageContext.request.contextPath}/frontend/images/sfondo.png');

            /* Centra e copre tutto lo spazio senza ripetizioni */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;

            /* Altezza minima = viewport height */
            min-height: 100vh;

            /* Fix per mobile: scroll invece di fixed (evita bug su iOS/Android) */
            background-attachment: scroll;

            /* Ottimizzazione prestazioni */
            image-rendering: smooth;
            overflow-x: hidden;
        }
        @media (min-width: 768px) {
            body {
                background-attachment: fixed;
            }
        }


        .folder-tab {
            position: relative;
            background-color: #f2d5bb;
            padding: 15px 25px;
            border-radius: 15px 15px 0 0;
            border: 2px solid #E55458;
            border-bottom: none;
            box-shadow: 0 -3px 8px rgba(229, 84, 88, 0.3);
            margin-right: -10px;
            z-index: 1;
            transition: all 0.3s ease;
            color: #E55458;
        }

        .folder-tab.active, .folder-tab:hover {
            background-color: #E55458;
            color: white;
            transform: translateY(-1px);
            z-index: 2;
        }

        .folder-tab::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 0;
            width: 100%;
            height: 15px;
            background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxNXB4IiB2aWV3Qm94PSIwIDAgMTAwIDUiPiAgPHBhdGggZmlsbD0iI2ZmZDJlNSIgZD0iTTAgMCBMNTAgNSBMIDEwMCAwIFoiLz48L3N2Zz4=');
            background-size: 100% 15px;
            background-position: bottom center;
            background-repeat: no-repeat;
            z-index: -1;
        }

        .cherry-blossom {
            position: absolute;
            width: 30px;
            height: 30px;
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48ZyBmaWxsPSIjZmY3ZWI4Ij48cGF0aCBkPSJNNTAgMTBjLTIyIDAtNDAgMTgtNDAgNDBzMTggNDAgNDAgNDAgNDAtMTggNDAtNDAtMTgtNDAtNDAtNDB6bTAgODFhOSA5IDAgMCAxIDAgMCAwIDkgOSAwIDAgMCAwIDB6Ii8+PHBhdGggZD0iTTIwIDEwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDE4IDAgMiAyIDAgMCAwLTIgMiA5IDkgMCAwIDEtMTggMHoiLz48cGF0aCBkPSJNNjAgMTBhMiAyIDAgMCAwLTItMmE5IDkgMCAwIDEgMCAxOCAyIDIgMCAwIDAgMiAyIDkgOSAwIDAgMSAwLTE4eiIvPjxwYXRoIGQ9Ik0yMCA2MGEyIDIgMCAwIDAtMiAyIDkgOSAwIDAgMSAxOCAwIDIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxLTE4IDB6Ii8+PHBhdGggZD0iTTYwIDYwYTIgMiAwIDAgMC0yIDIgOSA5IDAgMCAxIDAgMTggMiAyIDAgMCAwIDIgMiA5IDkgMCAwIDEgMC0xOHoiLz48L2c+PC9zdmc+');
            background-size: cover;
            animation: blossom-fall 15s linear infinite;
            pointer-events: none;
        }

        .admin-card {
            transition: all 0.3s ease;
            background: #fbd8da;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border: 2px solid rgba(229, 84, 88, 0.1);
        }

        .admin-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(229, 84, 88, 0.15);
            border-color: rgba(229, 84, 88, 0.3);
        }

        .stat-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(229, 84, 88, 0.1);
        }

        .stat-card .progress {
            height: 4px;
            border-radius: 2px;
            overflow: hidden;
            background-color: #f2d5bb;
        }

        .stat-card .progress-bar {
            height: 100%;
            transition: width 0.6s ease;
        }

        .admin-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .admin-table th {
            background-color: #E55458;
            color: white;
            padding: 12px 15px;
            text-align: left;
            position: sticky;
            top: 0;
        }

        .admin-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #f2d5bb50;
            transition: all 0.2s;
        }

        .admin-table tr:last-child td {
            border-bottom: none;
        }

        .admin-table tr:hover td {
            background-color: rgba(229, 84, 88, 0.05);
        }

        .badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .badge-success {
            background-color: rgba(16, 185, 129, 0.1);
            color: #10b981;
            border: 1px solid rgba(16, 185, 129, 0.2);
        }

        .badge-warning {
            background-color: rgba(251, 191, 36, 0.1);
            color: #f59e0b;
            border: 1px solid rgba(251, 191, 36, 0.2);
        }

        .badge-danger {
            background-color: rgba(239, 68, 68, 0.1);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.2);
        }

        .badge-info {
            background-color: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
            border: 1px solid rgba(59, 130, 246, 0.2);
        }

        .badge-primary {
            background-color: rgba(229, 84, 88, 0.1);
            color: #E55458;
            border: 1px solid rgba(229, 84, 88, 0.2);
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            color: #E55458;
            padding: 8px 12px;
            text-decoration: none;
            border: 1px solid #f2d5bb50;
            margin: 0 2px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .pagination a.active {
            background-color: #E55458;
            color: white;
            border-color: #E55458;
        }

        .pagination a:hover:not(.active) {
            background-color: rgba(229, 84, 88, 0.1);
        }

        .sidebar {
            transition: all 0.3s ease;
        }

        .sidebar-item {
            transition: all 0.3s ease;
            border-left: 3px solid transparent;
            position: relative;
        }

        .sidebar-item:hover, .sidebar-item.active {
            background-color: rgba(229, 84, 88, 0.05);
            border-left-color: #E55458;
        }

        .sidebar-item:hover .sidebar-icon, .sidebar-item.active .sidebar-icon {
            color: #E55458;
        }

        .sidebar-icon {
            transition: all 0.3s ease;
            width: 20px;
            text-align: center;
        }

        .form-input {
            border: 2px solid #f2d5bb50;
            border-radius: 8px;
            padding: 10px 15px;
            transition: all 0.3s;
            background-color: white;
        }

        .form-input:focus {
            border-color: #E55458;
            box-shadow: 0 0 0 3px rgba(229, 84, 88, 0.1);
            outline: none;
        }

        .form-label {
            color: #6b7280;
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
        }

        .form-select {
            border: 2px solid #f2d5bb50;
            border-radius: 8px;
            padding: 10px 15px;
            background-color: white;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%23e55458' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            transition: all 0.3s;
        }

        .form-select:focus {
            border-color: #E55458;
            box-shadow: 0 0 0 3px rgba(229, 84, 88, 0.1);
            outline: none;
        }

        .btn-primary {
            background-color: #E55458;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
            border: none;
        }

        .btn-primary:hover {
            background-color: #c43c40;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(229, 84, 88, 0.2);
        }

        .btn-outline {
            background-color: transparent;
            color: #E55458;
            padding: 9px 19px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
            border: 2px solid #E55458;
        }

        .btn-outline:hover {
            background-color: rgba(229, 84, 88, 0.05);
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: #f2d5bb70;
            color: #E55458;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-secondary:hover {
            background-color: #f2d5bb;
            transform: translateY(-2px);
        }

        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            width: 20px;
            height: 20px;
            background-color: #E55458;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.65rem;
            font-weight: 800;
        }

        .dropdown-menu {
            position: absolute;
            right: 0;
            top: 100%;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            min-width: 200px;
            z-index: 100;
            opacity: 0;
            visibility: hidden;
            transform: translateY(10px);
            transition: all 0.3s;
        }

        .dropdown:hover .dropdown-menu {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        .dropdown-item {
            padding: 10px 15px;
            transition: all 0.2s;
            display: flex;
            align-items: center;
        }

        .dropdown-item:hover {
            background-color: rgba(229, 84, 88, 0.05);
            color: #E55458;
        }

        .search-box {
            position: relative;
        }

        .search-box input {
            padding-left: 40px;
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .nav-tabs {
            border-bottom: 2px solid #f2d5bb50;
        }

        .nav-tab {
            padding: 10px 20px;
            margin-right: 5px;
            background-color: white;
            border-radius: 8px 8px 0 0;
            color: #6b7280;
            font-weight: 600;
            transition: all 0.3s;
            border: 2px solid transparent;
            border-bottom: none;
            margin-bottom: -2px;
        }

        .nav-tab.active, .nav-tab:hover {
            background-color: white;
            color: #E55458;
            border-color: #f2d5bb50;
            border-bottom-color: white;
        }

        .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s;
        }

        .modal.active {
            opacity: 1;
            visibility: visible;
        }

        .modal-content {
            background-color: white;
            border-radius: 15px;
            width: 90%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            transform: translateY(-20px);
            transition: all 0.3s;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .modal.active .modal-content {
            transform: translateY(0);
        }

        .modal-header {
            padding: 15px 20px;
            border-bottom: 1px solid #f2d5bb50;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            background-color: white;
            z-index: 10;
        }

        .modal-body {
            padding: 20px;
        }

        .modal-footer {
            padding: 15px 20px;
            border-top: 1px solid #f2d5bb50;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            position: sticky;
            bottom: 0;
            background-color: white;
            z-index: 10;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #6b7280;
            cursor: pointer;
            transition: all 0.2s;
        }

        .close-btn:hover {
            color: #E55458;
        }

        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .alert-success {
            background-color: rgba(16, 185, 129, 0.1);
            color: #10b981;
            border-left: 4px solid #10b981;
        }

        .alert-danger {
            background-color: rgba(239, 68, 68, 0.1);
            color: #ef4444;
            border-left: 4px solid #ef4444;
        }

        .alert-warning {
            background-color: lightyellow;
            color: #f59e0b;
            border-left: 4px solid #f59e0b;
        }

        .alert-info {
            background-color: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
            border-left: 4px solid #3b82f6;
        }

        .alert-icon {
            margin-right: 10px;
            font-size: 1.2rem;
        }

        .order-status {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 8px;
        }

        .status-processing {
            background-color: #3b82f6;
            box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.2);
        }

        .status-shipped {
            background-color: #10b981;
            box-shadow: 0 0 0 2px rgba(16, 185, 129, 0.2);
        }

        .status-delivered {
            background-color: #8b5cf6;
            box-shadow: 0 0 0 2px rgba(139, 92, 246, 0.2);
        }

        .status-cancelled {
            background-color: #ef4444;
            box-shadow: 0 0 0 2px rgba(239, 68, 68, 0.2);
        }

        .status-pending {
            background-color: #f59e0b;
            box-shadow: 0 0 0 2px rgba(245, 158, 11, 0.2);
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .product-img {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
            border: 1px solid #f3f4f6;
        }

        .bg-admin-gradient {
            background: linear-gradient(135deg, #3a86ff, #5e60ce);
        }

        .text-admin-gradient {
            background: linear-gradient(135deg, #e55458, #F29966);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .skeleton-loader {
            background: linear-gradient(90deg, #f3f4f6, #e5e7eb, #f3f4f6);
            background-size: 200% 100%;
            animation: shimmer 1.5s infinite;
            border-radius: 4px;
        }

        @keyframes shimmer {
            0% { background-position: 200% 0; }
            100% { background-position: -200% 0; }
        }

        .skeleton-circle {
            border-radius: 50%;
        }

        .tooltip {
            position: relative;
        }

        .tooltip .tooltip-text {
            visibility: hidden;
            width: 120px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
            font-size: 12px;
            font-weight: normal;
        }

        .tooltip:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
        }

        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
            height: 6px;
        }

        .custom-scrollbar::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: rgba(229, 84, 88, 0.5);
            border-radius: 10px;
        }

        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #E55458;
        }

        .text-3xl{
            font-family: 'Milkyway', sans-serif;
            font-size: 2.5rem;
            color: #333;
        }
        .text-xl{
            font-family: 'Milkyway', sans-serif;
            font-size: 2.5rem;
            color: #333;
        }
        .text-lg{
            font-family: 'Milkyway', sans-serif;
            font-size: 2.5rem;
            color: #333;
        }
        .fa-star, .fas, .far {
            font-style: normal !important;
        }


    </style>
</head>
<body class="relative overflow-x-hidden bg-gray-50">
<!-- Decorative elements -->
<div id="decorations"></div>

<div class="container mx-auto px-4 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">
        <!-- Logo -->
        <div class="flex items-center">
            <div class="relative">
                <div class="absolute -top-3 -right-3 w-12 h-12 rounded-full bg-kawaililac z-10 flex items-center justify-center animate-pulse">
                    <i class="fas fa-shield-alt text-white text-2xl"></i>
                </div>
                <div class="w-16 h-16 rounded-full bg-white border-4 border-white shadow-lg flex items-center justify-center">
                    <i class="fas fa-user-shield text-2xl text-nekopeach"></i>
                </div>
            </div>
            <div class="ml-4">
                <h1 class="text-3xl font-bold" style="font-size: 45px"><span class="text-admin-gradient">Admin Dashboard</span></h1>
                <p class="text-xl text-nekopeach font-semibold">NekoPop Shop Management</p>
            </div>
        </div>

        <!-- Navigation -->
        <div class="w-full lg:w-auto">
            <div class="flex flex-wrap justify-center lg:justify-start -mb-1">
                <a href="index.jsp" class="folder-tab"><i class="fas fa-home mr-2"></i> Home</a>
                <a href="catalog.jsp" class="folder-tab"><i class="fas fa-book mr-2"></i> Catalogo</a>
                <a href="about.jsp" class="folder-tab"><i class="fas fa-info-circle mr-2"></i> Chi Siamo</a>
                <a href="cart.jsp" class="folder-tab"><i class="fas fa-shopping-cart mr-2"></i> Carrello</a>
                <a href="admin.jsp" class="folder-tab active"><i class="fas fa-user-shield mr-2"></i> Admin</a>
                <a href="utente.jsp" class="folder-tab"><i class="fas fa-user mr-2"></i> Utente</a>
            </div>
        </div>

    </div>

    <!-- Admin Dashboard Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Sidebar -->
        <div class="lg:col-span-1">
            <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-4 sticky top-6">
                <!-- User Profile -->
                <div class="flex items-center mb-6 pb-6 border-b border-gray-200">
                    <div class="w-14 h-14 rounded-full bg-gradient-to-br from-adminblue to-adminindigo flex items-center justify-center text-white text-2xl font-bold">
                        AM
                    </div>
                    <div class="ml-4">
                        <h3 class="font-bold text-gray-800">Admin Master</h3>
                        <p class="text-xs text-gray-500">Super Admin <span class="text-xs bg-green-100 text-green-800 px-2 py-0.5 rounded ml-1">Online</span></p>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="space-y-1 mb-6">
                    <a href="gestioneprodotti.jsp" class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach">
                        <i class="fas fa-box sidebar-icon mr-3 text-gray-500"></i>
                        <span>Prodotti</span>
                    </a>
                    <a href="gestioneutenti.jsp" class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach">
                        <i class="fas fa-plus sidebar-icon mr-3 text-gray-500"></i>
                        <span>Aggiungi Prodotto</span>
                    </a>
                    <a href="ordini.jsp" class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach">
                        <i class="fas fa-minus sidebar-icon mr-3 text-gray-500"></i>
                        <span>Rimuovi Prodotto</span>
                    </a>
                    <a href="ordini.jsp" class="sidebar-item flex items-center p-3 rounded-lg text-gray-700 hover:text-nekopeach">
                        <i class="fas fa-edit sidebar-icon mr-3 text-gray-500"></i>
                        <span>Modifica Prodotto</span>
                    </a>
                    </a>
                </nav>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="mt-16 bg-gradient-to-b from-nekoorange to-nekopeach text-white pt-12 pb-8">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <!-- Footer section -->
            <div>
                <div class="flex items-center mb-4">
                    <div class="w-10 h-10 rounded-full bg-white flex items-center justify-center">
                        <i class="fas fa-paw text-nekopink text-2xl"></i>
                    </div>
                    <h4 class="font-bold text-xl ml-3 text-white">NekoPop Shop</h4>
                </div>
                <p class="text-pink-100">Il tuo negozio preferito per manga e action figure, fornito da appassionati per appassionati!</p>
            </div>

            <!-- Footer section -->
            <div>
                <h4 class="font-bold text-lg mb-4 text-white">Contatti</h4>
                <p class="text-pink-100 flex items-center mb-3">
                    <i class="fas fa-map-marker-alt mr-3"></i>
                    <span>Via dei Manga, 123<br>Milano, Italia</span>
                </p>
                <p class="text-pink-100 flex items-center mb-3">
                    <i class="fas fa-phone mr-3"></i> +39 02 1234567
                </p>
                <p class="text-pink-100 flex items-center">
                    <i class="fas fa-envelope mr-3"></i> info@nekopopshop.com
                </p>
            </div>

            <!-- Footer section -->
            <div>
                <h4 class="font-bold text-lg text-white mb-4">Link Utili</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> Assistenza Clienti
                    </a></li>
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> FAQ
                    </a></li>
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> Spedizioni
                    </a></li>
                    <li><a href="#" class="text-pink-100 hover:text-white transition flex items-center">
                        <i class="fas fa-caret-right mr-2"></i> Termini e Condizioni
                    </a></li>
                </ul>
            </div>

            <!-- Footer section -->
            <div>
                <h4 class="font-bold text-lg text-white mb-4">Iscriviti alla Newsletter</h4>
                <div class="flex mt-2">
                    <input type="email" placeholder="Tua email" class="bg-white/20 border border-pink-300 text-white rounded-l-lg px-4 py-3 w-full placeholder-pink-200 focus:outline-none">
                    <button class="bg-white text-nekopink font-bold px-4 rounded-r-lg">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>

                <div class="mt-4">
                    <h5 class="font-bold mb-3">Seguici</h5>
                    <div class="flex space-x-4">
                        <a href="#" class="bg-nekopeach text-nekopink w-10 h-10 rounded-full flex items-center justify-center hover:bg-pink-100 transition">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="bg-nekopeach text-nekopink w-10 h-10 rounded-full flex items-center justify-center hover:bg-pink-100 transition">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" class="bg-nekopeach text-nekopink w-10 h-10 rounded-full flex items-center justify-center hover:bg-pink-100 transition">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="bg-nekopeach text-nekopink w-10 h-10 rounded-full flex items-center justify-center hover:bg-pink-100 transition">
                            <i class="fab fa-discord"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="border-t border-pink-300/30 mt-8 pt-6 text-center text-pink-100">
            <p>&copy; 2023 NekoPopShop. Tutti i diritti riservati.</p>
            <div class="flex justify-center mt-4">
                <div class="flex items-center gap-4">
                    <i class="fab fa-cc-visa text-2xl"></i>
                    <i class="fab fa-cc-mastercard text-2xl"></i>
                    <i class="fab fa-cc-paypal text-2xl"></i>
                    <i class="fab fa-cc-apple-pay text-2xl"></i>
                </div>
            </div>
        </div>
    </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Create floating elements
    function createFloatingElements() {
        const decorations = document.getElementById('decorations');
        const types = ['cherry-blossom', 'cherry-blossom'];
        const colors = ['#ff7eb8', '#ff65a3', '#ff4d8e'];

        for (let i = 0; i < 8; i++) {
            const element = document.createElement('div');
            const type = types[Math.floor(Math.random() * types.length)];
            const color = colors[Math.floor(Math.random() * colors.length)];

            element.className = type;
            element.style.left = Math.random() * 100 + 'vw';
            element.style.animationDuration = (10 + Math.random() * 20) + 's';
            element.style.animationDelay = Math.random() * 5 + 's';
            element.style.opacity = Math.random() * 0.5 + 0.2;
            element.style.transform = 'scale(' + (Math.random() * 0.5 + 0.5) + ')';

            decorations.appendChild(element);
        }
    }

    // Initialize charts
    function initCharts() {
        // Sales Chart
        const salesCtx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(salesCtx, {
            type: 'line',
            data: {
                labels: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom'],
                datasets: [{
                    label: 'Vendite',
                    data: [12, 19, 15, 24, 22, 18, 26],
                    backgroundColor: 'rgba(229, 84, 88, 0.05)',
                    borderColor: '#E55458',
                    borderWidth: 2,
                    tension: 0.4,
                    fill: true,
                    pointBackgroundColor: '#fff',
                    pointBorderColor: '#E55458',
                    pointBorderWidth: 2,
                    pointRadius: 4,
                    pointHoverRadius: 6
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)',
                            drawBorder: false
                        },
                        ticks: {
                            stepSize: 5
                        }
                    },
                    x: {
                        grid: {
                            display: false,
                            drawBorder: false
                        }
                    }
                }
            }
        });

        // Revenue Chart
        const revenueCtx = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(revenueCtx, {
            type: 'bar',
            data: {
                labels: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom'],
                datasets: [{
                    label: 'Guadagni',
                    data: [215, 325, 280, 465, 420, 310, 520],
                    backgroundColor: [
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)',
                        'rgba(229, 84, 88, 0.7)'
                    ],
                    borderColor: [
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)',
                        'rgba(229, 84, 88, 1)'
                    ],
                    borderWidth: 1,
                    borderRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)',
                            drawBorder: false
                        }
                    },
                    x: {
                        grid: {
                            display: false,
                            drawBorder: false
                        }
                    }
                }
            }
        });
    }

    // Modal functions
    function openModal(modalId) {
        document.getElementById(modalId).classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).classList.remove('active');
        document.body.style.overflow = 'auto';
    }

    // Initialize everything when DOM is loaded
    document.addEventListener('DOMContentLoaded', function() {
        createFloatingElements();
        initCharts();

        // Close modal when clicking outside
        const modals = document.querySelectorAll('.modal');
        modals.forEach(modal => {
            modal.addEventListener('click', function(e) {
                if (e.target === modal) {
                    modal.classList.remove('active');
                    document.body.style.overflow = 'auto';
                }
            });
        });

        // Demo notification for skeleton loader
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.display = 'flex';
            });
        }, 1000);
    });
</script>
</div>
</body>
</html>