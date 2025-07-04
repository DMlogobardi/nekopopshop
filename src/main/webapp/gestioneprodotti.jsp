<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NekoPopShop - Gestione Prodotti</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/style/gestioneprodotti.css">
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
                        nekoblue: '#3b82f6',
                        nekogreen: '#10b981',
                        nekopurple: '#8b5cf6'
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
        <!-- Logo -->
        <div class="flex items-center">


        </div>

        <!-- Navigation -->

    </div>

    <!-- Admin Content -->
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <!-- Left Sidebar - Admin Menu -->
        <div class="lg:col-span-1">
            <div class="profile-card bg-white border-2 border-nekoblue">
                <!-- Avatar Section -->
                <div class="p-6 text-center">
                    <div class="avatar-upload">
                        <div class="avatar-preview">
                            <div id="imagePreview" style="background-image: url('https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?q=80&w=400');">
                            </div>
                        </div>
                        <div class="avatar-edit">
                            <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                            <label for="imageUpload"><i class="fas fa-camera"></i></label>
                        </div>
                    </div>

                    <h3 class="text-2xl font-bold mt-4 text-gray-800">AdminNeko</h3>
                    <p class="text-gray-600">Amministratore</p>

                    <div class="mt-4 flex justify-center space-x-2">
                        <span class="badge bg-blue-100 text-nekoblue">Super Admin</span>
                    </div>
                </div>




            </div>

            <!-- Quick Actions Card -->
            <div class="profile-card bg-white border-2 border-nekogreen mt-6">
                <div class="bg-gradient-to-r from-nekogreen to-nekoblue p-4">
                    <h3 class="text-lg font-bold text-white flex items-center" style="font-size: 30px">
                        <i class="fas fa-bolt mr-2" style="font-size: 30px"></i> Azioni
                    </h3>
                </div>
                <div class="p-4 space-y-3">
                    <button  id="addProductBtn" class="w-full bg-nekogreen hover:bg-green-600 text-white px-4 py-2 rounded-lg font-bold transition flex items-center justify-center">
                        <i class="fas fa-plus mr-2"></i> Aggiungi Prodotto
                    </button>
                    <button  id="removeProductBtn" class="w-full bg-nekored hover:bg-purple-600 text-white px-4 py-2 rounded-lg font-bold transition flex items-center justify-center">
                        <i class="fas fa-minus mr-2"></i> Rimuovi Prodotto
                    </button>
                    <button  id="modifyProductBtn" class="w-full bg-nekoorange hover:bg-orange-500 text-white px-4 py-2 rounded-lg font-bold transition flex items-center justify-center">
                        <i class="fas fa-edit mr-2"></i> Modifica Prodotto
                    </button>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="lg:col-span-3">
            <!-- Products Management Tab -->
            <div class="tab-content active" id="products-tab">
                <div class="profile-card bg-white border-2 border-nekopurple">
                    <div class="bg-gradient-to-r from-nekopurple to-nekoblue p-4">
                        <div class="flex justify-between items-center">
                            <h2 class="text-xl font-bold text-white flex items-center" style="font-size: 30px">
                                <i class="fas fa-boxes mr-3"></i> Gestione Prodotti
                            </h2>
                            <div class="relative">
                                <input type="text" placeholder="Cerca prodotto..." class="bg-white/20 border border-white/30 text-white rounded-lg px-4 py-2 pl-10 placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white">
                                <i class="fas fa-search absolute left-3 top-3 text-white/70"></i>
                            </div>
                        </div>
                    </div>

                    <div class="p-6">
                        <!-- Filters and Stats -->
                        <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                            <div class="bg-blue-50 p-3 rounded-lg">
                                <div class="text-blue-800 font-bold text-xl">1,248</div>
                                <div class="text-xs text-blue-600">Prodotti Totali</div>
                            </div>
                            <div class="bg-green-50 p-3 rounded-lg">
                                <div class="text-green-800 font-bold text-xl">1,012</div>
                                <div class="text-xs text-green-600">Disponibili</div>
                            </div>
                            <div class="bg-red-50 p-3 rounded-lg">
                                <div class="text-red-800 font-bold text-xl">236</div>
                                <div class="text-xs text-red-600">Esauriti</div>
                            </div>
                            <div class="bg-purple-50 p-3 rounded-lg">
                                <div class="text-purple-800 font-bold text-xl">84</div>
                                <div class="text-xs text-purple-600">In Arrivo</div>
                            </div>
                        </div>

                        <!-- Filters Row -->
                        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-4">
                            <div class="flex flex-wrap gap-2">
                                <select class="bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-nekoblue">
                                    <option>Tutte le categorie</option>
                                    <option>Manga</option>
                                    <option>Action Figure</option>
                                    <option>Merchandising</option>
                                    <option>Accessori</option>
                                </select>
                                <select class="bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-nekoblue">
                                    <option>Tutti gli stati</option>
                                    <option>Disponibile</option>
                                    <option>Esaurito</option>
                                    <option>In arrivo</option>
                                </select>
                                <select class="bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-nekoblue">
                                    <option>Ordina per</option>
                                    <option>Più recenti</option>
                                    <option>Più venduti</option>
                                    <option>Prezzo crescente</option>
                                    <option>Prezzo decrescente</option>
                                </select>
                            </div>
                            <div class="flex items-center">
                                <span class="text-sm text-gray-600 mr-2">Mostra:</span>
                                <select class="bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-nekoblue">
                                    <option>25</option>
                                    <option>50</option>
                                    <option>100</option>
                                    <option>Tutti</option>
                                </select>
                            </div>
                        </div>

                        <!-- Products Table -->
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prodotto</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Categoria</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prezzo</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantità</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Stato</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Azioni</th>
                                </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                <!-- Product 1 -->
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-001</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="flex-shrink-0 h-10 w-10">
                                                <img class="h-10 w-10 rounded" src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=100" alt="Jujutsu Kaisen">
                                            </div>
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900">Jujutsu Kaisen Vol.15</div>
                                                <div class="text-sm text-gray-500">Manga</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full category-manga">Manga</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">€14.99</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">42</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full status-active">Disponibile</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                        <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>

                                <!-- Product 2 -->
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-002</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="flex-shrink-0 h-10 w-10">
                                                <img class="h-10 w-10 rounded" src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=100" alt="Chainsaw Man Figure">
                                            </div>
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900">Denji Chainsaw Man Figurine</div>
                                                <div class="text-sm text-gray-500">Action Figure</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full category-figure">Action Figure</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">€39.99</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">0</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full status-inactive">Esaurito</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                        <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>

                                <!-- Product 3 -->
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-003</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="flex-shrink-0 h-10 w-10">
                                                <img class="h-10 w-10 rounded" src="https://images.unsplash.com/photo-1622372738946-e62b40262c90?q=80&w=100" alt="Demon Slayer T-Shirt">
                                            </div>
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900">Demon Slayer T-Shirt</div>
                                                <div class="text-sm text-gray-500">Merchandising</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full category-merch">Merchandising</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">€24.99</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">15</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full status-active">Disponibile</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                        <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>

                                <!-- Product 4 -->
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-004</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="flex-shrink-0 h-10 w-10">
                                                <img class="h-10 w-10 rounded" src="https://images.unsplash.com/photo-1631729371254-42c2892f0e6e?q=80&w=100" alt="One Piece Vol.100">
                                            </div>
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900">One Piece Vol.100</div>
                                                <div class="text-sm text-gray-500">Manga</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full category-manga">Manga</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">€12.99</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">8</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full status-active">Disponibile</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                        <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>

                                <!-- Product 5 -->
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">#NEKO-005</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <div class="flex-shrink-0 h-10 w-10">
                                                <img class="h-10 w-10 rounded" src="https://images.unsplash.com/photo-1598885154377-4d1dacdd0d5c?q=80&w=100" alt="Naruto Shippuden Figure">
                                            </div>
                                            <div class="ml-4">
                                                <div class="text-sm font-medium text-gray-900">Naruto Shippuden Figure</div>
                                                <div class="text-sm text-gray-500">Action Figure</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full category-figure">Action Figure</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">€49.99</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">0</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 py-1 text-xs rounded-full status-inactive">In arrivo</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <button class="text-nekoblue hover:text-blue-600 mr-3"><i class="fas fa-edit"></i></button>
                                        <button class="text-nekored hover:text-red-600"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <div class="flex items-center justify-between mt-6">
                            <div class="text-sm text-gray-500">
                                Mostrando <span class="font-medium">1</span> a <span class="font-medium">5</span> di <span class="font-medium">1,248</span> prodotti
                            </div>
                            <div class="flex space-x-2">
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                    Precedente
                                </button>
                                <button class="px-3 py-1 rounded-md border border-nekoblue bg-nekoblue text-sm font-medium text-white">
                                    1
                                </button>
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                    2
                                </button>
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                    3
                                </button>
                                <span class="px-3 py-1 text-sm text-gray-500">...</span>
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                    25
                                </button>
                                <button class="px-3 py-1 rounded-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                    Successivo
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Remove Product Modal -->
<div id="removeProductModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 opacity-0 invisible">
    <div class="modal-content bg-white rounded-lg w-full max-w-3xl mx-4">
        <div class="bg-gradient-to-r from-nekored to-nekopeach p-4 rounded-t-lg">
            <div class="flex justify-between items-center">
                <h3 class="text-xl font-bold text-white"><i class="fas fa-plus mr-2"></i> Aggiungi Nuovo Prodotto</h3>
                <button id="closeModalBtn1" class="text-white hover:text-gray-200">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>

        <div class="p-6">
            <form>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Left Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName1">Nome Prodotto</label>
                            <input type="text" id="productName1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productCategory1">Categoria</label>
                            <select id="productCategory1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="">Seleziona una categoria</option>
                                <option value="manga">Manga</option>
                                <option value="figure">Action Figure</option>
                                <option value="merch">Merchandising</option>
                                <option value="accessories">Accessori</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productPrice1">Prezzo (&#8364)</label>
                            <input type="number" step="0.01" id="productPrice1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStock1">Quantità in Stock</label>
                            <input type="number" id="productStock1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStatus1">Stato</label>
                            <select id="productStatus1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="active">Disponibile</option>
                                <option value="inactive">Esaurito</option>
                                <option value="coming">In arrivo</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productSKU1">SKU</label>
                            <input type="text" id="productSKU1" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productImage1">Immagine Prodotto</label>
                            <div class="mt-1 flex items-center">
                                <span class="inline-block h-12 w-12 rounded-md overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                                    </svg>
                                </span>
                                <button type="button" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-nekoblue">
                                    Cambia
                                </button>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productDescription1">Descrizione</label>
                            <textarea id="productDescription1" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue"></textarea>
                        </div>
                    </div>
                </div>

                <div class="flex justify-end mt-6 space-x-3">
                    <button type="button" id="cancelModalBtn1" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Annulla
                    </button>
                    <button type="submit" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Salva Prodotto
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Add Product Modal -->
<div id="addProductModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 opacity-0 invisible">
    <div class="modal-content bg-white rounded-lg w-full max-w-3xl mx-4">
        <div class="bg-gradient-to-r from-nekogreen to-nekoblue p-4 rounded-t-lg">
            <div class="flex justify-between items-center">
                <h3 class="text-xl font-bold text-white"><i class="fas fa-plus mr-2"></i> Aggiungi Nuovo Prodotto</h3>
                <button id="closeModalBtn2" class="text-white hover:text-gray-200">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>

        <div class="p-6">
            <form>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Left Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName2">Nome Prodotto</label>
                            <input type="text" id="productName2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productCategory2">Categoria</label>
                            <select id="productCategory2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="">Seleziona una categoria</option>
                                <option value="manga">Manga</option>
                                <option value="figure">Action Figure</option>
                                <option value="merch">Merchandising</option>
                                <option value="accessories">Accessori</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productPrice2">Prezzo (&#8364)</label>
                            <input type="number" step="0.01" id="productPrice2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStock2">Quantità in Stock</label>
                            <input type="number" id="productStock2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStatus2">Stato</label>
                            <select id="productStatus2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="active">Disponibile</option>
                                <option value="inactive">Esaurito</option>
                                <option value="coming">In arrivo</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productSKU2">SKU</label>
                            <input type="text" id="productSKU2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productImage2">Immagine Prodotto</label>
                            <div class="mt-1 flex items-center">
                                <span class="inline-block h-12 w-12 rounded-md overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                                    </svg>
                                </span>
                                <button type="button" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-nekoblue">
                                    Cambia
                                </button>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productDescription2">Descrizione</label>
                            <textarea id="productDescription2" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue"></textarea>
                        </div>
                    </div>
                </div>

                <div class="flex justify-end mt-6 space-x-3">
                    <button type="button" id="cancelModalBtn2" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Annulla
                    </button>
                    <button type="submit" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Salva Prodotto
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modify Product Modal -->
<div id="modifyProductModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 opacity-0 invisible">
    <div class="modal-content bg-white rounded-lg w-full max-w-3xl mx-4">
        <div class="bg-gradient-to-r from-nekopurple to-nekoblue p-4 rounded-t-lg">
            <div class="flex justify-between items-center">
                <h3 class="text-xl font-bold text-white"><i class="fas fa-plus mr-2"></i> Aggiungi Nuovo Prodotto</h3>
                <button id="closeModalBtn3" class="text-white hover:text-gray-200">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>

        <div class="p-6">
            <form>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- Left Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName3">Nome Prodotto</label>
                            <input type="text" id="productName3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productCategory3">Categoria</label>
                            <select id="productCategory3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="">Seleziona una categoria</option>
                                <option value="manga">Manga</option>
                                <option value="figure">Action Figure</option>
                                <option value="merch">Merchandising</option>
                                <option value="accessories">Accessori</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productPrice3">Prezzo (&#8364)</label>
                            <input type="number" step="0.01" id="productPrice3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStock3">Quantità in Stock</label>
                            <input type="number" id="productStock3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productStatus3">Stato</label>
                            <select id="productStatus3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="active">Disponibile</option>
                                <option value="inactive">Esaurito</option>
                                <option value="coming">In arrivo</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productSKU3">SKU</label>
                            <input type="text" id="productSKU3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productImage3">Immagine Prodotto</label>
                            <div class="mt-1 flex items-center">
                                <span class="inline-block h-12 w-12 rounded-md overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                                    </svg>
                                </span>
                                <button type="button" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-nekoblue">
                                    Cambia
                                </button>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productDescription3">Descrizione</label>
                            <textarea id="productDescription3" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue"></textarea>
                        </div>
                    </div>
                </div>

                <div class="flex justify-end mt-6 space-x-3">
                    <button type="button" id="cancelModalBtn3" class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Annulla
                    </button>
                    <button type="submit" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Salva Prodotto
                    </button>
                </div>
            </form>
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

<script>
    // Modal functionality
    const addProductBtn = document.getElementById('addProductBtn');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const cancelModalBtn = document.getElementById('cancelModalBtn');
    const modal = document.getElementById('addProductModal');

    addProductBtn.addEventListener('click', () => {
        modal.classList.add('active');
        modal.classList.remove('opacity-0', 'invisible');
    });

    const closeModal = () => {
        modal.classList.remove('active');
        modal.classList.add('opacity-0', 'invisible');
    };

    closeModalBtn.addEventListener('click', closeModal);
    cancelModalBtn.addEventListener('click', closeModal);

    // Close modal when clicking outside
    modal.addEventListener('click', (e) => {
        if (e.target === modal) {
            closeModal();
        }
    });

    // Generate cherry blossoms
    function createCherryBlossoms() {
        const decorations = document.getElementById('decorations');
        for (let i = 0; i < 15; i++) {
            const blossom = document.createElement('div');
            blossom.className = 'cherry-blossom';

            // Random position
            const left = Math.random() * 100;
            blossom.style.left = `${left}vw`;

            // Random delay
            const delay = Math.random() * 15;
            blossom.style.animationDelay = `${delay}s`;

            // Random size
            const size = 15 + Math.random() * 15;
            blossom.style.width = `${size}px`;
            blossom.style.height = `${size}px`;

            decorations.appendChild(blossom);
        }
    }

    // Initialize
    document.addEventListener('DOMContentLoaded', () => {
        createCherryBlossoms();
    });
</script>
</body>
</html>