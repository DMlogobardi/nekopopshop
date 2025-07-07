<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Impostazioni Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/impostazioniadmin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <script src="frontend/Scripts/dashboard_dinamic.js" defer></script>
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
                    }
                }
            }
        }
    </script>

</head>
<body class="relative overflow-x-hidden">
<!-- Decorative elements -->
<div id="decorations"></div>

<div class="container mx-auto px-4 md:px-8 py-6">
    <!-- Top Bar with Logo and Navigation -->
    <div class="flex flex-col lg:flex-row items-center justify-between gap-6 mb-8">


    </div>

        <!-- Main Settings Content -->
        <div class="lg:col-span-3">
            <!-- Dashboard Tab Content -->
            <div id="dashboard-tab" class="tab-content active">
                <div class="profile-card bg-white border-2 border-nekopink overflow-hidden">
                    <!-- Dashboard Header -->
                    <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                        <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                            <i class="fas fa-tachometer-alt mr-3"></i> Dashboard Admin
                        </h2>
                    </div>

                    <!-- Stats Cards -->
                    <div class="p-6 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                        <div class="stats-card bg-nekopink/20 p-4 rounded-lg border border-nekopink/30">
                            <div class="flex items-center">
                                <div class="p-3 rounded-full bg-nekopink/30 text-nekored mr-4">
                                    <i class="fas fa-users text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-600">Utenti Registrati</p>
                                    <p id="utentiReg" class="text-2xl font-bold text-nekored">1,284</p>
                                </div>
                            </div>
                        </div>

                        <div class="stats-card bg-nekobeige/20 p-4 rounded-lg border border-nekobeige/30">
                            <div class="flex items-center">
                                <div class="p-3 rounded-full bg-nekobeige/30 text-nekoorange mr-4">
                                    <i class="fas fa-shopping-cart text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-600">Ordini Oggi</p>
                                    <p id="ordini" class="text-2xl font-bold text-nekoorange">24</p>
                                </div>
                            </div>
                        </div>

                        <div class="stats-card bg-nekopink/20 p-4 rounded-lg border border-nekopink/30">
                            <div class="flex items-center">
                                <div class="p-3 rounded-full bg-nekopink/30 text-nekopeach mr-4">
                                    <i class="fas fa-box-open text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-600">Prodotti</p>
                                    <p id="nProdotti" class="text-2xl font-bold text-nekopeach">547</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
