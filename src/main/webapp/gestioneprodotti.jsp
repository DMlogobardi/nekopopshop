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
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">

            <!-- Main Content -->
            <div class="col-span-1 lg:col-span-4 flex flex-col w-full">
                <div class="tab-content active w-full">
                    <div class="profile-card bg-white border-2 border-nekopink overflow-hidden w-full">
                        <div class="bg-gradient-to-r from-nekored to-nekoorange p-6">
                            <div class="flex flex-col md:flex-row justify-between items-center gap-4">
                                <h2 class="text-xl md:text-2xl lg:text-3xl font-medium text-white flex items-center">
                                    <i class="fas fa-boxes mr-3"></i> Gestione Prodotti
                                </h2>
                                <div class="relative w-full max-w-md">
                                    <input
                                            type="text"
                                            placeholder="Cerca prodotto..."
                                            class="w-full bg-white/20 border border-white/30 text-white rounded-lg px-4 py-2 pl-10 placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-white"
                                    />
                                    <i class="fas fa-search absolute left-3 top-3 text-white/70"></i>
                                </div>
                            </div>
                        </div>
                        <div id="modal" class="p-6"> </div>
                        <div id="view" class="p-6">

                            <!-- Filters and Stats -->
                            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                                <div class="md:col-start-2 md:col-span-2 flex justify-center">
                                    <div class="bg-blue-50 p-3 rounded-lg">
                                        <div id="tot_prod" class="text-blue-800 font-bold text-xl text-center">1,248</div>
                                        <div class="text-xs text-blue-600">Prodotti Totali</div>
                                    </div>
                                </div>
                                <button id="add" class="float-right bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-medium mb-4">
                                    <i class="fas fa-plus ml-2"></i> add
                                </button>
                            </div>

                            <!-- Products Table -->
                            <div class="overflow-x-auto">
                                <p class="text-center text-2xl md:text-3xl lg:text-4xl font-light text-gray-800 mb-4">Manga</p>
                                <div class="mb-4">
                                    <table class="min-w-full divide-y divide-gray-200 w-full table-auto mb-4">
                                        <thead class="bg-gray-50">
                                        <tr>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                ID
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Prodotto
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Categoria
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Prezzo
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Quantità
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Azioni
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody id="tableManga" class="bg-white divide-y divide-gray-200">

                                        </tbody>
                                    </table>
                                </div>
                                <p class="text-center text-2xl md:text-3xl lg:text-4xl font-light text-gray-800 mb-4">Action Figure</p>
                                <div>
                                    <table class="min-w-full divide-y divide-gray-200 w-full table-auto">
                                        <thead class="bg-gray-50">
                                        <tr>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                ID
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Prodotto
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Categoria
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Prezzo
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Quantità
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Azioni
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody id="tableFigure" class="bg-white divide-y divide-gray-200">

                                        </tbody>
                                    </table>
                                </div>
                            </div>


                            <!-- Pagination -->
                            <div class="px-6 pb-6 pt-3">
                                <div class="flex justify-between items-center">
                                    <button id="precProd" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-medium disabled:opacity-50" disabled>
                                        <i class="fas fa-chevron-left mr-2"></i> Precedenti
                                    </button>
                                    <button id="sucProd" class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg font-medium">
                                        Successivi <i class="fas fa-chevron-right ml-2"></i>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

<!-- Add Product Modal -->
<div id="addProductModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div class="modal-content bg-white rounded-lg w-full max-w-3xl mx-4">
        <div class="bg-gradient-to-r from-nekored to-nekoorange p-4 rounded-t-lg">
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
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productCategory2">Categoria</label>
                            <select id="productCategory2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="figure">Action Figure</option>
                                <option value="manga">Manga</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName2">Nome Prodotto</label>
                            <input type="text" id="productName2" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div id="productvolNumDiv" class="mb-4 hidden">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName2">Numero Volume</label>
                            <input type="text" id="productvolNum" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
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
                        <div id="volTagDiv" class="mb-4 hidden">
                            <label class="block text-gray-700 text-sm font-bold mb-2">Tag</label>
                            <select id="volTag" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="">Seleziona una categoria</option>
                                <option value="Shonen">Shonen</option>
                                <option value="Shojo">Shojo</option>
                                <option value="Seinen">Seinen</option>
                                <option value="Kemono">Kemono</option>
                                <option value="Kodomo">Kodomo</option>
                                <option value="Josei">Josei</option>
                                <option value="Sci-Fi">Sci-Fi</option>
                                <option value="Horror">Horror</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2">Autore</label>
                            <input type="text" id="autore" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2">Immagine Prodotto</label>
                            <div class="mt-1 flex items-center space-x-4">
                                <!-- Preview dell'immagine -->
                                <span id="imagePreview" class="inline-block h-16 w-16 rounded-md overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                                    </svg>
                                </span>

                                <!-- Input file -->
                                <input id="imgAdd" type="file" name="productImage2" accept="image/*"
                                       class="block w-full text-sm text-gray-700 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-nekoblue file:text-white hover:file:bg-blue-600" />
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
                    <button type="button" id="addGo" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
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
        <div class="bg-gradient-to-r from-nekored to-nekoorange p-4 rounded-t-lg">
            <div class="flex justify-between items-center">
                <h3 class="text-xl font-bold text-white"><i class="fas fa-edit"></i> Modifica </h3>
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

                        <div id="productvolNumDivModify" class="mb-4 hidden">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productName2">Numero Volume</label>
                            <input type="text" id="productvolNumModify" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
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

                        <div id="tagModify" class="mb-4 hidden">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="productCategory3">Tag</label>
                            <select id="productCategory3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                                <option value="">Seleziona una categoria</option>
                                <option value="Shonen">Shonen</option>
                                <option value="Shojo">Shojo</option>
                                <option value="Seinen">Seinen</option>
                                <option value="Kemono">Kemono</option>
                                <option value="Kodomo">Kodomo</option>
                                <option value="Josei">Josei</option>
                                <option value="Sci-Fi">Sci-Fi</option>
                                <option value="Horror">Horror</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2">autore</label>
                            <input type="text" id="productAutore3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:ring-2 focus:ring-nekoblue">
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2">Immagine Prodotto</label>
                            <div class="mt-1 flex items-center space-x-4">
                                <!-- Preview dell'immagine -->
                                <span id="imagePreviewModify" class="inline-block h-16 w-16 rounded-md overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z" />
                                    </svg>
                                </span>

                                <!-- Input file -->
                                <input type="file" id="imgModify" name="productImage2" accept="image/*"
                                       class="block w-full text-sm text-gray-700 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-nekoblue file:text-white hover:file:bg-blue-600" />
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
                    <button type="button" id="modifyGo" class="bg-nekogreen hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Salva Modifiche
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</body>
</html>
