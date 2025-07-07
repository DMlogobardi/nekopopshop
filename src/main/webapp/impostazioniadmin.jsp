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
                                    <p class="text-2xl font-bold text-nekored">1,284</p>
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
                                    <p class="text-2xl font-bold text-nekoorange">24</p>
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
                                    <p class="text-2xl font-bold text-nekopeach">547</p>
                                </div>
                            </div>
                        </div>

                        <div class="stats-card bg-nekobeige/20 p-4 rounded-lg border border-nekobeige/30">
                            <div class="flex items-center">
                                <div class="p-3 rounded-full bg-nekobeige/30 text-nekoorange mr-4">
                                    <i class="fas fa-chart-line text-sm"></i>
                                </div>
                                <div>
                                    <p class="text-sm text-gray-600">Fatturato</p>
                                    <p class="text-2xl font-bold text-nekoorange">&#8364 8,742</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Activity -->
                    <div class="p-6 border-t border-gray-200">
                        <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center">
                            <i class="fas fa-history mr-2 text-nekored"></i> Attivit&agrave Recente
                        </h3>
                        <div class="space-y-4">
                            <div class="flex items-start">
                                <div class="flex-shrink-0 mt-1">
                                    <i class="fas fa-user-plus text-green-500"></i>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm text-gray-700">Nuovo utente registrato: Mario Bianchi</p>
                                    <p class="text-xs text-gray-500">2 minuti fa</p>
                                </div>
                            </div>

                            <div class="flex items-start">
                                <div class="flex-shrink-0 mt-1">
                                    <i class="fas fa-shopping-bag text-blue-500"></i>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm text-gray-700">Nuovo ordine #ORD-45678 completato</p>
                                    <p class="text-xs text-gray-500">15 minuti fa</p>
                                </div>
                            </div>

                            <div class="flex items-start">
                                <div class="flex-shrink-0 mt-1">
                                    <i class="fas fa-exclamation-triangle text-yellow-500"></i>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm text-gray-700">Prodotto esaurito: Chainsaw Man Vol.5</p>
                                    <p class="text-xs text-gray-500">1 ora fa</p>
                                </div>
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
